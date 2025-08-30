import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tageditor_event.dart';
part 'tageditor_state.dart';
part 'tageditor_bloc.freezed.dart';

class TageditorBloc extends Bloc<TageditorEvent, TageditorState> {
  TageditorBloc() : super(const _Initial()) {
    on<_UpdateNewTagVal>((event, emit) async {
      emit(const TageditorState.loading());
      Map<String, dynamic> vals = {
        'title': event.title,
        'artist': event.artist,
        'album': event.album,
        'ganre': event.ganre,
        'path': event.path,
      };
    });
  }
}
