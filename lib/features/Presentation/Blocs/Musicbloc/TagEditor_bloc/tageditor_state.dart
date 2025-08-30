part of 'tageditor_bloc.dart';

@freezed
class TageditorState with _$TageditorState {
  const factory TageditorState.initial() = _Initial;
  const factory TageditorState.loading() = _Loading;
  const factory TageditorState.loaded() = _Loaded;
}
