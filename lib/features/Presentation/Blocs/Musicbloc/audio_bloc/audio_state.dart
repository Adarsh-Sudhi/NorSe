part of 'audio_bloc.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState.initial() = _Initial;

  const factory AudioState.onlinesongs(
    bool isloading,
    bool isfailed,
    List<OnlineSongModel> audios,
    ValueStream<AudioState> valueStream,
    int index,
    AudioPlayer audioPlayer,
  ) = _Onlinesongs;

  const factory AudioState.Localsongs(
    bool isloading,
    bool isfailed,
    List<Songmodel> audios,
    ValueStream<AudioState> valueStream,
    int index,
    AudioPlayer audioPlayer,
  ) = _Localsongs;

  const factory AudioState.LocalStreams(
    Duration pos,
    Duration Dur,
    PlayerState playerState,
    int index,
  ) = _Localstreams;

  const factory AudioState.onlinestreams(
    Duration pos,
    Duration dur,
    PlayerState playerState,
    int index,
  ) = _Onlinestreams;

  const factory AudioState.youtubeplayerstate(int index, List<Video> video) =
      _YoutubePlayerState;

  const factory AudioState.loading(
    String imageurl,
    String title,
    String subtitle,
  ) = _Loading;
  const factory AudioState.ytmusic(
    Video video,
    int index,
    bool isloading,
    bool isfailed,
    ValueStream<AudioState> valueStream,
    List<OnlineSongModel> songs,
    AudioPlayer audioPlayer,
  ) = _Ytmusic;
}
