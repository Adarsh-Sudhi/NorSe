part of 'searchlibrary_bloc.dart';

@freezed
class SearchlibraryState with _$SearchlibraryState {
  const factory SearchlibraryState.initial() = _Initial;
  const factory SearchlibraryState.onRearch(
    Stream<List<List<Map<String, dynamic>>>> stream,
  ) = _Onsearch;
}
