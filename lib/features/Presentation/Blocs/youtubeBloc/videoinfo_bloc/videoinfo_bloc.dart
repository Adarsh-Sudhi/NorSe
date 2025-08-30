import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/injection_container.dart' as di;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../../configs/Error/Errors.dart';
import '../../../../Data/DataSource/RemoteDataSource/saavn/APIremotedatasource.dart';

part 'videoinfo_event.dart';
part 'videoinfo_state.dart';
part 'videoinfo_bloc.freezed.dart';

class VideoinfoBloc extends Bloc<VideoinfoEvent, VideoinfoState> {
  VideoinfoBloc() : super(const _Initial()) {
    APIremoteDatasource streams = di.di<APIremoteDatasource>();
    on<_Getinfo>((event, emit) async {
      emit(const VideoinfoState.loading(false, true));

      Either<Failures, List<VideoOnlyStreamInfo>> videoOnlyStreamInfo =
          await streams.getManifest(event.url);
      Either<Failures, List<AudioOnlyStreamInfo>> audioOnlyStreamInfo =
          await streams.getstream(event.url);
      await videoOnlyStreamInfo.fold(
        (failedvideo) {
          state.mapOrNull(
            loading:
                (value) =>
                    emit(value.copyWith(isfailed: true, isloading: false)),
          );
          Spaces.showtoast(
            'It may take a few tries to get the video info, but please be patient and try again periodically!',
          );
        },
        (vsuccess) async {
          await audioOnlyStreamInfo.fold(
            (l) async {
              state.mapOrNull(
                loading:
                    (value) =>
                        emit(value.copyWith(isfailed: true, isloading: false)),
              );
              Spaces.showtoast(
                'It may take a few tries to get the video info, but please be patient and try again periodically!',
              );
            },
            (success) async {
              Map<String, dynamic> maps = {'video': vsuccess, 'audio': success};
              emit(VideoinfoState.info(false, maps));
            },
          );
        },
      );
    });
  }
}
