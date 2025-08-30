part of 'playlistsongs_bloc.dart';

@freezed
class PlaylistsongsEvent with _$PlaylistsongsEvent {
  const factory PlaylistsongsEvent.started() = _Started;
  const factory PlaylistsongsEvent.getplaylistsongs(
    String playlistid,
  ) = _Getallsongs;
  const factory PlaylistsongsEvent.deletesong(
    String playlistid,
    String songid,
  ) = _Deletesong;
}