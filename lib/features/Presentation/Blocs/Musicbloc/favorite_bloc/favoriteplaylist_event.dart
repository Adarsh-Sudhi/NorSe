part of 'favoriteplaylist_bloc.dart';

@freezed
class FavoriteplaylistEvent with _$FavoriteplaylistEvent {
  const factory FavoriteplaylistEvent.removesongs(
    String id,
  ) = _Removesongs;
  const factory FavoriteplaylistEvent.updatelist(
    List<Map<String,dynamic>> newlist,
  ) = _Updatelist;
  const factory FavoriteplaylistEvent.getallsongs() = _Getallsongs;
  const factory FavoriteplaylistEvent.started() = _Started;
}