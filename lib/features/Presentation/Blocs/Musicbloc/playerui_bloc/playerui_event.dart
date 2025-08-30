part of 'playerui_bloc.dart';

@freezed
class PlayeruiEvent with _$PlayeruiEvent {
  const factory PlayeruiEvent.started() = _Started;
  const factory PlayeruiEvent.updateui(
    String type,
  ) = _Updateui;
    const factory PlayeruiEvent.initialui() = _Intialui;
    const factory PlayeruiEvent.getplayerui() = _GetplayerUi;
}