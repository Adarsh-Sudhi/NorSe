import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ffmpeg_kit_flutter_new_min/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new_min/ffmpeg_session.dart';
//import 'package:ffmpeg_kit_flutter_new_min/ffmpeg_kit.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/injection_container.dart' as di;
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart' as p;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../../configs/Error/Errors.dart';
import '../../../../Data/DataSource/RemoteDataSource/saavn/APIremotedatasource.dart';
import '../../../../Domain/UseCases/API_UseCase/DownloadSong_UseCase.dart';

part 'download_video_event.dart';
part 'download_video_state.dart';
part 'download_video_bloc.freezed.dart';

class DownloadVideoBloc extends Bloc<DownloadVideoEvent, DownloadVideoState> {
  final DownloadSongUseCase downloadSongUseCase;
  DownloadVideoBloc({required this.downloadSongUseCase}) : super(_Initial()) {
    BehaviorSubject<int> audioProgressController = BehaviorSubject();

    YoutubeExplode yt = di.di<YoutubeExplode>();
    APIremoteDatasource streams = di.di<APIremoteDatasource>();

    proccessAudioDownload(
      AudioOnlyStreamInfo audioOnlyStreamInfo,
      String filename,
    ) async {
      Stream<List<int>> audioStream = YoutubeExplode().videos.streamsClient.get(
        audioOnlyStreamInfo,
      );

      Directory directory = await getApplicationDocumentsDirectory();

      String path =
          Platform.isAndroid
              ? "/storage/emulated/0/Download/$filename.m4a"
              : "${directory.path}/norse/$filename.m4a";

      File file = File(path);

      IOSink output = file.openWrite(mode: FileMode.writeOnly);

      int len = audioOnlyStreamInfo.size.totalBytes;

      int count = 0;

      await for (List<int> data in audioStream) {
        count += data.length;

        int progress = ((count / len) * 100).ceil();

        audioProgressController.add(progress);

        output.add(data);
      }

      await output.close();
    }

    on<_DownloadVideo>((event, emit) async {
      Directory directory = await getApplicationDocumentsDirectory();
      emit(
        DownloadVideoState.downloadstarted(
          event.id,
          false,
          false,
          'Fetching video informations, please wait...',
          audioProgressController,
        ),
      );

      Either<Failures, List<VideoOnlyStreamInfo>> videoOnly = await streams
          .getManifest(event.id);

      emit(
        DownloadVideoState.downloadstarted(
          event.id,
          false,
          false,
          'Fetching audio informations, please wait...',
          audioProgressController,
        ),
      );

      Either<Failures, List<AudioOnlyStreamInfo>> audioOnly = await streams
          .getstream(event.id);

      await videoOnly.fold(
        (videofailed) async {
          Spaces.showtoast(
            'Unable to fetch video info at the moment , please try again later',
          );
          emit(const DownloadVideoState.initial());
        },
        (videosuccess) async {
          VideoOnlyStreamInfo videoOnlyStreamInfo = videosuccess.firstWhere(
            (e) =>
                e.size.totalBytes.toString() == event.size.toInt().toString(),
          );

          await audioOnly.fold(
            (audiofailed) async {
              Spaces.showtoast(
                'Unable to fetch audio info at the moment , please try again later',
              );
              emit(const DownloadVideoState.initial());
            },
            (audiosuccess) async {
              final audiotoedownloaded = audiosuccess.withHighestBitrate();
              String title = event.title
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
                  .replaceAll(' ', '')
                  .replaceAll(')', '')
                  .replaceAll('(', '')
                  .replaceAll('.', '')
                  .replaceAll('-', '');

              final filePath = p.join(
                Platform.isAndroid
                    ? '/storage/emulated/0/Download/'
                    : "${directory.path}/norse/",
                '$title.${videoOnlyStreamInfo.container.name}',
              );

              File filee =
                  Platform.isAndroid
                      ? File("/storage/emulated/0/Download/out$title.mp4")
                      : File("${directory.path}/norse/out$title.mp4");

              if (await filee.exists()) {
                Spaces.showtoast('Video Already Downloaded');
                emit(const DownloadVideoState.initial());
              } else {
                emit(
                  DownloadVideoState.downloadstarted(
                    event.id,
                    false,
                    false,
                    'Video Download in progress, please wait...',
                    audioProgressController,
                  ),
                );

                Stream<List<int>> stream = yt.videos.streamsClient.get(
                  videoOnlyStreamInfo,
                );

                int downloadedBytes = 0;
                int totalBytes = videoOnlyStreamInfo.size.totalBytes;

                File file = File(filePath);
                final filestream = file.openWrite();

                await stream.listen((data) {
                  downloadedBytes += data.length;
                  int progress = ((downloadedBytes / totalBytes) * 100).toInt();

                  audioProgressController.sink.add(progress);

                  filestream.add(data);
                }, cancelOnError: true).asFuture();

                state.mapOrNull(
                  downloadstarted:
                      (value) => emit(
                        value.copyWith(process: "Video Download Completed"),
                      ),
                );

                state.mapOrNull(
                  downloadstarted:
                      (value) => emit(
                        value.copyWith(
                          process:
                              "Audio Download in progress , please wait...",
                        ),
                      ),
                );

                await filestream.flush();

                await filestream.close();

                String fileName =
                    '${event.title}.${audiosuccess[0].container.name}'
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
                        .replaceAll(' ', '')
                        .replaceAll('-', '');

                await proccessAudioDownload(audiotoedownloaded, fileName);

                state.mapOrNull(
                  downloadstarted:
                      (value) => emit(
                        value.copyWith(
                          process: 'Audio Downloaded Successfully',
                        ),
                      ),
                );

                state.mapOrNull(
                  downloadstarted:
                      (value) => emit(
                        value.copyWith(
                          isloading: true,
                          process: 'Merging in progress, please wait...',
                        ),
                      ),
                );

                final vpath =
                    Platform.isAndroid
                        ? "/storage/emulated/0/Download/out$title.mp4"
                        : "${directory.path}/norse/out$fileName.m4a";

                final apath =
                    Platform.isAndroid
                        ? "/storage/emulated/0/Download/$fileName.m4a"
                        : "${directory.path}/norse/$fileName.m4a";
                ;

                final opath = filePath;

                String command =
                    '-i $opath -i $apath -c:v copy -c:a aac -strict experimental $vpath';

                FFmpegSession fFmpegSession = await FFmpegKit.execute(command);

                final returnCode = await fFmpegSession.getReturnCode();

                File audio = File(apath);
                await audio.delete();
                File vid = File(opath);
                await vid.delete();

                state.mapOrNull(
                  downloadstarted:
                      (value) => emit(
                        value.copyWith(
                          isloading: true,
                          process: 'Merging Complete',
                        ),
                      ),
                );

                emit(const DownloadVideoState.initial());

                /*  onDone(() async {
                state.mapOrNull(downloadstarted: (value) => emit(value.copyWith(process: "Video Download Completed")),);
                state.mapOrNull(downloadstarted: (value) => emit(value.copyWith(process: "Audio Download In progress")),);
                await filestream.flush();
                await filestream.close();

              

              String fileName = '${event.title}.${audiosuccess[0].container.name}'
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
                  .replaceAll(' ', '')
                  .replaceAll('-', '');

                  dev.log('Worked here');
              


              
             await proccessAudioDownload(audiosuccess[0], fileName)
                  .then((value) async {
                state.mapOrNull(
                  downloadstarted: (value) => emit(
                      value.copyWith(process: 'Audio Downloaded Successfully')),
                );
                state.mapOrNull(
                    downloadstarted: (value) => emit(value.copyWith(
                        isloading: true,
                        process: 'Merging in progress, please wait...')));

                Future.delayed(const Duration(seconds: 1)).then((value) async {
                  final vpath = "/storage/emulated/0/Download/out$title.mp4";

                  final apath = "/storage/emulated/0/Download/$fileName.m4a";
                  final opath = filePath;

                  String command =
                      "-i '$opath' -i '$apath' -c:v copy -c:a aac -strict experimental '$vpath'";

                  FFmpegKit.execute(command).then((session) async {
                    final returnCode = await session.getReturnCode();

                    if (ReturnCode.isSuccess(returnCode)) {
                      File audio = File(apath);
                      await audio.delete();
                      File vid = File(opath);
                      await vid.delete();
                      await shownotificationusecase.call(
                          0.0, event.size.toInt(), title, event.author);
                      state.mapOrNull(
                          downloadstarted: (value) => emit(value.copyWith(
                              isloading: true, process: 'Merging Complete')));
                    } else if (ReturnCode.isCancel(returnCode)) {
                      Spaces.showtoast('Failed to Merge');
                    } else {
                      Spaces.showtoast('Failed to Merge');
                    }
                  });

                  emit(const DownloadVideoState.initial());
                });
              });
              
             
           } );   */
              }
            },
          );
        },
      );
    });
  }
}
