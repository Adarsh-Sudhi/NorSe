import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getplayerui_UseCase.dart';
import 'package:norse/injection_container.dart' as di;
import '../../../../Domain/UseCases/Sql_UseCase/initialplayerui_usecase.dart';
import '../../../../Domain/UseCases/Sql_UseCase/updateplayerui_UseCase.dart';

part 'playerui_event.dart';
part 'playerui_state.dart';
part 'playerui_bloc.freezed.dart';

class PlayeruiBloc extends Bloc<PlayeruiEvent, PlayeruiState> {
  PlayeruiBloc() : super(const _Initial()) {
    on<_Intialui>((event, emit) => di.di<IntialPlayerUiUseCase>().call());
    on<_Updateui>(
      (event, emit) => di.di<UpdatePlayerUiUseCase>().call(event.type),
    );
    on<_GetplayerUi>((event, emit) async {
      Map<String, dynamic> response = await di.di<GetPlayerUiUseCase>().call();
      emit(PlayeruiState.playerui(response));
    });
  }
}
