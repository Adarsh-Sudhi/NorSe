// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'albums_songs_bloc.dart';

abstract class AlbumsSongsEvent extends Equatable {
  const AlbumsSongsEvent();

  @override
  List<Object> get props => [];
}

class GetAlbumSongsEvent extends AlbumsSongsEvent {
  final String albumurl;
  const GetAlbumSongsEvent({
    required this.albumurl,
  });
}

class GetPlaylistsSongsEvent extends AlbumsSongsEvent {
  final String id;
  const GetPlaylistsSongsEvent({
    required this.id,
  });
}

class Getsongsfromalbum extends AlbumsSongsEvent {
  final int id;

  const Getsongsfromalbum({required this.id});
}

class GetArtistSongs extends AlbumsSongsEvent {
  final int id;
  const GetArtistSongs({
    required this.id,
  });
}

class GetSongsFromGenre extends AlbumsSongsEvent {
  final int id;

  const GetSongsFromGenre({required this.id});
}
