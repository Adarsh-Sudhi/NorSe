part of 'youtubechannel_bloc.dart';

@freezed
class YoutubechannelState with _$YoutubechannelState {
  const factory YoutubechannelState.initial() = _Initial;
  const factory YoutubechannelState.loading() = _Loading;
  const factory YoutubechannelState.uploads(
      ChannelUploadsList list, bool isloading) = _Uploads;
}
