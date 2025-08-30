// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'download_song_bloc.dart';

sealed class DownloadSongEvent extends Equatable {
  const DownloadSongEvent();

  @override
  List<Object> get props => [];
}

class DownloadStated extends DownloadSongEvent {
    final String url;
    final String songname;
    final String artworkurl;
    final String artists;
    final String key;
    final String albumname;
    final int itemstreamindex;
    final BuildContext context;
  const DownloadStated({
    required this.url,
    required this.songname,
    required this.artworkurl,
    required this.artists,
    required this.key,
    required this.albumname,
    required this.itemstreamindex,
    required this.context,
  });
}

class CloseStream extends DownloadSongEvent {
  
}


class DownloadFinished extends DownloadSongEvent {
  
}
