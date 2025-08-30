part of 'tageditor_bloc.dart';

@freezed
class TageditorEvent with _$TageditorEvent {
  const factory TageditorEvent.started() = _Started;
  const factory TageditorEvent.upatenewtagval(String title, String artist,
      String ganre, String album, String path) = _UpdateNewTagVal;
}
