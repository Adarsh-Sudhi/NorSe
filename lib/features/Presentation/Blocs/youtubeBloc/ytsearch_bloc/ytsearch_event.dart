part of 'ytsearch_bloc.dart';

@freezed
class YtsearchEvent with _$YtsearchEvent {
  const factory YtsearchEvent.started() = _Started;
  const factory YtsearchEvent.freestate() = _Freestate;
}