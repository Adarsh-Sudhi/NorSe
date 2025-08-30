// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'playlist_bloc.dart';

@freezed
class PlaylistEvent with _$PlaylistEvent {
  const factory PlaylistEvent.removePlaylist(
    String playlistid,
    String playlistname,
  ) = _Removeplaylist;
  const factory PlaylistEvent.addtoplaylist(
    String tbname,
    AlbumElements song
  ) = _Addtoplaylist;
  const factory PlaylistEvent.getallplaylist() = _Getallplaylist;
  const factory PlaylistEvent.createplaylist(
    String playlistname,
  ) = _Createplaylist;

  const factory PlaylistEvent.started() = _Started;
}
