part of 'libraryalbum_bloc.dart';

@freezed
class LibraryalbumEvent with _$LibraryalbumEvent {
  const factory LibraryalbumEvent.started() = _Started;
  const factory LibraryalbumEvent.getalbumsongs() = _Getalbumsongs;
}