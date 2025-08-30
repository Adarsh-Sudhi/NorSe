part of 'download_song_bloc.dart';

sealed class DownloadSongState extends Equatable {
  const DownloadSongState();
  
  @override
  List<Object> get props => [];
}

final class DownloadSongInitial extends DownloadSongState {}
final class Downloadstarting extends DownloadSongState{}
final class DownloadSongStarted extends DownloadSongState {
  final List<Map<String,dynamic>> streams;
 DownloadSongStarted({required this.streams});
}
final class DownloadSongFinished extends DownloadSongState {}