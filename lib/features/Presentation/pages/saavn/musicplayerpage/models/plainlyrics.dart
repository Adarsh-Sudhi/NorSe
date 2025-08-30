import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Data/Models/MusicModels/onlinesongmodel.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/staticbar.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/testonlineplayerscreen.dart';

class Plainlyrics extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final List<OnlineSongModel> audios;
  final Size size;
  final Stream stream;
  final String lyrics;
  const Plainlyrics({
    super.key,
    required this.audioPlayer,
    required this.audios,
    required this.size,
    required this.stream,
    required this.lyrics,
  });

  @override
  State<Plainlyrics> createState() => _PlainlyricsState();
}

class _PlainlyricsState extends State<Plainlyrics> {
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
    return Scaffold(
      backgroundColor: Spaces.backgroundColor,
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
              ytmusic:
                  (
                    video,
                    index,
                    isloading,
                    isfailed,
                    valueStream,
                    songs,
                    audioPlayer,
                  ) => StreamBuilder(
                    stream: valueStream,
                    builder: (context, snapshot) {
                      if (snapshot.data != null && snapshot.hasData) {
                        int songindex = snapshot.data!.maybeWhen(
                          onlinestreams:
                              (pos, dur, playerState, index) => index,
                          orElse: () => 0,
                        );

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textutil(
                              text: songs[songindex].title,
                              fontsize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            Textutil(
                              text: songs[songindex].artist,
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
                  ),
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
                    if (snapshot.data != null && snapshot.hasData) {
                      int songindex = snapshot.data!.maybeWhen(
                        onlinestreams: (pos, dur, playerState, index) => index,
                        orElse: () => 0,
                      );

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textutil(
                            text: audios[songindex].title,
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
              onlinesongs: (
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
                    if (snapshot.data != null && snapshot.hasData) {
                      int songIndex = snapshot.data!.maybeWhen(
                        onlinestreams: (pos, dur, playerState, index) => index,
                        orElse: () => 0,
                      );

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textutil(
                            text: audios[songIndex].title,
                            fontsize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          Textutil(
                            text: audios[songIndex].artist,
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
      body: SizedBox(
        width: widget.size.width,
        height: widget.size.height,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    child: BlocBuilder<AudioBloc, AudioState>(
                      builder: (context, state1) {
                        return state1.maybeWhen(
                          ytmusic:
                              (
                                video,
                                index,
                                isLoading,
                                isFailed,
                                valueStream,
                                songs,
                                audioPlayer,
                              ) => StreamBuilder(
                                stream: valueStream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data != null) {
                                    int songindex = snapshot.data!.maybeMap(
                                      orElse: () => 0,
                                      onlinestreams: (val) {
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
                                          child: ImageFiltered(
                                            imageFilter: ImageFilter.blur(
                                              sigmaX: 20,
                                              sigmaY: 20,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  songs[songindex].imageurl,
                                              fit: BoxFit.cover,
                                              filterQuality: FilterQuality.low,
                                            ),
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
                                    return SizedBox();
                                  }
                                },
                              ),
                          orElse: () => const SizedBox(),

                          onlinesongs: (
                            isLoading,
                            isFailed,
                            audios,
                            valueStream,
                            index,
                            audioPlayer,
                          ) {
                            return StreamBuilder(
                              stream: valueStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData && snapshot.data != null) {
                                  int songIndex = snapshot.data!.maybeMap(
                                    orElse: () => 0,
                                    onlinestreams: (val) {
                                      return val.index;
                                    },
                                  );

                                  return Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height,
                                        width: MediaQuery.sizeOf(context).width,
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 20,
                                            sigmaY: 20,
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                audios[songIndex].imageurl,
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.low,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height:
                                              MediaQuery.sizeOf(context).height,
                                          width:
                                              MediaQuery.sizeOf(context).width,
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
                                  return SizedBox();
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    width: widget.size.width,
                    height: widget.size.height,
                    child: Column(
                      children: [
                        Expanded(
                          child: SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  child: Text(
                                    removeDurationTags(
                                      widget.lyrics.replaceAll("<br>", ""),
                                    ), // Replace with your lyrics string variable
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
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
                                double pos =
                                    snapshot.data!
                                        .maybeMap(
                                          orElse: () => 0,
                                          onlinestreams:
                                              (value) => value.pos.inSeconds,
                                        )
                                        .toDouble();

                                double dur =
                                    snapshot.data!
                                        .maybeMap(
                                          orElse: () => 0,
                                          onlinestreams:
                                              (value) => value.dur.inSeconds,
                                        )
                                        .toDouble();
                                return Column(
                                  children: [
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            InteractiveBarSlider(
                                              position: pos,
                                              duration: dur,
                                            ),
                                            SliderTheme(
                                              data: const SliderThemeData(
                                                trackShape:
                                                    RectangularSliderTrackShape(),
                                                trackHeight: 7,
                                                thumbShape:
                                                    RoundSliderThumbShape(
                                                      disabledThumbRadius: 6,
                                                      enabledThumbRadius: 6,
                                                    ),
                                              ),
                                              child: Slider(
                                                secondaryActiveColor:
                                                    Colors.transparent,
                                                thumbColor:
                                                    const Color.fromARGB(
                                                      255,
                                                      255,
                                                      255,
                                                      255,
                                                    ),
                                                activeColor: Colors.transparent,
                                                inactiveColor:
                                                    Colors.transparent,
                                                value: pos,
                                                max: dur,
                                                min:
                                                    const Duration(
                                                      microseconds: 0,
                                                    ).inSeconds.toDouble(),
                                                onChanged: (value) async {
                                                  Duration duration = Duration(
                                                    seconds: value.toInt(),
                                                  );
                                                  await widget.audioPlayer.seek(
                                                    duration,
                                                  );
                                                },
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
                                                formatTime(pos),
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
                                                    ytmusic: (
                                                      video,
                                                      index,
                                                      isloading,
                                                      isfailed,
                                                      valueStream,
                                                      songs,
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
                                                    orElse:
                                                        () => const SizedBox(),

                                                    onlinesongs: (
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
                                                formatTime(dur),
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
