part of 'youtubeplayer_bloc.dart';

@freezed
class YoutubeplayerEvent with _$YoutubeplayerEvent {
  const factory YoutubeplayerEvent.started() = _Started;
  const factory YoutubeplayerEvent.ytplayerevent(
    List<Video> videos,
    int index,
  ) = _YtPlayerEvent;
  const factory YoutubeplayerEvent.switchevent() = _SwitchEvent;
}
