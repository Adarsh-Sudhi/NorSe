import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_kit_video/media_kit_video.dart' as vid;
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Domain/UseCases/yt_usecase/getvideoinfo_usecase.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/injection_container.dart' as di;
import 'package:rxdart/rxdart.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:media_kit/media_kit.dart' as mid;

part 'youtubeplayer_event.dart';
part 'youtubeplayer_state.dart';
part 'youtubeplayer_bloc.freezed.dart';

final player0 = mid.Player();
final controller0 = vid.VideoController(player0);

class YoutubeplayerBloc extends Bloc<YoutubeplayerEvent, YoutubeplayerState> {
  YoutubeplayerBloc() : super(const _Initial()) {
    BehaviorSubject<Duration> videopostionstream = BehaviorSubject();

    BehaviorSubject<Duration> videodurationstream = BehaviorSubject();

    controller0.player.stream.duration.listen(
      (event) => videodurationstream.add(event),
    );
    controller0.player.stream.position.listen(
      (event) => videopostionstream.add(event),
    );

    on<_Started>((event, emit) async {
      await controller0.player.stop();
      await controller0.player.remove(0);
      emit(const YoutubeplayerState.initial());
    });

    on<_SwitchEvent>((event, emit) {
      emit(const YoutubeplayerState.switchstate());
    });

    on<_YtPlayerEvent>((event, emit) async {
      audioPlayer.pause();
      final streams = Rx.combineLatest2(
        videodurationstream.stream.asBroadcastStream(),
        videopostionstream.stream.asBroadcastStream(),
        (a, b) => {'d': a, 'p': b},
      );

      emit(
        YoutubeplayerState.youtubeplayerstate(
          {},
          event.index,
          event.videos,
          true,
          false,
          controller0,
          streams,
        ),
      );

      final streamManifest = await compute(
        getManifestInIsolate,
        event.videos[event.index].id.toString(),
      );

      List<VideoOnlyStreamInfo> video = List.from(streamManifest.videoOnly);

      AudioOnlyStreamInfo audioOnlyStreamInfo =
          streamManifest.audioOnly.withHighestBitrate();

      VideoOnlyStreamInfo videoOnlyStreamInfo = video.firstWhere(
        (e) =>
            e.qualityLabel ==
                Notifiers.videoQualityNotifier.value ||
            e.qualityLabel == '1080p' ||
            e.qualityLabel == '720p',
      );

      await controller0.player.open(
        mid.Media(videoOnlyStreamInfo.url.toString()),
      );

      await player0.setAudioTrack(
        mid.AudioTrack.uri(audioOnlyStreamInfo.url.toString()),
      );

      await Future.delayed(const Duration(milliseconds: 1500));

      await player0.play();

      Map<String, dynamic> infomap = await di.di<Getvideoinfousecase>().call(
        event.videos[event.index].id.toString(),
      );

      emit(
        YoutubeplayerState.youtubeplayerstate(
          infomap,
          event.index,
          event.videos,
          false,
          false,
          controller0,
          streams,
        ),
      );
    });
  }
}
