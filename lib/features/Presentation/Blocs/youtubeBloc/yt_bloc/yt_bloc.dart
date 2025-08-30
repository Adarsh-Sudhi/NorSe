import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/yt_usecase/getvideoinfo_usecase.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'yt_event.dart';
part 'yt_state.dart';
part 'yt_bloc.freezed.dart';

class YtBloc extends Bloc<YtEvent, YtState> {
  final Getvideoinfousecase getvideoinfousecase;
  YtBloc(this.getvideoinfousecase) : super(const _Initial()) {
    on<_Getinfo>((event, emit) async {
      emit(const YtState.loader());
/*
      Map<String, dynamic> info = await getvideoinfousecase.call(event.id);
      log('called');
      Either<Failures, List<Videostreaminfo>> videos =
          await di.di<GetstreamManifestusecase>().call(event.id);
      final res = await di.di<Getaudiostreamusecase>().call(event.id);
      videos.fold((l) => log('failed here'), (r) {
        res.fold((failed) {
          throw Exception('failed audio fetch');
        }, (asuccess) {
          emit(YtState.vidoeinfo(info, r, asuccess));
        });
      }); */
    });
  }
}
