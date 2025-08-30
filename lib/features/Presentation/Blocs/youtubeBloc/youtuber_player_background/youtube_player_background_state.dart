part of 'youtube_player_background_bloc.dart';

@freezed
class YoutubePlayerBackgroundState with _$YoutubePlayerBackgroundState {
  const factory YoutubePlayerBackgroundState.initial() = _Initial;
  const factory YoutubePlayerBackgroundState.loadingBg() = _LoadingBg;
  const factory YoutubePlayerBackgroundState.playBgvideo(
          VideoController controller, Stream<Map<String, Duration>> streams) =
      _PlayBgvideo;
}
