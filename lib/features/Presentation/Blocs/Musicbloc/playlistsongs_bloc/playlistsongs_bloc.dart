import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getallsongsfromplaylists_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/removesongfromplaylist_usecase.dart';
import 'package:norse/injection_container.dart' as di;

import '../../../../../configs/Error/Errors.dart';

part 'playlistsongs_event.dart';
part 'playlistsongs_state.dart';
part 'playlistsongs_bloc.freezed.dart';

class PlaylistsongsBloc extends Bloc<PlaylistsongsEvent, PlaylistsongsState> {
  final Getallsongsfromplaylistsusecase songsusecase;
  PlaylistsongsBloc(this.songsusecase) : super(const _Initial()) {
    on<_Getallsongs>((event, emit) async {
      Either<Failures, List<Map<String, dynamic>>> res =
          await songsusecase.call(event.playlistid);
      res.fold((l) {
        log('playlist song failed');
        emit(const PlaylistsongsState.songs([]));
      }, (r) => emit(PlaylistsongsState.songs(r)));
    });
    on<_Deletesong>((event, emit) async {
      Either<Failures, bool> res = await di
          .di<Removesongfromplaylistusecase>()
          .call(event.playlistid, event.songid);
      res.fold((l) {
        log('Remove failed');
      }, (r) {
        log('Removed');
      });
    });
  }
}
