import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_kit_video/media_kit_video.dart' show Video;
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Data/Models/MusicModels/songmodel.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/CustomSliderWidget.dart';
import 'package:norse/features/Presentation/pages/offline/localmodels/waveformslider.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/staticbar.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/testonlineplayerscreen.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlainLocalLyrics extends StatefulWidget {
  final String syncedLyrics;
  final AudioPlayer audioPlayer;
  final List<Songmodel> audios;
  final Size size;
  final Stream stream;
  final List<int> waveformOnlyint;

  const PlainLocalLyrics({
    super.key,
    required this.syncedLyrics,
    required this.audioPlayer,
    required this.audios,
    required this.size,
    required this.stream,
    required this.waveformOnlyint,
  });

  @override
  State<PlainLocalLyrics> createState() => _SpotifyStyleFullScreenLyricsState();
}

class _SpotifyStyleFullScreenLyricsState extends State<PlainLocalLyrics> {
  String formatTime(double seconds) {
    int mins = seconds ~/ 60;
    int secs = (seconds % 60).toInt();
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(mins)}:${twoDigits(secs)}';
  }

  String removeDurationTags(String lyrics) {
    final regex = RegExp(r'\[\d{2}:\d{2}\.\d{2}\]');
    return lyrics.replaceAll(regex, '').trim();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 15),
        ),
        title: BlocBuilder<AudioBloc, AudioState>(
          builder: (context, state1) {
            return state1.maybeWhen(
              orElse: () => const SizedBox(),
              Localsongs: (
                isloading,
                isfailed,
                audios,
                valueStream,
                index,
                audioPlayer,
              ) {
                return StreamBuilder(
                  stream: valueStream,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      int songindex = snapshot.data!.maybeWhen(
                        LocalStreams: (pos, dur, playerState, index) => index,
                        orElse: () => 0,
                      );

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textutil(
                            text: audios[songindex].title.split(".")[0],
                            fontsize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          Textutil(
                            text: audios[songindex].subtitle,
                            fontsize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                );
              },
            );
          },
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<
            YoutubePlayerBackgroundBloc,
            YoutubePlayerBackgroundState
          >(
            builder: (context, state) {
              return state.maybeWhen(
                playBgvideo:
                    (controller, streams) =>
                        Video(controller: controller, fit: BoxFit.cover),
                orElse:
                    () => ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      child: BlocBuilder<AudioBloc, AudioState>(
                        builder: (context, state1) {
                          return state1.maybeWhen(
                            orElse: () => const SizedBox(),
                            Localsongs: (
                              isloading,
                              isfailed,
                              audios,
                              valueStream,
                              index,
                              audioPlayer,
                            ) {
                              return StreamBuilder(
                                stream: valueStream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data != null) {
                                    int songindex = snapshot.data!.maybeMap(
                                      orElse: () => 0,
                                      LocalStreams: (val) {
                                        return val.index;
                                      },
                                    );

                                    return Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        SizedBox(
                                          height:
                                              MediaQuery.sizeOf(context).height,
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          child: QueryArtworkWidget(
                                            keepOldArtwork: true,
                                            size: 500,
                                            id: audios[songindex].id,
                                            type: ArtworkType.AUDIO,
                                            artworkHeight:
                                                MediaQuery.sizeOf(
                                                  context,
                                                ).height,
                                            artworkWidth:
                                                MediaQuery.sizeOf(
                                                  context,
                                                ).width,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            height:
                                                MediaQuery.sizeOf(
                                                  context,
                                                ).height,
                                            width:
                                                MediaQuery.sizeOf(
                                                  context,
                                                ).width,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.black.withValues(
                                                    alpha: 0.8,
                                                  ),
                                                  Colors.black.withValues(
                                                    alpha: 0.5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
              );
            },
          ),
          BlocBuilder<
            YoutubePlayerBackgroundBloc,
            YoutubePlayerBackgroundState
          >(
            builder: (context, state) {
              return state.maybeWhen(
                playBgvideo: (controller, streams) => DarkGradientOverlay(),
                orElse:
                    () => SizedBox(
                      height: size.height,
                      width: size.width,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          color: Colors.transparent.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
              );
            },
          ),

          Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: LyricsScroller(
                      lyrics: removeDurationTags(widget.syncedLyrics),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: BlocBuilder<
                  YoutubePlayerBackgroundBloc,
                  YoutubePlayerBackgroundState
                >(
                  builder: (context, youtube) {
                    return youtube.maybeWhen(
                      playBgvideo: (controlleryt, d) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StreamBuilder(
                                    stream: d,
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null &&
                                          snapshot.hasData) {
                                        Duration dur =
                                            snapshot.data!['d'] as Duration;
                                        Duration pos =
                                            snapshot.data!['p'] as Duration;
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                widget
                                                        .waveformOnlyint
                                                        .isNotEmpty
                                                    ? Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                          ),
                                                      child: SizedBox(
                                                        height: 30,
                                                        width: size.width,
                                                        child: InteractiveBarSlideer(
                                                          waveList:
                                                              widget
                                                                  .waveformOnlyint,
                                                          position:
                                                              pos.inSeconds
                                                                  .toDouble(),
                                                          duration:
                                                              dur.inSeconds
                                                                  .toDouble(),
                                                        ),
                                                      ),
                                                    )
                                                    : InteractiveBarSlider(
                                                      position:
                                                          pos.inSeconds
                                                              .toDouble(),
                                                      duration:
                                                          dur.inSeconds
                                                              .toDouble(),
                                                    ),
                                                SliderTheme(
                                                  data: const SliderThemeData(
                                                    trackShape:
                                                        RectangularSliderTrackShape(),
                                                    trackHeight: 5,
                                                    thumbShape:
                                                        RoundSliderThumbShape(
                                                          enabledThumbRadius: 5,
                                                          disabledThumbRadius:
                                                              5,
                                                          elevation: 5,
                                                        ),
                                                  ),
                                                  child: Slider(
                                                    secondaryActiveColor:
                                                        Colors.transparent,
                                                    thumbColor: Colors.white,
                                                    activeColor:
                                                        Colors.transparent,
                                                    inactiveColor:
                                                        Colors.transparent,
                                                    value:
                                                        pos.inSeconds
                                                            .toDouble(),
                                                    max:
                                                        dur.inSeconds
                                                            .toDouble(),
                                                    min:
                                                        const Duration(
                                                          microseconds: 0,
                                                        ).inSeconds.toDouble(),
                                                    onChanged: (value) async {
                                                      Duration duration0 =
                                                          Duration(
                                                            seconds:
                                                                value.toInt(),
                                                          );
                                                      controlleryt.player.seek(
                                                        duration0,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 22,
                                                left: 23,
                                                top: 0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    pos
                                                        .toString()
                                                        .split(".")[0]
                                                        .replaceRange(0, 2, ""),
                                                    style: const TextStyle(
                                                      color: Color.fromARGB(
                                                        255,
                                                        255,
                                                        255,
                                                        255,
                                                      ),
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Card(
                                                    elevation: 11,
                                                    color: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            60,
                                                          ),
                                                    ),
                                                    child: Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color.fromARGB(
                                                              255,
                                                              239,
                                                              239,
                                                              239,
                                                            ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              60,
                                                            ),
                                                      ),
                                                      child: PlayIcons(
                                                        playicons:
                                                            controlleryt
                                                                    .player
                                                                    .state
                                                                    .playing
                                                                ? Ionicons.pause
                                                                : Ionicons.play,
                                                        iconscolors:
                                                            Colors.black,
                                                        iconsize: 25,
                                                        ontap: () async {
                                                          if (controlleryt
                                                              .player
                                                              .state
                                                              .playing) {
                                                            await controlleryt
                                                                .player
                                                                .pause();
                                                          } else {
                                                            await controlleryt
                                                                .player
                                                                .play();
                                                          }

                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    dur
                                                        .toString()
                                                        .split(".")[0]
                                                        .replaceRange(0, 2, ""),
                                                    style: const TextStyle(
                                                      color: Color.fromARGB(
                                                        255,
                                                        255,
                                                        255,
                                                        255,
                                                      ),
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      orElse:
                          () => SizedBox(
                            height: 130,
                            width: widget.size.width,
                            child: StreamBuilder(
                              stream: widget.stream,
                              builder: (context, snapshot) {
                                if (snapshot.data != null && snapshot.hasData) {
                                  double postion =
                                      snapshot.data!
                                          .maybeMap(
                                            orElse: () => 0,
                                            LocalStreams:
                                                (value) => value.pos.inSeconds,
                                          )
                                          .toDouble();

                                  double duration =
                                      snapshot.data!
                                          .maybeMap(
                                            orElse: () => 0,
                                            LocalStreams:
                                                (value) => value.Dur.inSeconds,
                                          )
                                          .toDouble();

                                  return Column(
                                    children: [
                                      Column(
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              widget.waveformOnlyint.isNotEmpty
                                                  ? Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 5,
                                                        ),
                                                    child: SizedBox(
                                                      height: 30,
                                                      width: widget.size.width,
                                                      child: InteractiveBarSlideer(
                                                        waveList:
                                                            widget
                                                                .waveformOnlyint,
                                                        position: postion,
                                                        duration: duration,
                                                      ),
                                                    ),
                                                  )
                                                  : SizedBox(),
                                              CustomSlider(
                                                activecolor: Colors.transparent,
                                                inactiveColor:
                                                    Colors.transparent,
                                                audioPlayer: widget.audioPlayer,
                                                postion: postion,
                                                duration: duration,
                                                trackHeight: 3,
                                                thumshape:
                                                    const RoundSliderThumbShape(
                                                      disabledThumbRadius: 4,
                                                      enabledThumbRadius: 4,
                                                      elevation: 4,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 23,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  formatTime(postion),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                BlocBuilder<
                                                  AudioBloc,
                                                  AudioState
                                                >(
                                                  builder: (context, state1) {
                                                    return state1.maybeWhen(
                                                      orElse:
                                                          () =>
                                                              const SizedBox(),
                                                      Localsongs: (
                                                        isloading,
                                                        isfailed,
                                                        audios,
                                                        valueStream,
                                                        index,
                                                        audioPlayer,
                                                      ) {
                                                        return StreamBuilder(
                                                          stream: valueStream,
                                                          builder: (
                                                            context,
                                                            snapshot,
                                                          ) {
                                                            return Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                Card(
                                                                  elevation: 11,
                                                                  color:
                                                                      Colors
                                                                          .white,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          60,
                                                                        ),
                                                                  ),
                                                                  child: Container(
                                                                    height: 60,
                                                                    width: 60,
                                                                    decoration: BoxDecoration(
                                                                      color:
                                                                          const Color.fromARGB(
                                                                            255,
                                                                            239,
                                                                            239,
                                                                            239,
                                                                          ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            60,
                                                                          ),
                                                                    ),
                                                                    child: PlayIcons(
                                                                      playicons:
                                                                          audioPlayer.playing
                                                                              ? Ionicons.pause
                                                                              : Ionicons.play,
                                                                      iconscolors:
                                                                          Colors
                                                                              .black,
                                                                      iconsize:
                                                                          25,
                                                                      ontap: () async {
                                                                        if (audioPlayer
                                                                            .playing) {
                                                                          await audioPlayer
                                                                              .pause();
                                                                        } else {
                                                                          await audioPlayer
                                                                              .play();
                                                                        }

                                                                        setState(
                                                                          () {},
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),

                                                Text(
                                                  formatTime(duration),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LyricLine {
  final Duration time;
  final String text;

  LyricLine({required this.time, required this.text});
}

List<LyricLine> parseLyrics(String raw) {
  final regex = RegExp(r'\[(\d{2}):(\d{2})\.(\d{2})\]\s*(.*)');
  final lines = <LyricLine>[];

  for (final line in raw.split('\n')) {
    final match = regex.firstMatch(line);
    if (match != null) {
      final minutes = int.parse(match.group(1)!);
      final seconds = int.parse(match.group(2)!);
      final millis = int.parse(match.group(3)!);
      final text = match.group(4) ?? '';

      lines.add(
        LyricLine(
          time: Duration(
            minutes: minutes,
            seconds: seconds,
            milliseconds: millis * 10,
          ),
          text: text,
        ),
      );
    }
  }

  return lines;
}

class LyricsScroller extends StatefulWidget {
  final String lyrics;

  const LyricsScroller({super.key, required this.lyrics});

  @override
  State<LyricsScroller> createState() => _LyricsScrollerState();
}

class _LyricsScrollerState extends State<LyricsScroller> {
  final ScrollController _scrollController = ScrollController();
  final double lineHeight = 60.0;

  double getCenterOffset(double containerHeight) =>
      _scrollController.offset + containerHeight / 2;

  @override
  Widget build(BuildContext context) {
    final lines = widget.lyrics.trim().split('\n');

    return LayoutBuilder(
      builder: (context, constraints) {
        return NotificationListener<ScrollNotification>(
          onNotification: (_) {
            setState(() {});
            return false;
          },
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.only(top: constraints.maxHeight / 2),
            itemCount: lines.length, // +1 for top spacer
            itemBuilder: (context, index) {
              return Container(
                height: lineHeight,
                alignment: Alignment.center,
                child: Text(
                  lines[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class DarkGradientOverlay extends StatelessWidget {
  const DarkGradientOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          // Vertical (Top & Bottom)
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.9),
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.1),
                  Colors.transparent,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.8),
                  Colors.black.withValues(alpha: 0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Horizontal (Left & Right)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(150, 0, 0, 0),
                  Color.fromARGB(100, 0, 0, 0),
                  Colors.transparent,
                  Colors.transparent,
                  Color.fromARGB(100, 0, 0, 0),
                  Color.fromARGB(150, 0, 0, 0),
                ],
                stops: [0.0, 0.12, 0.3, 0.7, 0.88, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
