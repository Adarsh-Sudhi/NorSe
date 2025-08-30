part of 'playlistsongs_bloc.dart';

@freezed
class PlaylistsongsState with _$PlaylistsongsState {
  const factory PlaylistsongsState.initial() = _Initial;
  const factory PlaylistsongsState.songs(
    List<Map<String,dynamic>> songs,
  ) = _Songs;
}
