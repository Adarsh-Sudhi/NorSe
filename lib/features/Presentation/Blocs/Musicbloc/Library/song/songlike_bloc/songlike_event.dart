part of 'songlike_bloc.dart';

@freezed
class SonglikeEvent with _$SonglikeEvent {
  const factory SonglikeEvent.started() = _Started;
  const factory SonglikeEvent.checkifpresent(
    String id,
  ) = _checkifpresent;
    const factory SonglikeEvent.addtolibray(
    String type,
    AlbumElements song,
  ) = _Addtolibrary;
}