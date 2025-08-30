part of 'playerui_bloc.dart';

@freezed
class PlayeruiState with _$PlayeruiState {
  const factory PlayeruiState.initial() = _Initial;
  const factory PlayeruiState.playerui(
    Map<String,dynamic> ui,
  ) = _Playerui;
}
