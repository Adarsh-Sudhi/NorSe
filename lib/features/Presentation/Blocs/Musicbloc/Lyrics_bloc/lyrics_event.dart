part of 'lyrics_bloc.dart';

@freezed
class LyricsEvent with _$LyricsEvent {
  const factory LyricsEvent.started() = _Started;
  const factory LyricsEvent.getlyrics(
    String id,
    String title,
  ) = _Getlyrics;
}