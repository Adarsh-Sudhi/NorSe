import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Data/Models/MusicModels/LauchDataModel/LaunchDataModel.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getnewlyreleased_Usecase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/gettopCharts_UseCase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/gettopalbums_Usecase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/gettopsearches_UseCase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/trendingnow_UseCase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getstoredresponse_UseCase.dart';
import '../../../../Data/Models/MusicModels/topchartsmodels/topchartsmodel.dart';
import '../../../../Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import '../../../../Domain/Entity/MusicEntity/TopChartsEntity/topchartentity.dart';
import 'package:norse/injection_container.dart' as di;

part 'trending_song_event.dart';
part 'trending_song_state.dart';

class TrendingSongBloc extends Bloc<TrendingSongEvent, TrendingSongState> {
  final trendingnowUseCase trendingnow;
  final GettopserachesUseCase topsearches;
  final GettopChatsUseCase topCharts;
  final newlyreleasedUsecase newtrending;
  final gettopalbumsUseCase gettopalbums;
  TrendingSongBloc(
    this.trendingnow,
    this.topsearches,
    this.topCharts,
    this.newtrending,
    this.gettopalbums,
  ) : super(TrendingSongInitial()) {
    on<TrendingSongs>(getTrendingSongs);
  }

  Future<List<launchdataEntity>> parseCachedResponse(
    String json,
    String type,
  ) async {
    List<launchdataEntity> trending = [];

    if (json != 'failed') {
      final ress = json.replaceAll('&quot;', '').replaceAll('&#039;', '');
      Map<String, dynamic> res = jsonDecode(ress);
      for (var items in res['new_trending']) {
        if (items['type'] == 'album' || items['type'] == 'playlist') {
          launchdataEntity entity = launchdataModel.fromJson(items);
          trending.add(entity);
        }
      }
      return trending;
    } else {
      final trending = await trendingnow.call(type);
      return trending;
    }
  }

  Future<Either<Failures, List<launchdataEntity>>> parseCachedNewlyReleased(
    String json6,
  ) async {
    if (json6 != 'failed') {
      List<launchdataEntity> list = [];
      final res = json6.replaceAll('&quot;', '');
      final data = jsonDecode(res);
      for (var items in data['top_playlists']) {
        final songs = launchdataModel.fromJson(items);
        list.add(songs);
      }
      return right(list);
    } else {
      Either<Failures, List<launchdataEntity>> newly = await newtrending.call();
      return newly;
    }
  }

  Future<Either<Failures, List<topchartsEntity>>> parseCachedTopCharts(
    String json5,
  ) async {
    if (json5 != 'failed') {
      List<topchartsEntity> res = [];
      final map = jsonDecode(json5);
      for (var i in map['charts']) {
        topchartsEntity charts = TopchartsModel.fromJson(i);
        res.add(charts);
      }
      return right(res);
    } else {
      return await topCharts.call();
    }
  }

  Future<Either<Failures, List<launchdataEntity>>> parseTopAlbums(
    String json7,
  ) async {
    if (json7 != 'failed') {
      List<launchdataEntity> list = [];
      final res = json7.replaceAll('&quot;', '').replaceAll('&#039;', '');
      final data = jsonDecode(res);
      for (var items in data['promo:vx:data:116']) {
        final songs = launchdataModel.fromJson(items);
        list.add(songs);
      }
      return right(list);
    } else {
      Either<Failures, List<launchdataEntity>> topalbums =
          await gettopalbums.call();
      return topalbums;
    }
  }

  FutureOr<void> getTrendingSongs(
    TrendingSongs event,
    Emitter<TrendingSongState> emit,
  ) async {
    try {
      emit(TrendingSongLoading());

      String json0 = await di.di<GetStoredUseCase>().call('english,korean');

      if (event.mode == 'initial' && json0 != 'failed') {
        String json0 = await di.di<GetStoredUseCase>().call('english,korean');

        List<launchdataEntity> trending = await parseCachedResponse(
          json0,
          'english,korean',
        );

        //json0

        //json1

        String json1 = await di.di<GetStoredUseCase>().call('malayalam');

        List<launchdataEntity> malayalam = await parseCachedResponse(
          json1,
          'malayalam',
        );

        //json1

        //json2

        String json2 = await di.di<GetStoredUseCase>().call('tamil');

        List<launchdataEntity> tamil = await parseCachedResponse(
          json2,
          'tamil',
        );

        //json2

        //json3

        String json3 = await di.di<GetStoredUseCase>().call('english');

        List<launchdataEntity> english = await parseCachedResponse(
          json3,
          'english',
        );

        //json3

        //json4

        String json4 = await di.di<GetStoredUseCase>().call('hindi');

        List<launchdataEntity> hindi = await parseCachedResponse(
          json4,
          'hindi',
        );

        //json4

        //json5

        String json5 = await di.di<GetStoredUseCase>().call('topcharts');

        Either<Failures, List<topchartsEntity>> charts =
            await parseCachedTopCharts(json5);

        //json5

        //json6

        String json6 = await di.di<GetStoredUseCase>().call('newlyreleased');

        final newly = await parseCachedNewlyReleased(json6);

        //json6

        //json7

        String json7 = await di.di<GetStoredUseCase>().call('topalbums');

        Either<Failures, List<launchdataEntity>> topalbums =
            await parseTopAlbums(json7);

        //json7

        newly.fold(
          (l) => Spaces.showtoast('error'),
          (newrelease) => topalbums.fold(
            (l) => Spaces.showtoast('Error'),
            (albums) => charts.fold(
              (l) {
                Spaces.showtoast('error');
              },
              (charts) {
                emit(
                  Songstate(
                    topalbums: albums,
                    hindi: hindi,
                    Tamil: tamil,
                    Malayalam: malayalam,
                    trendingnow: trending,
                    English: english,
                    newlyreleased: newrelease,
                    charts: charts,
                  ),
                );
              },
            ),
          ),
        );
      } else {
        List<launchdataEntity> trending = await trendingnow.call(
          'english,korean',
        );
        List<launchdataEntity> malayalam = await trendingnow.call('malayalam');
        List<launchdataEntity> tamil = await trendingnow.call('tamil');
        List<launchdataEntity> english = await trendingnow.call('english');
        List<launchdataEntity> hindi = await trendingnow.call('hindi');
        Either<Failures, List<topchartsEntity>> charts = await topCharts.call();
        Either<Failures, List<launchdataEntity>> newly =
            await newtrending.call();
        Either<Failures, List<launchdataEntity>> topalbums =
            await gettopalbums.call();

        newly.fold(
          (l) => Spaces.showtoast('error'),
          (newrelease) => topalbums.fold(
            (l) => Spaces.showtoast('Error'),
            (albums) => charts.fold(
              (l) {
                Spaces.showtoast('error');
              },
              (charts) {
                emit(
                  Songstate(
                    topalbums: albums,
                    hindi: hindi,
                    Tamil: tamil,
                    Malayalam: malayalam,
                    trendingnow: trending,
                    English: english,
                    newlyreleased: newrelease,
                    charts: charts,
                  ),
                );
              },
            ),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
