part of 'libraryplaylist_bloc.dart';

@freezed
class LibraryplaylistEvent with _$LibraryplaylistEvent {
  const factory LibraryplaylistEvent.started() = _Started;
  const factory LibraryplaylistEvent.getlibraryplaylist() = _Getlibraryplaylist;
}