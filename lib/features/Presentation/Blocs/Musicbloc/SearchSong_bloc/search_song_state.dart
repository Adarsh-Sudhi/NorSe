part of 'search_song_bloc.dart';

abstract class SearchSongState extends Equatable {
  const SearchSongState();
  
  @override
  List<Object> get props => [];
}

final class SearchSongInitial extends SearchSongState {}

final class SearchSongLoading extends SearchSongState {}

final class Songsuggestion extends SearchSongState {
  final List<SearchEntity> suggestions;

  Songsuggestion({required this.suggestions});
}

final class SearchSongLoaded extends SearchSongState {
  final List<SearchEntity> Seachsong;
  final List<AlbumSongEntity> albums;
  final List<launchdataEntity> playlists;

  const SearchSongLoaded({required this.playlists,required this.Seachsong,required this.albums});
}