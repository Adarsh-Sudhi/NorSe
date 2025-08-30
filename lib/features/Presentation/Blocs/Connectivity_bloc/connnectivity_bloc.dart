import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connnectivity_event.dart';
part 'connnectivity_state.dart';
part 'connnectivity_bloc.freezed.dart';

class ConnnectivityBloc extends Bloc<ConnnectivityEvent, ConnnectivityState> {
  ConnnectivityBloc() : super(const _Initial()) {
    StreamSubscription<List<ConnectivityResult>>? connectionStream;

    on<_StartService>((event, emit) async {
      await connectionStream?.cancel();

      connectionStream = Connectivity().onConnectivityChanged.listen((data) {
        if (data.isNotEmpty) {
          if (data[0].name == 'none') {
            log(data[0].name);
            add(ConnnectivityEvent.getConnectionstatus(data));
          }else{
            add(ConnnectivityEvent.getConnectionstatus(data));
          }
        }
      });
    });

    on<_Connectivity>((event, emit) async {
      if (event.data[0].name == 'none') {
        emit(const ConnnectivityState.networkstate(false));
      } else {
        emit(const ConnnectivityState.networkstate(true));
      }
    });
  }
}
