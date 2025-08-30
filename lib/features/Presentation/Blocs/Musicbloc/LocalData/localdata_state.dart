part of 'localdata_bloc.dart';

@freezed
class LocaldataState with _$LocaldataState {
  const factory LocaldataState.failed(
     bool isloading,
  ) = _Failed;
  const factory LocaldataState.remove(
    bool isremoved,
  ) = _Remove;
  const factory LocaldataState.querys(
     bool isloading,
     bool fail,
     List<Map<String,dynamic>> downloads,
  ) = _Query;
  const factory LocaldataState.initial(
     bool isloading,
  ) = _Initial;
}
