part of 'ytmusic_bloc.dart';

@freezed
class YtmusicEvent with _$YtmusicEvent {
  const factory YtmusicEvent.started() = _Started;
  const factory YtmusicEvent.getinitiallaunch() =
      _Getlaunchdata;
}
