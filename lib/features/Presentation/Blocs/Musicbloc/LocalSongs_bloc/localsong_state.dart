part of 'localsong_bloc.dart';

@freezed
class LocalsongState with _$LocalsongState {
  const factory LocalsongState.songs(
      List<SongModel> songlist,
      List<AlbumModel> albums,
      Map<String,dynamic> artist,
      List<GenreModel> genre,
      bool isloading,
      bool failed) = _Songs;
  const factory LocalsongState.initial() = _Initial;
  const factory LocalsongState.failed() = _failed;
}
