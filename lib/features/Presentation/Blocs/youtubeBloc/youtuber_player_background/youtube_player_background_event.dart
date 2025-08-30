part of 'youtube_player_background_bloc.dart';

@freezed
class YoutubePlayerBackgroundEvent with _$YoutubePlayerBackgroundEvent {
  const factory YoutubePlayerBackgroundEvent.started() = _Started;
  const factory YoutubePlayerBackgroundEvent.getinitialized(
     String idortitle,
     String quality,
  ) = _Initialize;
}