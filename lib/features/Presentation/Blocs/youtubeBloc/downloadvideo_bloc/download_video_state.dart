part of 'download_video_bloc.dart';

@freezed
class DownloadVideoState with _$DownloadVideoState {
  const factory DownloadVideoState.initial() = _Initial;
  const factory DownloadVideoState.downloadstarted(
    String id,
    bool isloading,
    bool iscomplete,
    String process,
    BehaviorSubject<int> progresscontroller,
  ) = _DownloadStarted;
}
