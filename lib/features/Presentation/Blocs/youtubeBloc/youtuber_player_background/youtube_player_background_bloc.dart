import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as vidlib;
import 'package:norse/injection_container.dart' as di;
import 'package:media_kit/media_kit.dart' as mediaplayer;
import 'package:media_kit_video/media_kit_video.dart';

part 'youtube_player_background_event.dart';
part 'youtube_player_background_state.dart';
part 'youtube_player_background_bloc.freezed.dart';

class YoutubePlayerBackgroundBloc
    extends Bloc<YoutubePlayerBackgroundEvent, YoutubePlayerBackgroundState> {
  YoutubePlayerBackgroundBloc() : super(const _Initial()) {
    late final player = mediaplayer.Player();
    late final controller = VideoController(player);

    BehaviorSubject<Duration> videopostionstream = BehaviorSubject();
    BehaviorSubject<Duration> videodurationstream = BehaviorSubject();

    final yt = di.di<vidlib.YoutubeExplode>();

    controller.player.stream.duration.listen(
      (event) => videodurationstream.add(event),
    );
    controller.player.stream.position.listen(
      (event) => videopostionstream.add(event),
    );

    on<_Started>((event, emit) async {
       await controller.player.pause();
       await controller.player.remove(0);
      emit(const YoutubePlayerBackgroundState.initial());
    });

    on<_Initialize>((event, emit) async {
      emit(const YoutubePlayerBackgroundState.loadingBg());

      try {
        String title = event.idortitle;

        vidlib.VideoSearchList searchlist = await yt.search.search(
          title,
          filter: vidlib.TypeFilters.video,
        );

        vidlib.Video song = searchlist.first;

        final streamManifest = await compute(
          getManifestInIsolate,
          song.id.toString(),
        );

        List<vidlib.VideoOnlyStreamInfo> video = List.from(
          streamManifest.videoOnly,
        );

        vidlib.AudioOnlyStreamInfo audioOnlyStreamInfo =
            streamManifest.audioOnly.withHighestBitrate();

        vidlib.VideoOnlyStreamInfo videoOnlyStreamInfo =
            Notifiers.videoQualityNotifier.value == "high 4k"
                ? video.withHighestBitrate()
                : Notifiers.videoQualityNotifier.value == "medium 1440p"
                ? video.firstWhere((e) => e.qualityLabel == "1440p")
                : Notifiers.videoQualityNotifier.value == "medium 1080p"
                ? video.firstWhere((e) => e.qualityLabel == "1080p")
                : video.firstWhere((e) => e.qualityLabel == "720p");
        log(videoOnlyStreamInfo.qualityLabel.toLowerCase());

        await player.open(
          mediaplayer.Media(videoOnlyStreamInfo.url.toString()),
        );

        await player.setAudioTrack(
          mediaplayer.AudioTrack.uri(audioOnlyStreamInfo.url.toString()),
        );

        await Future.delayed(const Duration(milliseconds: 1500));

        final streams = Rx.combineLatest2(
          videodurationstream.stream.asBroadcastStream(),
          videopostionstream.stream.asBroadcastStream(),
          (a, b) => {'d': a, 'p': b},
        );

        await player.play();

        emit(
          YoutubePlayerBackgroundState.playBgvideo(
            controller,
            streams.asBroadcastStream(),
          ),
        );
      } catch (e) {
        Spaces.showtoast('Server Busy');
        emit(const YoutubePlayerBackgroundState.initial());
      }
    });
  }
}
