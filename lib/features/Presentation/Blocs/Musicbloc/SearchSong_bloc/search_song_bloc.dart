import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SearchSongEntity/SearchEntity.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/GetSearchedAlbums_USeCase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/SearchPlaylist_UseCase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/SearchSong_UseCase.dart';

part 'search_song_event.dart';
part 'search_song_state.dart';

class SearchSongBloc extends Bloc<SearchSongEvent, SearchSongState> {
  final SearchSongUseCase useCase;
  final GetSearchedAlbumsUseCase getSearchedAlbumsUseCase;
  final SearchPlaylistUseCase playlistUseCase;
  SearchSongBloc(
    this.useCase,
    this.getSearchedAlbumsUseCase,
    this.playlistUseCase,
  ) : super(SearchSongInitial()) {
    on<Initiall>((event, emit) => emit(SearchSongInitial()));
    on<GetSearchSong>((event, emit) async {
      emit(SearchSongLoading());
      List<SearchEntity> searchentity = await useCase.call(event.Querydata);
      List<AlbumSongEntity> albums =
          await getSearchedAlbumsUseCase.call(event.Querydata);
      List<launchdataEntity> playlists =
          await playlistUseCase.call(event.Querydata);
      emit(SearchSongLoaded(
          Seachsong: searchentity, albums: albums, playlists: playlists));
    });
    on<Suggestions>((event, emit) async {
      List<SearchEntity> searchentity = await useCase.call(event.query);
      emit(Songsuggestion(suggestions: searchentity));
    });
  }
}
