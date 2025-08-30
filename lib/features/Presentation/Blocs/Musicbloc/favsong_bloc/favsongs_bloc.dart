import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getfavsongstatus_usecase.dart';
import 'package:norse/injection_container.dart' as di;
import '../../../../Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import '../../../../Domain/UseCases/Sql_UseCase/addtofav_UseCase.dart';
import '../../../../Domain/UseCases/Sql_UseCase/removefromfav_usecase.dart';

part 'favsongs_event.dart';
part 'favsongs_state.dart';
part 'favsongs_bloc.freezed.dart';

class FavsongsBloc extends Bloc<FavsongsEvent, FavsongsState> {
  FavsongsBloc() : super(const _Initial()) {
    on<_Checkforfavsong>((event, emit) async {
      Either<Failures, bool> res =
          await di.di<Getfavsongstatususecase>().call(event.songid);
      res.fold((l) {
        log('Some error Ocurred while Favsongcheck');
      }, (r) {
        if (r) {
          emit(const FavsongsState.ispresent(true));
        } else {
          emit(const FavsongsState.notpresent());
        }
      });
    });

    on<_Addtofav>((event, emit) async {
      Either<Failures, String> res =
          await di.di<AddtofaveUsecase>().call(event.song, event.isadded);
      res.fold((l) {
        log('Fav song failed');
      }, (r) {
        if (r == 'removed') {
          log(r);
        } else {
          if (r == 'added') {
            emit(const FavsongsState.added());
          }
        }
      });
    });

    on<_Removefromfav>((event, emit) async {
      Either<Failures, bool> res =
          await di.di<removefromfavusecase>().call(event.id);
      res.fold((l) {
        log('not such item');
      }, (r) {
        if (r == true) {
          log('removed');
          emit(const FavsongsState.removed());
        }
      });
    });
  }
}
