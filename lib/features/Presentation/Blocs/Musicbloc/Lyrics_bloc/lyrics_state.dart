part of 'lyrics_bloc.dart';

@freezed
class LyricsState with _$LyricsState {
  const factory LyricsState.initial() = _Initial;
  const factory LyricsState.lyrics(
    Map<String, dynamic> lyrics
  ) = _Lyrics;
  const factory LyricsState.loader() = _Loading;
}
