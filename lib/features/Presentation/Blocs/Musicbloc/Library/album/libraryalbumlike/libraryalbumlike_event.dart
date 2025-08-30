part of 'libraryalbumlike_bloc.dart';

@freezed
class LibraryalbumlikeEvent with _$LibraryalbumlikeEvent {
  const factory LibraryalbumlikeEvent.started() = _Started;
    const factory LibraryalbumlikeEvent.addtolibrary(
    String type,
    AlbumElements song
  ) = _Addedtolibrary;
  const factory LibraryalbumlikeEvent.checkforalbum(
    String id
  ) = _Check;
}