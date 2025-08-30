part of 'library_bloc.dart';

@freezed
class LibraryEvent with _$LibraryEvent {
  const factory LibraryEvent.started() = _Started;
  const factory LibraryEvent.addtolibray(
    String type,
    AlbumElements song,
    AlbumSongEntity album,
  ) = _Addtolibrary;
  const factory LibraryEvent.getlibrarysong() = _Getlibrarysong;
  const factory LibraryEvent.removesongfromlib(String id) = _Removesong;
}
