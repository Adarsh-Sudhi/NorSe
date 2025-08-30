import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/yt_usecase/getytplaylist_usecase.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:norse/injection_container.dart' as di;

part 'ytsearch_event.dart';
part 'ytsearch_state.dart';
part 'ytsearch_bloc.freezed.dart';

class YtsearchBloc extends Bloc<YtsearchEvent, YtsearchState> {
  YtsearchBloc() : super(const _Initial()) {
    on<_Freestate>((event, emit) async {
      emit(const YtsearchState.loader());

      dynamic playlist1 = await di.di<Getplaylistusecase>().call(
        'PL15B1E77BB5708555',
        'playlist',
      ); //most viwed
      dynamic playlist0 = await di.di<Getplaylistusecase>().call(
        'PLO7-VO1D0_6N2ePPlPE9NKCgUBA15aOk2',
        'playlist',
      ); //Hot Tracks
      dynamic playlist2 = await di.di<Getplaylistusecase>().call(
        'PL4QNnZJr8sRNKjKzArmzTBAlNYBDN2h-J',
        'playlist',
      ); //Kpop
      dynamic playlist3 = await di.di<Getplaylistusecase>().call(
        'PLyAn2Ml1WRpa6O6FXr2nioRlwy7CVqgwC',
        'playlist',
      ); //Malayalam

      emit(
        YtsearchState.fres(
          playlist0,
          playlist1,
          playlist2,
          playlist3,
          false,
          false,
        ),
      );
    });
  }
}
