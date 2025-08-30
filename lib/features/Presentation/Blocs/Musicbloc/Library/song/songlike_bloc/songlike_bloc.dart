import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/checkforsong.dart';
import 'package:norse/injection_container.dart' as di;
import '../../../../../../../configs/Error/Errors.dart';
import '../../../../../../Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import '../../../../../../Domain/UseCases/Sql_UseCase/addtolibrary_usecase.dart';

part 'songlike_event.dart';
part 'songlike_state.dart';
part 'songlike_bloc.freezed.dart';

class SonglikeBloc extends Bloc<SonglikeEvent, SonglikeState> {
  SonglikeBloc() : super(const _Initial()) {
    on<_Addtolibrary>((event, emit) async {
      Either<Failures, String> res =
          await di.di<Addtolibraryusecase>().call(event.type, event.song);
      res.fold((l) {
        log("library Failed");
      }, (r) {
        log(r);
        if (r == "added Succesfully") {
          log('added');
          emit(const SonglikeState.added());
        } else if (r == 'song removed') {
          log('removed');
          emit(const SonglikeState.removed());
        }
      });
    });

    on<_checkifpresent>((event, emit) async {
      bool res = await di.di<checkforsongusecase>().call(event.id);
      log(res.toString());
      emit(SonglikeState.ispresent(res));
    });
  }
}
