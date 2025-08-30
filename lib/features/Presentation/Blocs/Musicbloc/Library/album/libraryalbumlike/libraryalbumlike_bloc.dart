import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/checkforalbumpresent_usecase.dart';
import 'package:norse/injection_container.dart' as di;
import '../../../../../../../configs/Error/Errors.dart';
import '../../../../../../Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import '../../../../../../Domain/UseCases/Sql_UseCase/addtolibrary_usecase.dart';

part 'libraryalbumlike_event.dart';
part 'libraryalbumlike_state.dart';
part 'libraryalbumlike_bloc.freezed.dart';

class LibraryalbumlikeBloc
    extends Bloc<LibraryalbumlikeEvent, LibraryalbumlikeState> {
  LibraryalbumlikeBloc() : super(const _Initial()) {
    on<_Addedtolibrary>((event, emit) async {
      Either<Failures, String> res =
          await di.di<Addtolibraryusecase>().call(event.type, event.song);
      res.fold((l) {
        log('Failed');
      }, (r) {
        if (r == 'Added album') {
          emit(const LibraryalbumlikeState.added());
        } else if (r == 'Removed albu,') {
          emit(const LibraryalbumlikeState.removed());
        }
      });
    });
    on<_Check>((event, emit) async {
      bool ispresent =
          await di.di<Checkforalbumpresentusecase>().call(event.id);
      log(ispresent.toString());
      emit(LibraryalbumlikeState.ispresent(ispresent));
    });
  }
}
