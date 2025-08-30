import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getlibraryplaylist_usecase.dart';
import 'package:norse/injection_container.dart' as di;

part 'libraryplaylist_event.dart';
part 'libraryplaylist_state.dart';
part 'libraryplaylist_bloc.freezed.dart';

class LibraryplaylistBloc
    extends Bloc<LibraryplaylistEvent, LibraryplaylistState> {
  LibraryplaylistBloc() : super(const _Initial()) {
    on<_Getlibraryplaylist>((event, emit) async {
      Either<Failures, List<Map<String, dynamic>>> res =
          await di.di<Getlibraryplaylistusecase>().call();
      res.fold((l) {
        log('library playlist failed');
        emit(const LibraryplaylistState.playlists([]));
      }, (r) {
        emit(LibraryplaylistState.playlists(r));
      });
    });
  }
}
