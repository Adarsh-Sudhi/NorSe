import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/PlaylistEntity/PlaylistEntity.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/GetAlbumSongs_UseCase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getplaylists_Usecase.dart';

part 'albums_songs_event.dart';
part 'albums_songs_state.dart';

class AlbumsSongsBloc extends Bloc<AlbumsSongsEvent, AlbumsSongsState> {
  final GetAlbumSongsUseCase songsUseCase;
  final getplaylistdetailsUSeCase playlistUseCase;

  AlbumsSongsBloc(
    this.songsUseCase,
    this.playlistUseCase,
  ) : super(AlbumsSongsInitial()) {
    on<GetAlbumSongsEvent>((event, emit) async {
      emit(AlbumsSongsloading());
      List<AlbumSongEntity> songs = await songsUseCase.call(event.albumurl);
      emit(AlbumsSongsloaded(songs: songs));
    });

    on<GetPlaylistsSongsEvent>((event, emit) async {
      emit(AlbumsSongsloading());
      Either<Failures, List<playlistEntity>> songs =
          await playlistUseCase.call(event.id);
      songs.fold((l) {
        emit(playlistsongs(songs: const []));
      }, (r) {
        emit(playlistsongs(songs: r));
      });
    });
   
  }
}
