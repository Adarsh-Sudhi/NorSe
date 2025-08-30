part of 'manage_video_download_bloc.dart';

@freezed
class ManageVideoDownloadState with _$ManageVideoDownloadState {
  const factory ManageVideoDownloadState.initial() = _Initial;
  const factory ManageVideoDownloadState.videos(
      List<Map<String, dynamic>> videos) = _Videos;
}
