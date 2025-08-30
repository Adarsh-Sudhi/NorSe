import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/addtorecents_UseCase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/clearalldownloads_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getquerydata_Usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/removefromdownloads.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/removefromrecents.dart';
import 'package:norse/injection_container.dart' as di;

part 'localdata_event.dart';
part 'localdata_state.dart';
part 'localdata_bloc.freezed.dart';

class LocaldataBloc extends Bloc<LocaldataEvent, LocaldataState> {
  final getquerydataUsecase getDownloads;
  final addtorecentUseCase addtorecent;
  final RemovefromrecentsUsecase removefromrecentsUsecase;
  LocaldataBloc(
    this.getDownloads,
    this.addtorecent,
    this.removefromrecentsUsecase,
  ) : super(const _Initial(false)) {
    on<_GetDownloads>((event, emit) async {
      state.mapOrNull(
        querys: (value) => emit(value.copyWith(isloading: true)),
      );
      Either<Failures, List<Map<String, dynamic>>> Res =
          await getDownloads.call();
      Res.fold((fail) {
        emit(const _Query(false, true, []));
        Spaces.showtoast('No Data Available');
      }, (sucess) {
        emit(_Query(true, false, sucess));
      });
    });

    on<_Clearalldownloads>((event, emit) async {
      Either<Failures, bool> res =
          await di.di<Clearalldownloadusecase>().call();
      res.fold((l) => {log('downloads remove failed')}, (r) {
        emit(const LocaldataState.querys(false, false, []));
        Spaces.showtoast('Done');
      });
    });

    on<_RemovefromDownloads>((event, emit) async {
      Either<Failures, bool> res =
          await di.di<RemovefromdownloadsUseCase>().call(event.id);
      res.fold((l) {
        const Failures.clientfailure();
      }, (r) {
        if (r == true) {
          const LocaldataState.remove(true);
        }
      });
    });

    on<_Addtorecent>((event, emit) async {
      Either<Failures, bool> res = await addtorecent.call(event.song);
      res.fold((l) {
        log('already Exists');
      }, (r) {
        log('Done');
      });
    });

    on<_Removefromrecents>((event, emit) async {
      Either<Failures, bool> res =
          await removefromrecentsUsecase.call(event.id);
      res.fold((l) {
        log('no such item');
      }, (r) {
        if (r) {
          log('done');
        }
      });
    });
  }
}
