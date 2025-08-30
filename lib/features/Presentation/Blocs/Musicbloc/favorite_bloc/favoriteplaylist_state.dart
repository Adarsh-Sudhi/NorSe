part of 'favoriteplaylist_bloc.dart';

@freezed
class FavoriteplaylistState with _$FavoriteplaylistState {
  const factory FavoriteplaylistState.favsongs(
    List<Map<String,dynamic>> songs,
  ) = _Allsongs;
  const factory FavoriteplaylistState.initial() = _Initial;
}
