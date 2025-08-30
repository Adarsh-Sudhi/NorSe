part of 'searchlibrary_bloc.dart';

@freezed
class SearchlibraryEvent with _$SearchlibraryEvent {
  const factory SearchlibraryEvent.started() = _Started;
  const factory SearchlibraryEvent.querylibrarysongs(
    String query,
  ) = _LibraryQuery;
}