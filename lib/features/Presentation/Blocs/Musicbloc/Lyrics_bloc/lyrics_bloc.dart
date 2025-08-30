// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getlyrices_usecase.dart';
import 'package:norse/injection_container.dart' as di;
import 'package:rxdart/rxdart.dart';
import '../../../../../configs/Error/Errors.dart';

part 'lyrics_bloc.freezed.dart';
part 'lyrics_event.dart';
part 'lyrics_state.dart';

class LyricsBloc extends Bloc<LyricsEvent, LyricsState> {
  LyricsBloc() : super(const _Initial()) {
    EventTransformer<E> debounce<E>(Duration duration) {
      return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
    }

    on<_Getlyrics>(transformer: debounce(Duration(milliseconds: 100)), (
      event,
      emit,
    ) async {
      emit(const LyricsState.loader());
      Either<Failures, Map<String, dynamic>> res = await di
          .di<Getlyricesusecase>()
          .call(event.id, event.title);
      res.fold(
        (l) {
          log('Lyrics failed');
          emit(const LyricsState.lyrics({'lyrics': "failure"}));
        },
        (r) {
          log('calling here all');
          emit(LyricsState.lyrics(r));
        },
      );
    });
  }
}
