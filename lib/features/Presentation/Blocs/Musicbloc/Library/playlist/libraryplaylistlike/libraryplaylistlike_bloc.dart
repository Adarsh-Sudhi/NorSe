import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/addtolibrary_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/chechifplaylistpresent_usecase.dart';
import 'package:norse/injection_container.dart' as di;

import '../../../../../../../configs/Error/Errors.dart';

part 'libraryplaylistlike_event.dart';
part 'libraryplaylistlike_state.dart';
part 'libraryplaylistlike_bloc.freezed.dart';

class LibraryplaylistlikeBloc
    extends Bloc<LibraryplaylistlikeEvent, LibraryplaylistlikeState> {
  LibraryplaylistlikeBloc() : super(const _Initial()) {
    on<_Addedtolibrary>((event, emit) async {
      Either<Failures, String> res =
          await di.di<Addtolibraryusecase>().call(event.id, event.song);
      res.fold((l) {
        log("library playlist failed");
      }, (r) {
        if (r == 'Added playlist') {
          emit(const LibraryplaylistlikeState.added());
        } else if (r == 'Removed playlist,') {
          emit(const LibraryplaylistlikeState.removed());
        }
      });
    });
    on<_Checkifplaylistavai>((event, emit) async {
      final res = await di.di<Checkifplaylistpresentusecase>().call(event.id);
      emit(LibraryplaylistlikeState.ifpresent(res));
    });
  }
}
