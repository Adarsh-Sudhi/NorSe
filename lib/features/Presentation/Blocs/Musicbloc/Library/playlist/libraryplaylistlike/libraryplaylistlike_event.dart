part of 'libraryplaylistlike_bloc.dart';

@freezed
class LibraryplaylistlikeEvent with _$LibraryplaylistlikeEvent {
  const factory LibraryplaylistlikeEvent.started() = _Started;
  const factory LibraryplaylistlikeEvent.addtolibrary(
    String id,
    AlbumElements song
  ) = _Addedtolibrary;
  const factory LibraryplaylistlikeEvent.chechifplaylistavai(
    String id
  ) = _Checkifplaylistavai;
}