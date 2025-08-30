part of 'ytdownload_bloc.dart';

@freezed
class YtdownloadState with _$YtdownloadState {
  const factory YtdownloadState.initial() = _Initial;
  const factory YtdownloadState.loading() = _Loader;
  const factory YtdownloadState.downloading(
    StreamController<int> progress,
  ) = _Downdloading;
  const factory YtdownloadState.complete() = _Complete;
}
