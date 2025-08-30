part of 'yt_bloc.dart';

@freezed
class YtEvent with _$YtEvent {
  const factory YtEvent.started() = _Started;
  const factory YtEvent.getvideoinfoevent(
    String id,
  ) = _Getinfo;
}