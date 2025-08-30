part of 'ytrelatedvideos_bloc.dart';

@freezed
class YtrelatedvideosEvent with _$YtrelatedvideosEvent {
  const factory YtrelatedvideosEvent.started() = _Started;
  const factory YtrelatedvideosEvent.relatedvideos(
    String videoid,
  ) = _RelatedVideos;
}
