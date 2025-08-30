part of 'ytrelatedvideos_bloc.dart';

@freezed
class YtrelatedvideosState with _$YtrelatedvideosState {
  const factory YtrelatedvideosState.initial() = _Initial;
  const factory YtrelatedvideosState.suggestion(
    RelatedVideosList relatedVideosList,
  ) = __Suggestion;
  const factory YtrelatedvideosState.laoding() = __Loading;
}
