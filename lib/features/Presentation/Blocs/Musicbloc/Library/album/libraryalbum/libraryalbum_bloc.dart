import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getlibraryalbums_usecase.dart';
import 'package:norse/injection_container.dart' as di;

part 'libraryalbum_event.dart';
part 'libraryalbum_state.dart';
part 'libraryalbum_bloc.freezed.dart';

class LibraryalbumBloc extends Bloc<LibraryalbumEvent, LibraryalbumState> {
  LibraryalbumBloc() : super(const _Initial()) {
    on<_Getalbumsongs>((event, emit) async {
      Either<Failures, List<Map<String, dynamic>>> res =
          await di.di<Getlibraryalbumsusecase>().call();
      res.fold((l) {
        log('library albums failed');
        emit(const LibraryalbumState.libraryalbums([]));
      }, (r) => emit(LibraryalbumState.libraryalbums(r)));
    });
  }
}
