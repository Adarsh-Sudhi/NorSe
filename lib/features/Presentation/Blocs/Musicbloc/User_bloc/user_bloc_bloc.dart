import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Data/Models/MusicModels/usermodel.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getuserdetails_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/userdetails_usecase.dart';
import 'package:norse/injection_container.dart' as di;

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';
part 'user_bloc_bloc.freezed.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBlocBloc() : super(const _Initial()) {
    on<_Userdetails>((event, emit) async {
      bool isadded =
          await di.di<Userdetailsusecase>().call(event.mode, event.user);
      if (isadded) {
        Map<String, dynamic> res = await di.di<Getuserdetailsusecase>().call();
        emit(UserBlocState.userdetails(
            Usermodel(name: res['name'], date: res['date'])));
      } else {
        log('user initial failed');
      }
    });

    on<_Updateuserdetails>((event, emit) async {
      bool isadded =
          await di.di<Userdetailsusecase>().call(event.mode, event.user);
      if (isadded) {
        log('user updated');
      } else {
        log('user update failed');
      }
    });

    on<_Getuserdetails>((event, emit) async {
      Map<String, dynamic> res = await di.di<Getuserdetailsusecase>().call();
      emit(UserBlocState.userdetails(Usermodel(
        name: res['name'],
        date: res['date'],
      )));
    });
  }
}
