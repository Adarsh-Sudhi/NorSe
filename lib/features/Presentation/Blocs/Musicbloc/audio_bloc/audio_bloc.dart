import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'package:dart_ytmusic_api/yt_music.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getsongs_songsuggestionusecase.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Data/Models/MusicModels/songmodel.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../Data/Models/MusicModels/onlinesongmodel.dart';
import '../../../../Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import '../../../../Domain/Entity/MusicEntity/PlaylistEntity/PlaylistEntity.dart';
import '../../../../Domain/Entity/MusicEntity/SearchSongEntity/SearchEntity.dart';
import 'package:norse/injection_container.dart' as di;

part 'audio_bloc.freezed.dart';
part 'audio_event.dart';
part 'audio_state.dart';

final ytexplode = di.di<YoutubeExplode>();
final ytmusic = di.di<YTMusic>();

// Must be a top-level function (outside any class)
Future<StreamManifest> getManifestInIsolate(String videoId) async {
  final yt = YoutubeExplode();
  final manifest = await yt.videos.streams.getManifest(
    videoId,
    ytClients: [YoutubeApiClient.androidVr, YoutubeApiClient.android],
  );
  return manifest;
}

@pragma('vm:entry-point')
void parseytsuggestionFunction(Map<String, dynamic> arg) async {
  final ytmusic = YTMusic();
  await ytmusic.initialize();

  final ReceivePort mainreceivePort = ReceivePort();
  bool shouldStop = false;

  mainreceivePort.listen((incomingstatus) {
    if (incomingstatus == 'stop') {
      shouldStop = true;
    }
  });

  int processId = arg['pid'];
  int currentId = arg['cid'];
  SendPort sendPort = arg['sp'];
  List<Map<String, dynamic>> videolist = arg['videos'];

  sendPort.send({'sp': mainreceivePort.sendPort, 'status': 'fun'});

  try {
    for (var video in videolist) {
      if (shouldStop || currentId != processId) break;

      final streamManifest = await compute(
        getManifestInIsolate,
        video['id'].toString(),
      );

      if (shouldStop || currentId != processId) break;

      final audioOnlyStreamInfo = streamManifest.audioOnly.firstWhere(
        (e) => e.codec.subtype == "mp4",
      );

      final fullsong = await ytmusic.getSong(video['id'].toString());

      if (shouldStop || currentId != processId) break;

      Map<String, dynamic> newmodel = {
        'id': video['id'],
        'title': fullsong.name,
        'author': fullsong.artist.name,
        'img': video['thumbnailUrl'],
        'url': audioOnlyStreamInfo.url.toString(),
        'album': "Youtube",
        'sp': mainreceivePort.sendPort,
      };

      await Future.delayed(const Duration(milliseconds: 20));
      sendPort.send(newmodel);
    }
  } catch (e) {
    sendPort.send({'error': e.toString()});
  }
}

AudioPlayer audioPlayer = AudioPlayer();

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  AudioBloc() : super(const _Initial()) {
    SendPort? sendPort;
    FlutterIsolate? currentIsolate;

    final ReceivePort mainreceivePort = ReceivePort();

    bool islistening = false;

    //vr
    List<OnlineSongModel> onlinesongs = [];

    //forchecking

    List<OnlineSongModel> onlineaudiosforchecking = [];

    final onlineplayerstreamcontroller = BehaviorSubject<AudioState>();

    //offlinechecking
    List<Songmodel> sourcesforchecking = [];

    //Mainsource
    List<AudioSource> audiosources = [];

    final localplayercontroller = BehaviorSubject<AudioState>();

    //Localsongmodel
    List<Songmodel> song = [];

    //Onlinesongmodel

    final getsuggestionusecase = di.di<GetSongSuggestionUseCase>();

    final ytmusic = di.di<YTMusic>();

    clearall() async {
      song.clear();
      sourcesforchecking.clear();
      audiosources.clear();
    }

    EventTransformer<E> debounce<E>(Duration duration) {
      return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
    }

    parselocalsong(
      List<Map<String, dynamic>> favsongs,
      List<SongModel> songs,
    ) async {
      if (songs.isNotEmpty) {
        for (var item in songs) {
          Songmodel songmodel = Songmodel(
            id: item.id,
            title: "${item.displayNameWOExt}.${item.data}",
            subtitle: item.artist ?? 'unkown',
            uri: item.uri!,
          );

          AudioSource source = AudioSource.uri(
            Uri.parse(songmodel.uri),
            tag: MediaItem(
              id: songmodel.id.toString(),
              title:
                  songmodel.title.contains('storage')
                      ? songmodel.title.split(".")[0]
                      : songmodel.title,
              artist: songmodel.subtitle,
              extras: {},
            ),
          );

          audiosources.add(source);

          song.add(songmodel);

          sourcesforchecking.add(songmodel);
        }
      } else if (favsongs.isNotEmpty) {
        clearall();
        for (var element in favsongs) {
          Songmodel songmodel = Songmodel(
            id: int.parse(element['id']),
            title: element['title'],
            subtitle: element['artist'],
            uri: element['uri'],
          );

          song.add(songmodel);
          sourcesforchecking.add(songmodel);

          AudioSource source = AudioSource.uri(
            Uri.parse(element['uri']),
            tag: MediaItem(
              id: element['id'],
              title: element['title'],
              artist: element['artist'],
            ),
          );
          audiosources.add(source);
        }
      }
    }

    parse({
      required String album,
      required List<Map<String, dynamic>> favsong,
      required List<AlbumSongEntity> allsongs,
      required List<SearchEntity> seachSongs,
      required List<playlistEntity> playlistsongs,
      required int playlistsongindex,
    }) async {
      if (allsongs.isNotEmpty) {
        onlineaudiosforchecking.clear();
        onlinesongs.clear();
        audiosources.clear();

        OnlineSongModel onlineSongModel = OnlineSongModel(
          album: album,
          id: allsongs[0].id,
          title: allsongs[0].name,
          imageurl: allsongs[0].image,
          downloadurl: allsongs[0].songs,
          artist: allsongs[0].primaryArtists,
        );

        onlinesongs.add(onlineSongModel);
        onlineaudiosforchecking.add(onlineSongModel);

        AudioSource source = AudioSource.uri(
          Uri.parse(allsongs[0].songs),
          tag: MediaItem(
            id: allsongs[0].id,
            title: allsongs[0].name,
            artist: allsongs[0].primaryArtists,
            artUri: Uri.parse(allsongs[0].image),
          ),
        );

        audiosources.add(source);

        log('parsing finished');
        return;
      } else if (playlistsongs.isNotEmpty) {
        onlineaudiosforchecking.clear();
        onlinesongs.clear();
        audiosources.clear();

        final initialselectedsong = playlistsongs[playlistsongindex];

        OnlineSongModel onlineSongModel = OnlineSongModel(
          id: initialselectedsong.id,
          title: initialselectedsong.name,
          imageurl: initialselectedsong.images,
          downloadurl: initialselectedsong.downloadUrl,
          album: initialselectedsong.more_info['more_info']['music'],
          artist: initialselectedsong.primaryArtists,
        );

        onlinesongs.add(onlineSongModel);
        onlineaudiosforchecking.add(onlineSongModel);

        AudioSource source = AudioSource.uri(
          Uri.parse(initialselectedsong.downloadUrl),
          tag: MediaItem(
            id: initialselectedsong.id,
            title: initialselectedsong.name,
            artist: initialselectedsong.primaryArtists,
            artUri: Uri.parse(initialselectedsong.images),
          ),
        );
        audiosources.add(source);
        return;
      } else if (seachSongs.isNotEmpty) {
        onlineaudiosforchecking.clear();
        onlinesongs.clear();
        audiosources.clear();

        OnlineSongModel onlineSongModel = OnlineSongModel(
          album: seachSongs[0].moreinfo['music'],
          id: seachSongs[0].id,
          title: seachSongs[0].name,
          imageurl: seachSongs[0].image,
          downloadurl: seachSongs[0].downloadUrl,
          artist: seachSongs[0].primaryArtists,
        );

        onlinesongs.add(onlineSongModel);
        onlineaudiosforchecking.add(onlineSongModel);

        AudioSource source = AudioSource.uri(
          Uri.parse(seachSongs[0].downloadUrl),
          tag: MediaItem(
            id: seachSongs[0].id,
            title: seachSongs[0].name,
            artist: seachSongs[0].primaryArtists,
            artUri: Uri.parse(seachSongs[0].image),
          ),
        );
        audiosources.add(source);
        return;
      }
    }

    on<_Dispose>((event, emit) async {
      audioPlayer.audioSources.clear();
      song.clear();
      song = [];
      onlinesongs.clear();
      onlinesongs = [];
      onlineaudiosforchecking.clear();
      sourcesforchecking.clear();
      song.clear();
      sourcesforchecking = [];
      audiosources.clear();
      audiosources = [];

      await audioPlayer.stop();
      emit(const AudioState.initial());
    });

    on<_GetSuggestionAndParse>(transformer: debounce(Duration(seconds: 4)), (
      event,
      emit,
    ) async {
      log("Clled here");
      if (event.deachSongs.isNotEmpty) {
        List<AlbumSongEntity> songs = await getsuggestionusecase.call(
          event.deachSongs[0].id,
        );

        if (songs.isNotEmpty) {
          for (var element in songs) {
            OnlineSongModel onlineSongModel = OnlineSongModel(
              album: 'empty',
              id: element.id,
              title: element.name,
              imageurl: element.image,
              downloadurl: element.songs,
              artist: element.primaryArtists,
            );
            onlinesongs.add(onlineSongModel);
            onlineaudiosforchecking.add(onlineSongModel);

            AudioSource source = AudioSource.uri(
              Uri.parse(element.songs),
              tag: MediaItem(
                id: element.id,
                title: element.name,
                artist: element.primaryArtists,
                artUri: Uri.parse(element.image),
              ),
            );

            state.maybeMap(
              orElse: () => null,
              onlinesongs: (value) => emit(value.copyWith(audios: onlinesongs)),
            );

            await audioPlayer.addAudioSource(source);
          }
          state.maybeMap(
            orElse: () => null,
            onlinesongs: (value) => emit(value.copyWith(audios: onlinesongs)),
          );
        }
      } else if (event.allsongs.isNotEmpty) {
        log("wokred here");
        List<AlbumSongEntity> songs = await getsuggestionusecase.call(
          event.allsongs[0].id,
        );

        if (songs.isNotEmpty) {
          for (var element in songs) {
            OnlineSongModel onlineSongModel = OnlineSongModel(
              album: 'empty',
              id: element.id,
              title: element.name,
              imageurl: element.image,
              downloadurl: element.songs,
              artist: element.primaryArtists,
            );
            onlinesongs.add(onlineSongModel);
            onlineaudiosforchecking.add(onlineSongModel);

            AudioSource source = AudioSource.uri(
              Uri.parse(element.songs),
              tag: MediaItem(
                id: element.id,
                title: element.name,
                artist: element.primaryArtists,
                artUri: Uri.parse(element.image),
              ),
            );

            state.maybeMap(
              orElse: () => null,
              onlinesongs: (value) => emit(value.copyWith(audios: onlinesongs)),
            );

            await audioPlayer.addAudioSource(source);
          }
        }
      } else if (event.playlistsongs.isNotEmpty) {
        for (var element in event.playlistsongs) {
          OnlineSongModel onlineSongModel = OnlineSongModel(
            album: 'empty',
            id: element.id,
            title: element.name,
            imageurl: element.images,
            downloadurl: element.downloadUrl,
            artist: element.primaryArtists,
          );
          onlinesongs.add(onlineSongModel);
          onlineaudiosforchecking.add(onlineSongModel);

          AudioSource source = AudioSource.uri(
            Uri.parse(element.downloadUrl),
            tag: MediaItem(
              id: element.id,
              title: element.name,
              artist: element.primaryArtists,
              artUri: Uri.parse(element.images),
            ),
          );
          await audioPlayer.addAudioSource(source);
        }
      }
    });

    //offline
    on<_Localaudio>(transformer: debounce(Duration(milliseconds: 400)), (
      event,
      emit,
    ) async {
      await controller0.player.stop();
      Notifiers.showplayer.value = true;

      song.clear();
      song = [];
      sourcesforchecking.clear();
      song.clear();
      onlineaudiosforchecking = [];
      onlinesongs.clear();
      sourcesforchecking = [];
      audiosources.clear();
      audiosources = [];

      await parselocalsong(event.favsongs, event.songs);

      var streams = Rx.combineLatest4(
        audioPlayer.playerStateStream,
        audioPlayer.currentIndexStream,
        audioPlayer.durationStream,
        audioPlayer.positionStream,
        (b, c, stat, pos) =>
            AudioState.LocalStreams(pos, stat ?? Duration.zero, b, c ?? 0),
      );

      streams.listen((event) {
        localplayercontroller.sink.add(event);
      });

      emit(
        AudioState.Localsongs(
          false,
          false,
          song,
          localplayercontroller.stream,
          event.index,
          audioPlayer,
        ),
      );

      await audioPlayer.setAudioSources(
        audiosources,
        initialIndex: event.index,
        initialPosition: Duration.zero,
      );

      await controller0.player.stop();

      await audioPlayer.play();
    });

    //online
    on<_Onlineaudio>(transformer: debounce(Duration(milliseconds: 400)), (
      event,
      emit,
    ) async {
      await controller0.player.stop();
      if (currentIsolate != null && sendPort != null) {
        sendPort!.send("stop");
        currentIsolate!.kill(priority: Isolate.immediate);
        currentIsolate = null;
      }

      onlinesongs.clear();
      onlinesongs = [];
      song.clear();
      onlineaudiosforchecking.clear();
      sourcesforchecking = [];
      audiosources.clear();
      audiosources = [];

      Notifiers.showplayer.value = true;

      state.mapOrNull(
        onlinesongs: (value) => emit(value.copyWith(isloading: true)),
      );

      await parse(
        playlistsongindex: event.index,
        album: event.name,
        favsong: const [],
        allsongs: event.allsongs,
        seachSongs: event.deachSongs,
        playlistsongs: event.playlistsongs,
      );

      emit(
        AudioState.onlinesongs(
          false,
          false,
          onlinesongs,
          onlineplayerstreamcontroller.stream,
          event.index,
          audioPlayer,
        ),
      );

      Stream<AudioState> streams = Rx.combineLatest4(
        audioPlayer.playerStateStream,
        audioPlayer.durationStream,
        audioPlayer.positionStream,
        audioPlayer.currentIndexStream,
        (play, dur, pos, playstate) => AudioState.onlinestreams(
          pos,
          dur ?? Duration(seconds: 0),
          play,
          playstate ?? 0,
        ),
      );

      if (!islistening) {
        streams.listen((event) {
          onlineplayerstreamcontroller.sink.add(event);
        });
      }

      await audioPlayer.setAudioSources(
        audiosources,
        initialIndex: 0,
        initialPosition: Duration(seconds: 0),
        preload: true,
      );

      islistening = true;

      if (event.playlistsongs.isNotEmpty) {
        List<playlistEntity> playlist = List.from(event.playlistsongs);
        playlist.removeAt(event.index);
        add(
          _GetSuggestionAndParse(
            event.allsongs,
            event.deachSongs,
            playlist
          ),
        );
      } else {
        add(
          _GetSuggestionAndParse(
            event.allsongs,
            event.deachSongs,
            event.playlistsongs,
          ),
        );
      }

      log('vyvvchvec');

      await controller0.player.stop();
      await audioPlayer.play();
    });

    on<_Pause>((event, emit) async {
      await audioPlayer.pause();
      await audioPlayer.pause();
    });

    on<_Resume>((event, emit) async => await audioPlayer.play());

    on<_Loopon>(
      (event, emit) async => await audioPlayer.setLoopMode(
        event.islooped ? LoopMode.one : LoopMode.off,
      ),
    );

    on<_Shuffleon>(
      transformer: debounce(Duration(seconds: 1)),
      (event, emit) async => await audioPlayer.setShuffleModeEnabled(
        event.isshuffled ? true : false,
      ),
    );

    on<_Seeknextaudio>(
      transformer: debounce(Duration(milliseconds: 400)),
      (event, emit) async => await audioPlayer.seekToNext(),
    );

    on<_Seekpreviousaudio>(
      transformer: debounce(Duration(milliseconds: 400)),
      (event, emit) async => await audioPlayer.seekToPrevious(),
    );

    on<_Updatequeue>((event, emit) async {
      if (event.mode == 'online') {
        final item = onlinesongs.removeAt(event.oldindex);
        onlinesongs.insert(event.newindex, item);
        final forchecking = onlineaudiosforchecking.removeAt(event.oldindex);
        onlineaudiosforchecking.insert(event.newindex, forchecking);
        await audioPlayer.moveAudioSource(event.oldindex, event.newindex);
      } else {
        final item = song.removeAt(event.oldindex);
        song.insert(event.newindex, item);
        final forchecking = sourcesforchecking.removeAt(event.oldindex);
        sourcesforchecking.insert(event.newindex, forchecking);
        await audioPlayer.moveAudioSource(event.oldindex, event.newindex);
      }
    });

    on<_Removefromqueue>((event, emit) async {
      if (event.mode == 'online') {
        onlinesongs.removeAt(event.indextoberemoved);
        onlineaudiosforchecking.removeAt(event.indextoberemoved);
        await audioPlayer.removeAudioSourceAt(event.indextoberemoved);
      } else {
        sourcesforchecking.removeAt(event.indextoberemoved);
        song.removeAt(event.indextoberemoved);
        await audioPlayer.removeAudioSourceAt(event.indextoberemoved);
      }
    });

    on<_Addsongtoqueue>((event, emit) async {
      if (onlinesongs.isNotEmpty) {
        Spaces.showtoast(" Can't add Offline songs to Online Queue");
      } else {
        Directory temp = await getTemporaryDirectory();
        String tempDirectory = "${temp.path}${event.song.id}.jpg";
        File file = File(tempDirectory);
        String songuri = event.song.uri;
        AudioSource source = AudioSource.uri(
          Uri.parse(songuri),
          tag: MediaItem(
            id: event.song.id.toString(),
            title: event.song.title,
            artist: event.song.subtitle,
            artUri: Uri.directory(file.path),
          ),
        );

        bool isexist = sourcesforchecking.any(
          (element) => element.id == event.song.id,
        );

        if (isexist) {
          Spaces.showtoast('added already');
        } else {
          sourcesforchecking.add(event.song);
          song.add(event.song);
          await audioPlayer.addAudioSource(source);
          Spaces.showtoast('added');
        }
      }
    });

    on<_AddtoOnlinequeue>((event, emit) async {
      if (song.isNotEmpty) {
        Spaces.showtoast("Can't add Online songs to Offline queue");
      } else {
        AudioSource source = AudioSource.uri(
          Uri.parse(event.song.downloadurl),
          tag: MediaItem(
            id: event.song.id.toString(),
            title: event.song.title,
            artist: event.song.artist,
            artUri: Uri.parse(event.song.imageurl),
          ),
        );

        bool isexist = onlineaudiosforchecking.any(
          (element) => element.id == event.song.id,
        );

        if (isexist) {
          Spaces.showtoast('already exists');
        } else {
          onlineaudiosforchecking.add(event.song);
          onlinesongs.add(event.song);
          await audioPlayer.addAudioSource(source);
          Spaces.showtoast('added');
        }
      }
    });

    on<_Clearqueueexceptplaying>((event, emit) async {
      if (event.mode == 'online') {
        for (var i = audioPlayer.audioSources.length - 1; i >= 0; i--) {
          if (i == event.currentplaying) {
            continue;
          } else {
            onlineaudiosforchecking.removeAt(i);
            onlinesongs.removeAt(i);
            await audioPlayer.removeAudioSourceAt(i);
          }
        }
      } else {
        for (var i = audioPlayer.audioSources.length - 1; i >= 0; i--) {
          if (i == event.currentplaying) {
            continue;
          } else {
            sourcesforchecking.removeAt(i);
            song.removeAt(i);
            await audioPlayer.removeAudioSourceAt(i);
          }
        }
      }
    });
    on<_ClearSpecificAudio>((event, emit) async {
      if (song.isNotEmpty && sourcesforchecking.isNotEmpty) {
        int index = sourcesforchecking.indexWhere(
          (element) => element.id == event.id,
        );
        int index1 = song.indexWhere((element) => element.id == event.id);
        sourcesforchecking.removeAt(index);
        song.removeAt(index1);
        await audioPlayer.removeAudioSourceAt(index);
      }
    });

    EventTransformer<StartProcessEvent> debounceAndCancelTransformer<
      StartProcessEvent
    >({required Duration debounceDuration}) {
      return (events, mapper) =>
          events.debounceTime(debounceDuration).switchMap(mapper);
    }

    int processId = -1;

    on<_Ytmusiclisten>(
      transformer: debounceAndCancelTransformer(
        debounceDuration: Duration(milliseconds: 500),
      ),
      (event, emit) async {
        processId++;
        final currentId = processId;

        await controller0.player.stop();

        try {
          if (currentIsolate != null && sendPort != null) {
            sendPort!.send("stop");
            currentIsolate!.kill(priority: Isolate.immediate);
            currentIsolate = null;
          }

          await audioPlayer.pause();
          Notifiers.showplayer.value = true;

          Video video = event.video[event.index];

          emit(
            AudioState.loading(
              await Spaces().Gethumbnail(video.thumbnails),
              video.title,
              video.author,
            ),
          );

          // Clear only — no need to reassign
          onlinesongs.clear();
          song.clear();
          onlineaudiosforchecking.clear();
          sourcesforchecking.clear();
          audiosources.clear();

          if (currentIsolate != null && sendPort != null) {
            sendPort!.send("stop");
            currentIsolate!.kill(priority: Isolate.immediate);
            currentIsolate = null;
          }

          // Combine stream for player state
          Stream<AudioState> streams = Rx.combineLatest4(
            audioPlayer.playerStateStream,
            audioPlayer.durationStream,
            audioPlayer.positionStream,
            audioPlayer.currentIndexStream,
            (play, dur, pos, playstate) => AudioState.onlinestreams(
              pos,
              dur ?? Duration.zero,
              play,
              playstate ?? 0,
            ),
          );

          if (!islistening) {
            streams.listen((event) {
              onlineplayerstreamcontroller.sink.add(event);
            });
            islistening = true;
          }

          // Cancel check
          if (currentId != processId) return;

          final streamManifest = await compute(
            getManifestInIsolate,
            video.id.toString(),
          );

          if (currentId != processId) return;

          final audioOnlyStreamInfo = streamManifest.audioOnly.firstWhere(
            (e) => e.codec.subtype == "mp4",
          );

          final songyt = await ytmusic.getSong(video.id.toString());

          if (currentId != processId) return;

          final image = await Spaces().Gethumbnail(video.thumbnails);

          if (currentId != processId) return;

          final onlineSongModel0 = OnlineSongModel(
            album: video.author,
            id: video.id.toString(),
            title: songyt.name,
            imageurl: image,
            downloadurl: audioOnlyStreamInfo.url.toString(),
            artist: songyt.artist.name,
          );

          onlinesongs.add(onlineSongModel0);
          onlineaudiosforchecking.add(onlineSongModel0);

          emit(
            AudioState.ytmusic(
              video,
              event.index,
              false,
              false,
              onlineplayerstreamcontroller.stream,
              onlinesongs,
              audioPlayer,
            ),
          );

          state.mapOrNull(
            ytmusic:
                (value) =>
                    emit(value.copyWith(songs: onlinesongs, isloading: false)),
          );

          if (currentId != processId) return;

          await audioPlayer.setAudioSource(
            AudioSource.uri(
              audioOnlyStreamInfo.url,
              tag: MediaItem(
                id: video.id.toString(),
                title: video.title,
                artist: video.author,
                artUri: Uri.parse(video.thumbnails.standardResUrl),
              ),
            ),
          );

          // Still same process? Then proceed

          // if (currentId == processId) {
          add(_Getytsuggestionandparse(event.video, video, event.types));
          //  }

          await audioPlayer.play();

          state.mapOrNull(
            ytmusic: (value) => emit(value.copyWith(isloading: false)),
          );

          await audioPlayer.play();
        } catch (e) {
          log('Error in _Ytmusiclisten: $e');
        }
      },
    );

    on<_Started>((event, emit) async {});

    mainreceivePort.listen((onlineSongModel0) async {
      onlineSongModel0['sp'] != null ? sendPort = onlineSongModel0['sp'] : null;

      OnlineSongModel onlineSongModel = OnlineSongModel(
        id: onlineSongModel0['id'],
        title: onlineSongModel0['title'],
        imageurl: onlineSongModel0['img'],
        downloadurl: onlineSongModel0['url'],
        album: "Youtube",
        artist: onlineSongModel0['author'] ?? 'unknown',
      );
      onlinesongs.add(onlineSongModel);
      onlineaudiosforchecking.add(onlineSongModel);
      await audioPlayer.addAudioSource(
        AudioSource.uri(
          Uri.parse(onlineSongModel.downloadurl),
          tag: MediaItem(
            id: onlineSongModel.id,
            title: onlineSongModel.title,
            artist: onlineSongModel.artist,
            artUri: Uri.parse(onlineSongModel.imageurl),
          ),
        ),
      );
    });

    on<_Getytsuggestionandparse>((event, emit) async {
      final currentId = processId;
      log('loop started');

      List<Map<String, Object?>> videoListMap = [];

      if (event.types == 'p') {
        for (var video in event.videos) {
          if (video.id.toString() == event.video.id.toString()) {
            continue;
          }
          final e = {
            'id': video.id.value,
            'title': video.title,
            'author': video.author,
            'duration': video.duration?.inSeconds,
            'thumbnailUrl': video.thumbnails.maxResUrl,
          };

          videoListMap.add(e);
        }
      } else if (event.types == 's') {
        final relatedvideo = await ytexplode.videos.getRelatedVideos(
          event.video,
        );

        final videos = relatedvideo ?? event.videos;

        for (var video in videos) {
          final e = {
            'id': video.id.value,
            'title': video.title,
            'author': video.author,
            'duration': video.duration?.inSeconds,
            'thumbnailUrl': video.thumbnails.maxResUrl,
          };

          videoListMap.add(e);
        }
      }

      // Isolate(controlPort).

      currentIsolate = await FlutterIsolate.spawn(parseytsuggestionFunction, {
        'pid': processId,
        'cid': currentId,
        'videoid': event.video.id.toString(),
        'videos': videoListMap,
        'sp': mainreceivePort.sendPort,
      });
    });
  }
}
