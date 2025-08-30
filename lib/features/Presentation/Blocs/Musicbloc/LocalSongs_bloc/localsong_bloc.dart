// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/deletesongfromdevice_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getartistwise_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getgenre_usecase.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getalbuma_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getallsongs_UseCase.dart';
import '../../../../../configs/Error/Errors.dart';
import 'package:norse/injection_container.dart' as di;

part 'localsong_bloc.freezed.dart';
part 'localsong_event.dart';
part 'localsong_state.dart';

class LocalsongBloc extends Bloc<LocalsongEvent, LocalsongState> {
  final getallsongsUsecase getallsongs;
  final Getallalbumsusecase getallalbumsusecase;
  final GetArtistWiseUseCase getArtistWiseUseCase;
  LocalsongBloc(
    this.getallsongs,
    this.getallalbumsusecase,
    this.getArtistWiseUseCase,
  ) : super(const _Initial()) {
    on<_Getallsongs>((event, emit) async {
      emit(const LocalsongState.songs([], [], {}, [], true, false));
      Either<Failures, Map<String, dynamic>> artist =
          await getArtistWiseUseCase.call();
      Either<Failures, List<AlbumModel>> albums =
          await getallalbumsusecase.call();
      Either<Failures, List<SongModel>> songs = await getallsongs.call('songs');
      Either<Failures, List<GenreModel>> genre =
          await di.di<GetGenreUseCase>().call();
      songs.fold(
        (l) {
          emit(const LocalsongState.songs([], [], {}, [], false, true));
          Spaces.showtoast("Looks like your library is empty!, Download songs");

          log('Internal Song Faileed');
        },
        (songs) {
          albums.fold(
            (l) {
              log('Albums fetch failed');
            },
            (r) {
              artist.fold(
                (l) {
                  log('Artist songs Failed');
                },
                (artist) {
                  genre.fold(
                    (l) {
                      emit(
                        LocalsongState.songs(
                          songs,
                          r,
                          artist,
                          [],
                          false,
                          false,
                        ),
                      );
                    },
                    (genre) => emit(
                      LocalsongState.songs(
                        songs,
                        r,
                        artist,
                        genre,
                        false,
                        false,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      );
    });
    on<_RemoveSongFromDevice>((event, emit) async {
      await di.di<DeleteSongFromDeviceUseCase>().call(event.location).then((
        value,
      ) async {
        if (value) {
          Spaces.showtoast('Deleted Successfully');
          Either<Failures, List<SongModel>> songs = await getallsongs.call(
            'songs',
          );
          await songs.fold(
            (l) {
              log('internal song failed');
            },
            (r) async {
              Either<Failures, Map<String, dynamic>> artist =
                  await getArtistWiseUseCase.call();
              Either<Failures, List<AlbumModel>> albums =
                  await getallalbumsusecase.call();
              Either<Failures, List<SongModel>> songs = await getallsongs.call(
                'songs',
              );
              Either<Failures, List<GenreModel>> genre =
                  await di.di<GetGenreUseCase>().call();
              songs.fold(
                (l) {
                  log('Internal Song Failed');
                },
                (songs) {
                  albums.fold(
                    (l) {
                      log('Albums fetch failed');
                    },
                    (r) {
                      artist.fold(
                        (l) {
                          log('Artist songs Failed');
                        },
                        (artist) {
                          genre.fold(
                            (l) {
                              emit(
                                LocalsongState.songs(
                                  songs,
                                  r,
                                  artist,
                                  [],
                                  false,
                                  false,
                                ),
                              );
                            },
                            (genre) => emit(
                              LocalsongState.songs(
                                songs,
                                r,
                                artist,
                                genre,
                                false,
                                false,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        }
      });
    });
  }
}
