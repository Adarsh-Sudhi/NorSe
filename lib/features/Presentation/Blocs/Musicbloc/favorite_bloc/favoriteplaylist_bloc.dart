import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getallfav_Usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/removefromfav_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/updateplaylist_UseCase.dart';
import 'package:norse/injection_container.dart' as di;

part 'favoriteplaylist_event.dart';
part 'favoriteplaylist_state.dart';
part 'favoriteplaylist_bloc.freezed.dart';

class FavoriteplaylistBloc
    extends Bloc<FavoriteplaylistEvent, FavoriteplaylistState> {
  FavoriteplaylistBloc() : super(const _Initial()) {
    on<_Getallsongs>((event, emit) async {
      Either<Failures, List<Map<String, dynamic>>> response =
          await di.di<GetallfaveUsecase>().call();
      response.fold((l) {
        log("Fav Song fetch failed");
        emit(const FavoriteplaylistState.favsongs([]));
      }, (r) {
        log('emited');
        emit(FavoriteplaylistState.favsongs(r));
      });
    });
    on<_Removesongs>((event, emit) async {
      log('working');
      Either<Failures, bool> response =
          await di.di<removefromfavusecase>().call(event.id);
      await response.fold((l) {
        log('Remove Failed');
      }, (r) async {
        Either<Failures, List<Map<String, dynamic>>> response =
            await di.di<GetallfaveUsecase>().call();
        await response.fold((l) async {
          log("Fav Song fetch failed");
          emit(const FavoriteplaylistState.favsongs([]));
        }, (r) {
          emit(FavoriteplaylistState.favsongs(r));
        });
      });
    });
    on<_Updatelist>((event, emit) async {
      Either<Failures, List<Map<String, dynamic>>> res =
          await di.di<updateplaylistusecase>().call('fav', event.newlist);
      res.fold((l) {
        log('update failed');
      }, (r) {
        log('updated');
      });
      emit(FavoriteplaylistState.favsongs(event.newlist));
    });
  }
}
