import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/addVideotoDownloadTable_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getallVideosfromDownload_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/removedonwloadfromVideotab_usecase.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:norse/injection_container.dart' as di;

part 'manage_video_download_event.dart';
part 'manage_video_download_state.dart';
part 'manage_video_download_bloc.freezed.dart';

class ManageVideoDownloadBloc
    extends Bloc<ManageVideoDownloadEvent, ManageVideoDownloadState> {
  final AddVideosToDownLoadTableUseCase addVideosToDownLoadTableUseCase;
  final GetAllVidoeFromTableUseCase getallvideosfromtable;
  ManageVideoDownloadBloc(
      {required this.addVideosToDownLoadTableUseCase,
      required this.getallvideosfromtable})
      : super(const _Initial()) {
    RemoveVideoFromDownloadTavUseCase removeVideoFromDownloadTavUseCase =
        di.di<RemoveVideoFromDownloadTavUseCase>();
    on<_AddtoVideoDownload>((event, emit) async {
      VideoOnlyStreamInfo videoOnlyStreamInfo = event.videoOnlyStreamInfo;
      AudioOnlyStreamInfo audioOnlyStreamInfo = event.audioOnlyStreamInfo;
     
      bool isadded = await addVideosToDownLoadTableUseCase.call(
          videoOnlyStreamInfo, audioOnlyStreamInfo,event.detail);
      if (isadded) {
        Spaces.showtoast('Added to Downloads');
      }
      Spaces.showtoast('Failed to add'); 
    });
    on<_GetallVideos>((event, emit) async {
      List<Map<String, dynamic>> videos =
          await getallvideosfromtable.repo.getAddedDownloadVideos();
      if (videos.isEmpty) {
        emit(const ManageVideoDownloadState.videos([]));
      }
      emit(ManageVideoDownloadState.videos(videos));
    });
    on<_RemoveVideo>((event, emit) async {
      bool isremoved =
          await removeVideoFromDownloadTavUseCase.call(event.videoid);
      if (isremoved) {
        add(const _GetallVideos());
      } else {
        add(const _GetallVideos());
        Spaces.showtoast('Failed');
      }
    });
  }
}
