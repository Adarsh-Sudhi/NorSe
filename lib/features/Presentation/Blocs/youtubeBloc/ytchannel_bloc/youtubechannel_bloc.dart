import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getchanneluploads_usecase.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:norse/injection_container.dart' as di;
import 'dart:developer' as dev;

part 'youtubechannel_event.dart';
part 'youtubechannel_state.dart';
part 'youtubechannel_bloc.freezed.dart';

class YoutubechannelBloc
    extends Bloc<YoutubechannelEvent, YoutubechannelState> {
  YoutubechannelBloc() : super(const _Initial()) {
    on<_Getuploads>((event, emit) async {
      emit(const YoutubechannelState.loading());
      Either<Failures, ChannelUploadsList> res =
          await di.di<GetChannelUploads>().call(event.channelid);

      res.fold((l) => dev.log('Failed'),
          (r) => emit(YoutubechannelState.uploads(r, false)));
    });
  }
}
