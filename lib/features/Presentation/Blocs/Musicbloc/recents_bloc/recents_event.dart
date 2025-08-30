part of 'recents_bloc.dart';

@freezed
class RecentsEvent with _$RecentsEvent {
  const factory RecentsEvent.started() = _Started;
  const factory RecentsEvent.getallrecent() = _Getallrecents;
  const factory RecentsEvent.clearecents() = _Clearrecent;
  const factory RecentsEvent.removesong(String id) = _Removesong;
}
