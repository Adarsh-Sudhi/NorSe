part of 'localsong_bloc.dart';

@freezed
class LocalsongEvent with _$LocalsongEvent {
  const factory LocalsongEvent.getallsongs() = _Getallsongs;
  const factory LocalsongEvent.started() = _Started;
  const factory LocalsongEvent.removesongsfromdevice(
      int id,
      String location) = _RemoveSongFromDevice;
}
