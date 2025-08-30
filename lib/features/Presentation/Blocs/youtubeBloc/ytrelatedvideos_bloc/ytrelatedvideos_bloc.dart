import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getytReleatedvideos_usecase.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:norse/injection_container.dart' as di;
import '../../../../../configs/Error/Errors.dart';

part 'ytrelatedvideos_event.dart';
part 'ytrelatedvideos_state.dart';
part 'ytrelatedvideos_bloc.freezed.dart';

class YtrelatedvideosBloc
    extends Bloc<YtrelatedvideosEvent, YtrelatedvideosState> {
  YtrelatedvideosBloc() : super(const _Initial()) {
    on<_RelatedVideos>((event, emit) async {
      emit(const YtrelatedvideosState.laoding());
      Either<Failures, RelatedVideosList> res =
          await di.di<GetyoutubeRelatedVideosUseCase>().call(event.videoid);

      res.fold((l) {
        log('failed');
      }, (r) {
        emit(YtrelatedvideosState.suggestion(r));
      });
    });
  }
}
