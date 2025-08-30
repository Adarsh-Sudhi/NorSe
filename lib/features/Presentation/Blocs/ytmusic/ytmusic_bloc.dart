import 'package:bloc/bloc.dart';
import 'package:dart_ytmusic_api/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/ytmusic_usecase/ytmusic_usecase.dart';
import 'package:norse/injection_container.dart' as di;

part 'ytmusic_event.dart';
part 'ytmusic_state.dart';
part 'ytmusic_bloc.freezed.dart';

class YtmusicBloc extends Bloc<YtmusicEvent, YtmusicState> {
  YtmusicBloc() : super(_Initial()) {
    on<_Getlaunchdata>((event, emit) async {
      emit(YtmusicState.initial());
      List<HomeSection> home = await di.di<Getinitiallaunchdata>().call();

      List<HomeSection> allPlaylistshome = [];

      for (var section in home) {
        if (section.contents.any((e) => e.runtimeType == PlaylistDetailed)) {
          allPlaylistshome.add(section);
        }
      }

      emit(YtmusicState.ytmusicdata(allPlaylistshome));
    });
  }
}
