import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metadata_god/metadata_god.dart';
//import 'package:metadata_god/metadata_god.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/DownloadArtwork_UseCase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/DownloadSong_UseCase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/shownotification_usecase.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../configs/constants/Spaces.dart';
import 'package:norse/injection_container.dart' as di;
import 'package:audiotagger/audiotagger.dart';

part 'download_song_event.dart';
part 'download_song_state.dart';

class DownloadSongBloc extends Bloc<DownloadSongEvent, DownloadSongState> {
  final DownloadSongUseCase downloadSongUseCase;
  final DownloadArworkUseCase downloadArworkUseCase;
  DownloadSongBloc(this.downloadSongUseCase, this.downloadArworkUseCase)
    : super(DownloadSongInitial()) {
    List<Map<String, dynamic>> streams = [];

    Audiotagger audiotagger = Audiotagger();

    additem(String id, int index, bool isloading) async {
      if (!streams.any((element) => element['id'] == id)) {
        final StreamController<double> controller =
            StreamController<double>.broadcast();

        Map<String, dynamic> m = {
          'id': id,
          'stream': controller,
          'loading': false,
        };

        streams.add(m);
      }
    }

    final Shownotificationusecase shownotificationusecase =
        di.di<Shownotificationusecase>();

    on<DownloadStated>((event, emit) async {
      Directory? downloadsDir =
          Platform.isIOS
              ? await getApplicationDocumentsDirectory()
              : Directory('/storage/emulated/0/Download');
      await additem(event.key, event.itemstreamindex, true);
      try {
        for (var i = 0; i < 1; i++) {
          (streams.firstWhere((element) => element['id'] == event.key)['stream']
                  as StreamController<double>)
              .add(i.toDouble());
        }
        emit(DownloadSongStarted(streams: streams));
        Directory temp = await getTemporaryDirectory();

        if (await downloadsDir.exists()) {
          Directory norseFolder = Directory('${downloadsDir.path}/norse');

          if (await norseFolder.exists()) {
            log('Folder already exists: ${norseFolder.path}');

            String path =
                Platform.isAndroid
                    ? "/storage/emulated/0/Download/norse/${event.songname.replaceAll('?', '')}.m4a"
                    : "${norseFolder.path}/${event.songname.replaceAll('?', '')}.m4a";
            String artworkpath = '${temp.path}/${event.albumname}.jpg';
            File file = File(path);
            if (file.existsSync()) {
              Spaces.showtoast('File exists in $path');
            } else {
              try {
                emit(DownloadSongStarted(streams: streams));
                await downloadSongUseCase.call(event.url, (count, total) async {
                  double progress = (count / total) * 100;
                  (streams.firstWhere(
                            (element) => element['id'] == event.key,
                          )['stream']
                          as StreamController<double>)
                      .add(progress);
                }, path);

                await downloadArworkUseCase.call(
                  event.artworkurl,
                  (count, total) {},
                  artworkpath,
                );

                await shownotificationusecase.call(
                  0.0,
                  event.itemstreamindex,
                  event.songname,
                  'null',
                );

                if (Platform.isIOS) {
                  await MetadataGod.writeMetadata(
                    file: path,
                    metadata: Metadata(
                      title: event.songname,
                      artist: event.artists,
                      albumArtist: event.artists,
                      album: event.albumname,
                      picture: Picture(
                        mimeType: 'image/jpeg',
                        data: File(artworkpath).readAsBytesSync(),
                      ),
                    ),
                  );
                } else {
                  String? isSuccess = await audiotagger.getPlatformVersion(
                    event.songname,
                    event.artists,
                    event.albumname,
                    artworkpath,
                    path,
                  );

                  log(isSuccess ?? "Failed");
                }

                /* await MetadataGod.writeMetadata(
                    file: path,
                    metadata: Metadata(
                      title: event.songname,
                      artist: event.artists,
                      albumArtist: event.artists,
                      album: event.albumname,
                      picture: Picture(
                        mimeType: 'image/jpeg',
                        data: File(artworkpath).readAsBytesSync(),
                      ),
                    ),
                  );*/

                emit(DownloadSongFinished());
                for (int i = streams.length - 1; i >= 0; i--) {
                  if (streams[i]['id'] == event.key) {
                    streams.removeAt(i);
                  }
                }
              } catch (e) {
                log(e.toString());
              }
            }
          } else {
            await norseFolder.create(recursive: true);
            String path =
                Platform.isAndroid
                    ? "/storage/emulated/0/Download/norse/${event.songname.replaceAll('?', '')}.m4a"
                    : "${norseFolder.path}/${event.songname.replaceAll('?', '')}.m4a";
            String artworkpath = '${temp.path}/${event.albumname}.jpg';
            File file = File(path);
            if (file.existsSync()) {
              Spaces.showtoast('File exists in $path');
            } else {
              try {
                emit(DownloadSongStarted(streams: streams));
                await downloadSongUseCase.call(event.url, (count, total) async {
                  double progress = (count / total) * 100;
                  (streams.firstWhere(
                            (element) => element['id'] == event.key,
                          )['stream']
                          as StreamController<double>)
                      .add(progress);
                }, path);

                await downloadArworkUseCase.call(
                  event.artworkurl,
                  (count, total) {},
                  artworkpath,
                );

                //   Tag tag = Tag(
                //     title: event.songname,
                //     artist: event.artists,
                //     artwork: artworkpath,
                //    album: event.albumname,
                //     comment: 'norse',
                //   );

                await shownotificationusecase.call(
                  0.0,
                  event.itemstreamindex,
                  event.songname,
                  'null',
                );

                if (Platform.isIOS) {
                  await MetadataGod.writeMetadata(
                    file: path,
                    metadata: Metadata(
                      title: event.songname,
                      artist: event.artists,
                      albumArtist: event.artists,
                      album: event.albumname,
                      picture: Picture(
                        mimeType: 'image/jpeg',
                        data: File(artworkpath).readAsBytesSync(),
                      ),
                    ),
                  );
                } else {
                  String? isSuccess = await audiotagger.getPlatformVersion(
                    event.songname,
                    event.artists,
                    event.albumname,
                    artworkpath,
                    path,
                  );

                  log(isSuccess ?? "Failed");
                }

                /*await MetadataGod.writeMetadata(
                  file: path,
                  metadata: Metadata(
                    title: event.songname,
                    artist: event.artists,
                    albumArtist: event.artists,
                    album: event.albumname,
                    picture: Picture(
                      mimeType: 'image/jpeg',
                      data: File(artworkpath).readAsBytesSync(),
                    ),
                  ),
                ); */

                emit(DownloadSongFinished());
                //   await tagger.writeTags(path: path, tag: tag);
                for (int i = streams.length - 1; i >= 0; i--) {
                  if (streams[i]['id'] == event.key) {
                    streams.removeAt(i);
                  }
                }
              } catch (e) {
                log(e.toString());
              }
            }
          }
        } else {
          log('Downloads directory not found');
        }
      } catch (e) {
        log(e.toString());
      }
    }, transformer: concurrent());
  }
}
