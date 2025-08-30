part of 'libraryplaylistlike_bloc.dart';

@freezed
class LibraryplaylistlikeState with _$LibraryplaylistlikeState {
  const factory LibraryplaylistlikeState.initial() = _Initial;
  const factory LibraryplaylistlikeState.added() = _Added;
  const factory LibraryplaylistlikeState.removed() = _Removed;
  const factory LibraryplaylistlikeState.ifpresent(
    bool ispresent,
  ) = _Ifpresent;
}
