part of 'favsongs_bloc.dart';

@freezed
class FavsongsEvent with _$FavsongsEvent {
  const factory FavsongsEvent.checkforfav(
    String songid,
  ) = _Checkforfavsong;
    const factory FavsongsEvent.addtofav(
    AlbumElements song,
    bool isadded,
  ) = _Addtofav;
    const factory FavsongsEvent.removefromfav(
    String id
  ) = _Removefromfav;
  const factory FavsongsEvent.started() = _Started;
}