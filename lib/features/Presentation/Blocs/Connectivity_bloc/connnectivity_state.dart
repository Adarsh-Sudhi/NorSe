part of 'connnectivity_bloc.dart';

@freezed
class ConnnectivityState with _$ConnnectivityState {
  const factory ConnnectivityState.initial() = _Initial;
  const factory ConnnectivityState.networkstate(
    bool isavailable,
  ) = _NetWorkState;
}
