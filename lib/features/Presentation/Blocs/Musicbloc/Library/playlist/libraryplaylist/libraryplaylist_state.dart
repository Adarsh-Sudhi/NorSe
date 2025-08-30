part of 'libraryplaylist_bloc.dart';

@freezed
class LibraryplaylistState with _$LibraryplaylistState {
  const factory LibraryplaylistState.initial() = _Initial;
  const factory LibraryplaylistState.playlists(
    List<Map<String,dynamic>> playlist,
  ) = _Playlists;
}
