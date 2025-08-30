part of 'videoinfo_bloc.dart';

@freezed
class VideoinfoState with _$VideoinfoState {
  const factory VideoinfoState.initial() = _Initial;
  const factory VideoinfoState.info(bool isloading, Map video) = _Info;
  const factory VideoinfoState.loading(
    bool isfailed,
    bool isloading,
  ) = _Loading;
}
