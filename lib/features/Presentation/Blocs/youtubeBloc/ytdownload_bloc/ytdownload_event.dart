part of 'ytdownload_bloc.dart';

@freezed
class YtdownloadEvent with _$YtdownloadEvent {
  const factory YtdownloadEvent.started() = _Started;
  const factory YtdownloadEvent.downloadsong(
      AudioOnlyStreamInfo audiostream, Video info, String id) = _Download;
  const factory YtdownloadEvent.downloadsongspotify(
       String title,String artists,String arturl) = _DownloadSpotify;
}
