part of 'ytmusic_bloc.dart';

@freezed
class YtmusicState with _$YtmusicState {
  const factory YtmusicState.initial() = _Initial;
  const factory YtmusicState.ytmusicdata(List<HomeSection> homeSection) =
      _ytmusicdata;
}
