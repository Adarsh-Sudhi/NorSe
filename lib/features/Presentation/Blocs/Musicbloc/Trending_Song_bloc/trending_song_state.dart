// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trending_song_bloc.dart';

sealed class TrendingSongState extends Equatable {
  const TrendingSongState();

  @override
  List<Object> get props => [];
}

class TrendingSongInitial extends TrendingSongState {}

class TrendingSongLoading extends TrendingSongState {}

@immutable
class Songstate extends TrendingSongState {
  final List<launchdataEntity> Tamil;
  final List<launchdataEntity> Malayalam;
  final List<launchdataEntity> English;
  final List<launchdataEntity> trendingnow;
  final List<launchdataEntity> hindi;
  final List<launchdataEntity> newlyreleased;
  final List<launchdataEntity> topalbums;
  final List<topchartsEntity> charts;

  Songstate(
      {required this.Tamil,
      required this.Malayalam,
      required this.English,
      required this.trendingnow,
      required this.hindi,
      required this.newlyreleased,
      required this.topalbums,
      required this.charts});
}

class AlbumsongsState extends TrendingSongState {
  final List<AlbumSongEntity> Albumsongs;
  AlbumsongsState({
    required this.Albumsongs,
  });
}
