part of 'suggestion_bloc.dart';

@freezed
class SuggestionState with _$SuggestionState {
  const factory SuggestionState.initial() = _Initial;

  const factory SuggestionState.suggestion(
    Stream stream,
  ) = _Suggestion;
}
