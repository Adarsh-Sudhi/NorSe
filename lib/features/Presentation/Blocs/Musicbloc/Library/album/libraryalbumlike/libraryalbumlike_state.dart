part of 'libraryalbumlike_bloc.dart';

@freezed
class LibraryalbumlikeState with _$LibraryalbumlikeState {
  const factory LibraryalbumlikeState.initial() = _Initial;
  const factory LibraryalbumlikeState.added() = _Added;
  const factory LibraryalbumlikeState.ispresent(
    bool ispresent,
  ) = _Ispresent;
  const factory LibraryalbumlikeState.removed() = _Removed;
}
