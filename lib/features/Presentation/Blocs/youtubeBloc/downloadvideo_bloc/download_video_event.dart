part of 'download_video_bloc.dart';

@freezed
class DownloadVideoEvent with _$DownloadVideoEvent {
  const factory DownloadVideoEvent.started() = _Started;
  const factory DownloadVideoEvent.downloadvideo(
    String url,
    String id,
    String qualitylebal,
    double size,
    String author,
    String title,
  ) = _DownloadVideo;
}
