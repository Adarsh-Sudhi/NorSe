part of 'searchyt_bloc_bloc.dart';

@freezed
class SearchytBlocEvent with _$SearchytBlocEvent {
  const factory SearchytBlocEvent.started() = _Started;
    const factory SearchytBlocEvent.getsearchdetails(
    String query
  )=_Getsearch;
}