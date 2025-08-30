part of 'library_bloc.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState.initial() = _Initial;
  const factory LibraryState.librarysong(
    List<Map<String,dynamic>> librarysongs,
  ) = _Librarysongs;
}
