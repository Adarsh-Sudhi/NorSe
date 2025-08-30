// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_kit_video/media_kit_video.dart';

import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';

import '../../../configs/constants/Spaces.dart';
import '../../Data/Models/MusicModels/onlinesongmodel.dart';
import '../Blocs/Musicbloc/audio_bloc/audio_bloc.dart';

class MusicbottombarWidget extends StatefulWidget {
  const MusicbottombarWidget({
    Key? key,
    required this.songindex,
    required this.type,
    required this.ontap,
    required this.audios,
    required this.audioPlayer,
    required this.playerState,
    required this.pos,
    required this.dur,
    required this.isloading,
    required this.onchange,
  }) : super(key: key);

  final int songindex;
  final String type;
  final VoidCallback ontap;
  final List<OnlineSongModel> audios;
  final AudioPlayer audioPlayer;
  final PlayerState playerState;
  final double pos;
  final double dur;
  final bool isloading;
  final ValueChanged<double> onchange;

  @override
  State<MusicbottombarWidget> createState() => _MusicbottombarWidgetState();
}

class _MusicbottombarWidgetState extends State<MusicbottombarWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: SizedBox(
        height: 70,

        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  BlocBuilder<
                    YoutubePlayerBackgroundBloc,
                    YoutubePlayerBackgroundState
                  >(
                    builder: (context, state) {
                      return state.maybeWhen(
                        playBgvideo: (controller, streams) {
                          return Video(
                            fit: BoxFit.fitWidth,
                            controls: (state) => SizedBox(),
                            controller: controller,
                          );
                        },
                        orElse:
                            () => Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      widget.audios[widget.songindex].imageurl,
                                  fit: BoxFit.fitWidth,
                                ),
                                Container(
                                  color: Colors.black.withValues(alpha: 0.7),
                                ),
                              ],
                            ),
                      );
                    },
                  ),

                  SizedBox(
                    height: 60,
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,

                          child: Image.network(
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/musical-note.png',
                                color: Colors.black.withValues(alpha: 0.6),
                              );
                            },
                            widget.audios[widget.songindex].imageurl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16,
                              width: 150,
                              child: Textutil(
                                text: widget.audios[widget.songindex].title,
                                fontsize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                              width: 100,
                              child: Textutil(
                                text: widget.audios[widget.songindex].artist,
                                fontsize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        widget.isloading
                            ? SizedBox(
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<AudioBloc>(context).add(
                                        const AudioEvent.SeekPreviousAudio(),
                                      );
                                    },
                                    icon: Icon(
                                      Ionicons.play_back,
                                      color:
                                          widget.audioPlayer.hasPrevious
                                              ? Colors.white
                                              : Colors.grey,
                                      size: 15,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      widget.playerState.playing == true
                                          ? BlocProvider.of<AudioBloc>(
                                            context,
                                          ).add(const AudioEvent.pause())
                                          : BlocProvider.of<AudioBloc>(
                                            context,
                                          ).add(const AudioEvent.resume());
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<AudioBloc>(
                                        context,
                                      ).add(const AudioEvent.seeknextaudio());
                                    },
                                    icon: Icon(
                                      Ionicons.play_forward,
                                      color:
                                          widget.audioPlayer.hasNext
                                              ? Colors.white
                                              : Colors.grey,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : BlocBuilder<
                              YoutubePlayerBackgroundBloc,
                              YoutubePlayerBackgroundState
                            >(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  playBgvideo:
                                      (controller, streams) => SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Spaces.showtoast(
                                                  "Switch back to audio streaming",
                                                );
                                              },
                                              icon: Icon(
                                                Ionicons.play_back,
                                                color:
                                                    widget
                                                            .audioPlayer
                                                            .hasPrevious
                                                        ? Colors.white
                                                        : Colors.grey,
                                                size: 15,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                controller
                                                            .player
                                                            .state
                                                            .playing ==
                                                        true
                                                    ? await controller.player
                                                        .pause()
                                                    : await controller.player
                                                        .play();
                                                setState(() {});
                                              },
                                              child:
                                                  controller
                                                              .player
                                                              .state
                                                              .buffering ==
                                                          true
                                                      ? SizedBox(
                                                        height: 40,
                                                        width: 40,
                                                        child:
                                                            CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      )
                                                      : Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                50,
                                                              ),
                                                          color: Colors.white,
                                                        ),
                                                        child: Icon(
                                                          controller
                                                                      .player
                                                                      .state
                                                                      .playing ==
                                                                  true
                                                              ? Ionicons.pause
                                                              : Ionicons.play,
                                                          color: Colors.black,
                                                          size: 19,
                                                        ),
                                                      ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Spaces.showtoast(
                                                  "Switch back to audio streaming",
                                                );
                                              },
                                              icon: Icon(
                                                Ionicons.play_forward,
                                                color:
                                                    widget.audioPlayer.hasNext
                                                        ? Colors.white
                                                        : Colors.grey,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  orElse:
                                      () => SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                BlocProvider.of<AudioBloc>(
                                                  context,
                                                ).add(
                                                  const AudioEvent.SeekPreviousAudio(),
                                                );
                                              },
                                              icon: Icon(
                                                Ionicons.play_back,
                                                color:
                                                    widget
                                                            .audioPlayer
                                                            .hasPrevious
                                                        ? Colors.white
                                                        : Colors.grey,
                                                size: 15,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                widget.playerState.playing ==
                                                        true
                                                    ? BlocProvider.of<
                                                      AudioBloc
                                                    >(context).add(
                                                      const AudioEvent.pause(),
                                                    )
                                                    : BlocProvider.of<
                                                      AudioBloc
                                                    >(context).add(
                                                      const AudioEvent.resume(),
                                                    );
                                              },
                                              child:
                                                  widget
                                                              .playerState
                                                              .processingState ==
                                                          ProcessingState
                                                              .buffering
                                                      ? SizedBox(
                                                        height: 40,
                                                        width: 40,
                                                        child:
                                                            CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      )
                                                      : Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                50,
                                                              ),
                                                          color: Colors.white,
                                                        ),
                                                        child: Icon(
                                                          widget
                                                                      .playerState
                                                                      .playing ==
                                                                  true
                                                              ? Ionicons.pause
                                                              : Ionicons.play,
                                                          color: Colors.black,
                                                          size: 19,
                                                        ),
                                                      ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                BlocProvider.of<AudioBloc>(
                                                  context,
                                                ).add(
                                                  const AudioEvent.seeknextaudio(),
                                                );
                                              },
                                              icon: Icon(
                                                Ionicons.play_forward,
                                                color:
                                                    widget.audioPlayer.hasNext
                                                        ? Colors.white
                                                        : Colors.grey,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                );
                              },
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
