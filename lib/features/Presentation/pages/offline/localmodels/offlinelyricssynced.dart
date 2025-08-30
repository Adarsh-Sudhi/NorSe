// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Data/Models/MusicModels/songmodel.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/CustomSliderWidget.dart';
import 'package:norse/features/Presentation/pages/offline/localmodels/waveformslider.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/testonlineplayerscreen.dart';

class SpotifyStyleOfflineFullScreenLyrics extends StatefulWidget {
  final String syncedLyrics;
  final AudioPlayer audioPlayer;
  final List<Songmodel> audios;
  final Size size;
  final Stream stream;
  final List<int> waveformOnlyint;

  const SpotifyStyleOfflineFullScreenLyrics({
    super.key,
    required this.syncedLyrics,
    required this.audioPlayer,
    required this.audios,
    required this.size,
    required this.stream,
    required this.waveformOnlyint,
  });

  @override
  State<SpotifyStyleOfflineFullScreenLyrics> createState() =>
      _SpotifyStyleFullScreenLyricsState();
}

class _SpotifyStyleFullScreenLyricsState
    extends State<SpotifyStyleOfflineFullScreenLyrics> {
  late List<LyricLine> _lyrics;
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final double _lineHeight = 60.0;
  late double _screenHeight;
  late StreamSubscription<Duration> _positionSubscription;

  String formatTime(double seconds) {
    int mins = seconds ~/ 60;
    int secs = (seconds % 60).toInt();
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(mins)}:${twoDigits(secs)}';
  }

  @override
  void initState() {
    super.initState();
    _lyrics = parseLyrics(widget.syncedLyrics);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenHeight = widget.size.height / 1.2;

    _positionSubscription = widget.audioPlayer.positionStream.listen((
      position,
    ) {
      if (!mounted) return;

      final index = _lyrics.lastIndexWhere((line) => line.time <= position);
      if (index != -1 && index != _currentIndex) {
        setState(() => _currentIndex = index);

        final targetOffset =
            (index * _lineHeight) - (_screenHeight / 2.2) + (_lineHeight / 2.2);

        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            targetOffset.clamp(0, _scrollController.position.maxScrollExtent),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInToLinear,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  Color _getColor(int index) {
    if (index == _currentIndex) return Colors.white;
    if (index < _currentIndex) return Colors.white;
    return Colors.white24;
  }

  double _getFontSize(int index) {
    return 22;
  }

  FontWeight _getFontWeight(int index) {
    return FontWeight.bold;
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
          ClipRRect(
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
                        if (snapshot.hasData && snapshot.data != null) {
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
                                height: MediaQuery.sizeOf(context).height,
                                width: MediaQuery.sizeOf(context).width,
                                child: QueryArtworkWidget(
                                  keepOldArtwork: true,
                                  size: 500,
                                  id: audios[songindex].id,
                                  type: ArtworkType.AUDIO,
                                  artworkHeight:
                                      MediaQuery.sizeOf(context).height,
                                  artworkWidth:
                                      MediaQuery.sizeOf(context).width,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: MediaQuery.sizeOf(context).height,
                                  width: MediaQuery.sizeOf(context).width,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withValues(alpha: 0.8),
                                        Colors.black.withValues(alpha: 0.5),
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
          SizedBox(
            height: size.height,
            width: size.width,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: Colors.transparent.withValues(alpha: 0.5),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _lyrics.length,
                      itemExtent: _lineHeight,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final lyric = _lyrics[index];
                        final color = _getColor(index);
                        final fontSize = _getFontSize(index);
                        final fontWeight = _getFontWeight(index);

                        return Container(
                          alignment: Alignment.center,

                          child: Text(
                            lyric.text,
                            style: TextStyle(
                              color: color,
                              fontSize: fontSize,
                              fontWeight: fontWeight,
                              shadows:
                                  index == _currentIndex
                                      ? [
                                        Shadow(
                                          color: Colors.lightGreenAccent
                                              .withValues(alpha: 0.2),
                                          blurRadius: 8,
                                          offset: const Offset(0, 0),
                                        ),
                                      ]
                                      : null,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
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
                                LocalStreams: (value) => value.pos.inSeconds,
                              )
                              .toDouble();

                      double duration =
                          snapshot.data!
                              .maybeMap(
                                orElse: () => 0,
                                LocalStreams: (value) => value.Dur.inSeconds,
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
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                        child: SizedBox(
                                          height: 30,
                                          width: widget.size.width,
                                          child: InteractiveBarSlideer(
                                            waveList: widget.waveformOnlyint,
                                            position: postion,
                                            duration: duration,
                                          ),
                                        ),
                                      )
                                      : SizedBox(),
                                  CustomSlider(
                                    activecolor: Colors.transparent,
                                    inactiveColor: Colors.transparent,
                                    audioPlayer: widget.audioPlayer,
                                    postion: postion,
                                    duration: duration,
                                    trackHeight: 3,
                                    thumshape: const RoundSliderThumbShape(
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      formatTime(postion),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    BlocBuilder<AudioBloc, AudioState>(
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
                                                return Stack(
                                                  alignment: Alignment.center,
                                                  children: [
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
                                                              audioPlayer
                                                                      .playing
                                                                  ? Ionicons
                                                                      .pause
                                                                  : Ionicons
                                                                      .play,
                                                          iconscolors:
                                                              Colors.black,
                                                          iconsize: 25,
                                                          ontap: () async {
                                                            if (audioPlayer
                                                                .playing) {
                                                              await audioPlayer
                                                                  .pause();
                                                            } else {
                                                              await audioPlayer
                                                                  .play();
                                                            }

                                                            setState(() {});
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
