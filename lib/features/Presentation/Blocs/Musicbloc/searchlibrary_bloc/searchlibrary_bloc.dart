import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/searchlibrarysong_usecase.dart';
import 'package:norse/injection_container.dart' as di;

part 'searchlibrary_bloc.freezed.dart';
part 'searchlibrary_event.dart';
part 'searchlibrary_state.dart';

class SearchlibraryBloc extends Bloc<SearchlibraryEvent, SearchlibraryState> {
  SearchlibraryBloc() : super(const _Initial()) {
    StreamController<List<List<Map<String, dynamic>>>> controller =
        StreamController<List<List<Map<String, dynamic>>>>.broadcast();
    on<_LibraryQuery>((event, emit) async {
      final res = await di.di<SearchLibrarySongUsecase>().call(event.query);
      res.fold(
          (l) {},
          (r) => {
                controller.add(r),
                emit(SearchlibraryState.onRearch(
                    controller.stream.asBroadcastStream()))
              });
    });
  }
}
