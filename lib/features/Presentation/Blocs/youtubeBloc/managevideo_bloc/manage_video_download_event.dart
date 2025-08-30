part of 'manage_video_download_bloc.dart';

@freezed
class ManageVideoDownloadEvent with _$ManageVideoDownloadEvent {
  const factory ManageVideoDownloadEvent.started() = _Started;
  const factory ManageVideoDownloadEvent.addtovideodownload(
    VideoOnlyStreamInfo videoOnlyStreamInfo,
    AudioOnlyStreamInfo audioOnlyStreamInfo,
    Map<String,dynamic> detail
  ) = _AddtoVideoDownload;
  const factory ManageVideoDownloadEvent.getallvideos() = _GetallVideos;
  const factory ManageVideoDownloadEvent.removeVideo(
    String videoid,
  ) = _RemoveVideo;
}
