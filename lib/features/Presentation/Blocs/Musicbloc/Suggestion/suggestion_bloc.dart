import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getSuggestion_useCase.dart';
import 'package:norse/injection_container.dart' as di;
import 'package:rxdart/rxdart.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';
part 'suggestion_bloc.freezed.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionBloc() : super(const _Initial()) {
    BehaviorSubject<List<String>> _controller = BehaviorSubject();

    on<_Started>((event, emit) => emit(const SuggestionState.initial()));

    on<_getSuggestion>((event, emit) async {
      List<String> response =
          await di.di<Getsuggestionusecase>().call(event.query);
      _controller.sink.add(response);
      emit(SuggestionState.suggestion(_controller.stream));
      log('emited');
      log(response.toString());
    });
  }
}
