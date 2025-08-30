part of 'connnectivity_bloc.dart';

@freezed
class ConnnectivityEvent with _$ConnnectivityEvent {
  const factory ConnnectivityEvent.started() = _Started;
  const factory ConnnectivityEvent.startSevice() = _StartService;
  const factory ConnnectivityEvent.getConnectionstatus(
    List<ConnectivityResult> data,
  ) = _Connectivity;
}
