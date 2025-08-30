part of 'favsongs_bloc.dart';

@freezed
class FavsongsState with _$FavsongsState {
  const factory FavsongsState.notpresent() = _Notpresent;
  const factory FavsongsState.ispresent(
    bool ispresent,
  )=_Ispresent;
  const factory FavsongsState.initial() = _Initial;
  const factory FavsongsState.added() = _Added;
  const factory FavsongsState.removed() = _Removed;
}
