part of 'youtubechannel_bloc.dart';

@freezed
class YoutubechannelEvent with _$YoutubechannelEvent {
  const factory YoutubechannelEvent.started() = _Started;
  const factory YoutubechannelEvent.getuploadsevent(dynamic channelid) =
      _Getuploads;
}
