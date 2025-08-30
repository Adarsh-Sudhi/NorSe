import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'package:audiotagger/audiotagger.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../Domain/UseCases/yt_usecase/getaudiostream_usecase.dart';

part 'ytdownload_event.dart';
part 'ytdownload_state.dart';
part 'ytdownload_bloc.freezed.dart';

class YtdownloadBloc extends Bloc<YtdownloadEvent, YtdownloadState> {
  final Getaudiostreamusecase getaudiostreamusecase;
  YtdownloadBloc(this.getaudiostreamusecase) : super(const _Initial()) {
    StreamController<int> progresscontroller =
        StreamController<int>.broadcast();

    Audiotagger audiotagger = Audiotagger();

    on<_Download>((event, emit) async {
      Directory? downloadsDir =
          Platform.isAndroid
              ? Directory('/storage/emulated/0/Download')
              : await getApplicationDocumentsDirectory();
      emit(const YtdownloadState.loading());

      Directory norseFolder = Directory('${downloadsDir.path}/norse');

      Directory temp = await getTemporaryDirectory();

      String tempDirectory = temp.path;

      AudioOnlyStreamInfo audio = event.audiostream;

      Stream<List<int>> audioStream = YoutubeExplode().videos.streamsClient.get(
        audio,
      );

      String fileName = '${event.info.title}.${audio.container.name}'
          .replaceAll('.webm', '')
          .replaceAll(':', '')
          .replaceAll('.mp4', '')
          .replaceAll(r'\', '')
          .replaceAll('/', '')
          .replaceAll('*', '')
          .replaceAll('?', '')
          .replaceAll('"', '')
          .replaceAll('<', '')
          .replaceAll('>', '')
          .replaceAll('|', '');

      if (norseFolder.existsSync()) {
        String path =
            Platform.isAndroid
                ? "/storage/emulated/0/Download/norse/$fileName.m4a"
                : "${norseFolder.path}/$fileName.m4a";

        String artworkPath = '$tempDirectory/$fileName.jpg';

        await Dio().download(event.info.thumbnails.maxResUrl, artworkPath);

        File file = File(path);

         File img = File(artworkPath);

        if (file.existsSync()) {
          Spaces.showtoast('already exists');
          emit(const YtdownloadState.initial());
        } else {
          IOSink output = file.openWrite(mode: FileMode.writeOnly);

          int len = audio.size.totalBytes;

          int count = 0;

          emit(YtdownloadState.downloading(progresscontroller));

          await for (List<int> data in audioStream) {
            count += data.length;

            int progress = ((count / len) * 100).ceil();

            progresscontroller.add(progress);
            output.add(data);
          }

          await output.close();

          emit(const YtdownloadState.initial());

          Spaces.showtoast('Downloaded $fileName');


          if (Platform.isIOS) {
            await MetadataGod.writeMetadata(
              file: path,
              metadata: Metadata(
                album: 'YouTube',
                title: fileName.replaceAll('.m4a', ''),
                artist: event.info.author,
                year: DateTime.now().year,
                picture: Picture(
                  mimeType: 'image/jpeg',
                  data: img.readAsBytesSync()
                ),
              ),
            ).then((value) => emit(const YtdownloadState.initial()));
          } else {
            String? isSuccess = await audiotagger.getPlatformVersion(
              event.info.title,
              event.info.author,
              'Youtube',
              artworkPath,
              path,
            );
          }

        }
      } else {
        await norseFolder.create(recursive: true);
        String path =
            Platform.isAndroid
                ? "/storage/emulated/0/Download/norse/$fileName.m4a"
                : "${norseFolder.path}/$fileName.m4a";

        String artworkPath = '$tempDirectory/$fileName.jpg';

        await Dio().download(event.info.thumbnails.maxResUrl, artworkPath);

        File file = File(path);

        File img = File(artworkPath);

        if (file.existsSync()) {
          Spaces.showtoast('already exists');
          emit(const YtdownloadState.initial());
        } else {
          IOSink output = file.openWrite(mode: FileMode.writeOnly);

          int len = audio.size.totalBytes;

          int count = 0;

          emit(YtdownloadState.downloading(progresscontroller));

          await for (List<int> data in audioStream) {
            count += data.length;

            int progress = ((count / len) * 100).ceil();

            progresscontroller.add(progress);
            output.add(data);
          }

          await output.close();

          emit(const YtdownloadState.initial());

          Spaces.showtoast("Downloaded $fileName");

          if (Platform.isIOS) {
            await MetadataGod.writeMetadata(
              file: path,
              metadata: Metadata(
                album: 'YouTube',
                title: fileName.replaceAll('.m4a', ''),
                artist: event.info.author,
                year: DateTime.now().year,
                picture: Picture(
                  mimeType: 'image/jpeg',
                  data: img.readAsBytesSync(),
                ),
              ),
            ).then((value) => emit(const YtdownloadState.initial()));
          } else {
            String? isSuccess = await audiotagger.getPlatformVersion(
              event.info.title,
              event.info.author,
              'Youtube',
              artworkPath,
              path,
            );
          }

          /* await MetadataGod.writeMetadata(
            file: path,
            metadata: Metadata(
              album: 'YouTube',
              title: fileName.replaceAll('.m4a', ''),
              artist: event.info.author,
              year: event.info.publishDate!.year,
              picture: Picture(mimeType: 'image/jpeg', data: artworkbytes),
            ),
          ).then((value) => emit(const YtdownloadState.initial())); */
        }
      }
    });
    on<_DownloadSpotify>((event, emit) async {
      String fileName = '${event.title}'
          .replaceAll('.webm', '')
          .replaceAll(':', '')
          .replaceAll('.mp4', '')
          .replaceAll(r'\', '')
          .replaceAll('/', '')
          .replaceAll('*', '')
          .replaceAll('?', '')
          .replaceAll('"', '')
          .replaceAll('<', '')
          .replaceAll('>', '')
          .replaceAll('|', '')
          .replaceAll(',', '')
          .replaceAll('-', '');

      Directory? downloadsDir =
          Platform.isAndroid
              ? Directory('/storage/emulated/0/Download')
              : await getApplicationDocumentsDirectory();

      Directory norseFolder = Directory('${downloadsDir.path}/norse');

      String path =
          Platform.isAndroid
              ? "/storage/emulated/0/Download/norse/$fileName.m4a"
              : "${norseFolder.path}/$fileName.m4a";

      emit(const YtdownloadState.loading());

      Directory temp = await getTemporaryDirectory();

      String tempDirectory = temp.path;

      String artworkPath = '$tempDirectory/${event.title}.jpg';

      await Dio().download(event.arturl, artworkPath);

      File img = File(artworkPath);

      Uint8List artworkbytes = img.readAsBytesSync();

      VideoSearchList searchlist = await YoutubeExplode().search.search(
        event.title,
        filter: TypeFilters.video,
      );

      Video song = searchlist.first;

      final streamManifest = await compute(
        getManifestInIsolate,
        song.id.toString(),
      );

      UnmodifiableListView<AudioOnlyStreamInfo> audioonly =
          streamManifest.audioOnly;

      List<AudioOnlyStreamInfo> res =
          audioonly.where((e) => e.codec.subtype == "mp4").toList();

      AudioOnlyStreamInfo audio = res.withHighestBitrate();

      Stream<List<int>> audioStream = YoutubeExplode().videos.streamsClient.get(
        audio,
      );

      if (await norseFolder.exists()) {
        String path = "${norseFolder.path}/$fileName.m4a";

        String artworkpath = '$tempDirectory/$fileName.jpg';

        await Dio().download(event.arturl, artworkpath);

        File file = File(path);

        if (file.existsSync()) {
          Spaces.showtoast('already exists');
          emit(const YtdownloadState.initial());
        } else {
          IOSink output = file.openWrite(mode: FileMode.writeOnly);

          int len = audio.size.totalBytes;

          int count = 0;

          emit(YtdownloadState.downloading(progresscontroller));

          await for (List<int> data in audioStream) {
            count += data.length;

            int progress = ((count / len) * 100).ceil();

            progresscontroller.add(progress);
            output.add(data);
          }

          await output.close();

          emit(const YtdownloadState.initial());

          if (Platform.isIOS) {
            await MetadataGod.writeMetadata(
              file: path,
              metadata: Metadata(
                album: 'YouTube',
                title: fileName.replaceAll('.m4a', ''),
                artist: event.artists,
                year: DateTime.now().year,
                picture: Picture(mimeType: 'image/jpeg', data: artworkbytes),
              ),
            ).then((value) => emit(const YtdownloadState.initial()));
          } else {
            String? isSuccess = await audiotagger.getPlatformVersion(
              event.title,
              event.artists,
              'Youtube',
              artworkpath,
              path,
            );
          }

          Spaces.showtoast('Downloaded');
        }
      } else {
        await norseFolder.create(recursive: true);
        String path = "${norseFolder.path}/$fileName.m4a";

        File file = File(path);

        if (file.existsSync()) {
          Spaces.showtoast('already exists');
          emit(const YtdownloadState.initial());
        } else {
          IOSink output = file.openWrite(mode: FileMode.writeOnly);

          int len = audio.size.totalBytes;

          int count = 0;

          emit(YtdownloadState.downloading(progresscontroller));

          await for (List<int> data in audioStream) {
            count += data.length;

            int progress = ((count / len) * 100).ceil();

            progresscontroller.add(progress);
            output.add(data);
          }

          await output.close();

          if (Platform.isIOS) {
            await MetadataGod.writeMetadata(
              file: path,
              metadata: Metadata(
                album: 'YouTube',
                title: fileName.replaceAll('.m4a', ''),
                artist: event.artists,
                year: DateTime.now().year,
                picture: Picture(mimeType: 'image/jpeg', data: artworkbytes),
              ),
            ).then((value) => emit(const YtdownloadState.initial()));
          } else {
            String? isSuccess = await audiotagger.getPlatformVersion(
              event.title,
              event.artists,
              'Youtube',
              artworkPath,
              path,
            );
          }

          emit(const YtdownloadState.initial());

          Spaces.showtoast('Downloaded');
        }
      }
    });
  }
}
