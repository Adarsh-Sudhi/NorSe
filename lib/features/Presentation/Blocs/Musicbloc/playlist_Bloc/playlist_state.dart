part of 'playlist_bloc.dart';

@freezed
class PlaylistState with _$PlaylistState {
  const factory PlaylistState.allplaylists(
    List<Map<String,dynamic>> playlists
  ) = _Allplaylist;
  const factory PlaylistState.initial() = _Initial;
}
