part of 'audio_bloc.dart';

@freezed
class AudioEvent with _$AudioEvent {
  const factory AudioEvent.started() = _Started;
  const factory AudioEvent.dispose() = _Dispose;

  const factory AudioEvent.localaudio(
    List<SongModel> songs,
    List<Map<String, dynamic>> favsongs,
    int index,
  ) = _Localaudio;

  const factory AudioEvent.onlineaudio(
    String key,
    int index,
    String downloadUrl,
    String poster,
    String name,
    String artists,
    List<Map> moreinfo,
    List<AlbumSongEntity> allsongs,
    List<SearchEntity> deachSongs,
    List<playlistEntity> playlistsongs,
  ) = _Onlineaudio;

  const factory AudioEvent.pause() = _Pause;
  const factory AudioEvent.resume() = _Resume;
  const factory AudioEvent.loopon(bool islooped) = _Loopon;
  const factory AudioEvent.shuffleon(bool isshuffled) = _Shuffleon;
  const factory AudioEvent.seeknextaudio() = _Seeknextaudio;
  const factory AudioEvent.SeekPreviousAudio() = _Seekpreviousaudio;

  const factory AudioEvent.updatequeue(
    String mode,
    int newindex,
    int oldindex,
  ) = _Updatequeue;

  const factory AudioEvent.getqueue() = _Queue;

  const factory AudioEvent.removeitemfromqueue(
    String mode,
    int indextoberemoved,
  ) = _Removefromqueue;

  const factory AudioEvent.addtonlinequeue(String type, OnlineSongModel song) =
      _AddtoOnlinequeue;

  const factory AudioEvent.addsongtoqueue(String type, Songmodel song) =
      _Addsongtoqueue;

  const factory AudioEvent.clearqueueexceptplaying(
    String mode,
    int currentplaying,
  ) = _Clearqueueexceptplaying;

  const factory AudioEvent.clearspecificaudio(String path, int id) =
      _ClearSpecificAudio;

  const factory AudioEvent.getsuggestionAndParse(
    List<AlbumSongEntity> allsongs,
    List<SearchEntity> deachSongs,
    List<playlistEntity> playlistsongs,
  ) = _GetSuggestionAndParse;

  const factory AudioEvent.getytsuggestionandparse(
    List<Video> videos,
    Video video,
    String types,
  ) = _Getytsuggestionandparse;

  const factory AudioEvent.ytmusiclisten(List<Video> video, int index,String types) =
      _Ytmusiclisten;
}
