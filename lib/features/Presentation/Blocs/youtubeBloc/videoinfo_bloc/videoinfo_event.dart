part of 'videoinfo_bloc.dart';

@freezed
class VideoinfoEvent with _$VideoinfoEvent {
  const factory VideoinfoEvent.started() = _Started;
  const factory VideoinfoEvent.getinfo(
    String url
  ) = _Getinfo;
}