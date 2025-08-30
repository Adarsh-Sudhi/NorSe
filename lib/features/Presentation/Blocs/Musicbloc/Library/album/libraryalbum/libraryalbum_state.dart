part of 'libraryalbum_bloc.dart';

@freezed
class LibraryalbumState with _$LibraryalbumState {
  const factory LibraryalbumState.initial() = _Initial;
  const factory LibraryalbumState.libraryalbums(
    List<Map<String,dynamic>> albums
  ) = _Libraryalbums;
}
