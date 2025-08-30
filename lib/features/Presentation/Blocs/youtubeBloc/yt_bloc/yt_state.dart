part of 'yt_bloc.dart';

@freezed
class YtState with _$YtState {
  const factory YtState.initial() = _Initial;
  const factory YtState.vidoeinfo(
      Map videoinfo,
      List<VideoOnlyStreamInfo> videos,
      AudioOnlyStreamInfo audioOnlyStreamInfo) = _Videoinfo;
  const factory YtState.loader() = _Loading;
}
