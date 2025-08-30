part of 'recents_bloc.dart';

@freezed
class RecentsState with _$RecentsState {
  const factory RecentsState.initial() = _Initial;
  const factory RecentsState.recents(
     List<Map<String,dynamic>> recents,
  ) = _Recents;
}
