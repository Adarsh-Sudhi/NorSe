import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Presentation/Blocs/Connectivity_bloc/connnectivity_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/Lyrics_bloc/lyrics_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';

import 'package:norse/features/Presentation/pages/MainHomePage/MainHomePage.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/lyricsmodel0.dart';

class LyricsModel extends StatefulWidget {
  const LyricsModel({super.key, required this.size, required this.title});
  final Size size;
  final String title;

  @override
  State<LyricsModel> createState() => _LyricsModelState();
}

class _LyricsModelState extends State<LyricsModel> {
  int progresss = 0;

  late int lateindex = 100;

  int lyricsindex = 600;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height,
      width: widget.size.width,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<AudioBloc, AudioState>(
                builder: (context, state) {
                  return state.maybeWhen(
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
                            int songindex = snapshot.data!.maybeWhen(
                              LocalStreams:
                                  (pos, dur, playerState, index) => index,
                              orElse: () => 0,
                            );

                            if (lateindex != songindex) {
                              BlocProvider.of<LyricsBloc>(context).add(
                                LyricsEvent.getlyrics(
                                  audios[songindex].id.toString(),
                                  audios[songindex].title.split(".")[0],
                                ),
                              );
                              lateindex = songindex;
                            }

                            return Column(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                      ),
                                                  child: Textutil(
                                                    text:
                                                        "${audios[songindex].title
                                                                .contains('.')
                                                            ? audios[songindex]
                                                                .title
                                                                .split(".")[0]
                                                            : audios[songindex]
                                                                .title} • Lyrics",
                                                    fontsize: 23,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                      ),
                                                  child: Textutil(
                                                    text:
                                                        audios[songindex]
                                                            .subtitle,
                                                    fontsize: 12,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spaces.kheight10,
                                      Expanded(
                                        child: BlocBuilder<
                                          ConnnectivityBloc,
                                          ConnnectivityState
                                        >(
                                          builder: (context, state) {
                                            return state.maybeWhen(
                                              networkstate: (isavailable) {
                                                return isavailable
                                                    ? Stack(
                                                      fit: StackFit.expand,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              widget.size.width,
                                                          child: Column(
                                                            children: [
                                                              Expanded(
                                                                child: SizedBox(
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsets.only(
                                                                          left:
                                                                              2,
                                                                          right:
                                                                              2,
                                                                          bottom:
                                                                              10,
                                                                        ),
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              30,
                                                                            ),
                                                                      ),
                                                                      child: Stack(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        children: [
                                                                          BlocBuilder<
                                                                            LyricsBloc,
                                                                            LyricsState
                                                                          >(
                                                                            builder: (
                                                                              context,
                                                                              state,
                                                                            ) {
                                                                              return state.maybeWhen(
                                                                                lyrics: (
                                                                                  lyrics,
                                                                                ) {
                                                                                  List<
                                                                                    String
                                                                                  >
                                                                                  orginalLyrices = lyrics['lyrics'].toString().split(
                                                                                    '<br>',
                                                                                  );
                                                                                  return Stack(
                                                                                    fit:
                                                                                        StackFit.expand,
                                                                                    children: [
                                                                                      ListView(
                                                                                        children: List.generate(
                                                                                          orginalLyrices.length,
                                                                                          (
                                                                                            index,
                                                                                          ) => Text(
                                                                                            orginalLyrices[index],
                                                                                            style: GoogleFonts.aBeeZee(
                                                                                              color:
                                                                                                  Colors.white,
                                                                                              fontSize:
                                                                                                  20,
                                                                                            ),
                                                                                            textAlign:
                                                                                                TextAlign.start,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment:
                                                                                            Alignment.bottomRight,
                                                                                        child: InkWell(
                                                                                          onTap: () {
                                                                                            // _copyToClipboard(context, orginalLyrices.toString().replaceAll('[', '').replaceAll(']', ''));
                                                                                          },
                                                                                          child: Column(
                                                                                            mainAxisAlignment:
                                                                                                MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Container(
                                                                                                height:
                                                                                                    40,
                                                                                                width:
                                                                                                    40,
                                                                                                clipBehavior:
                                                                                                    Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Colors.white.withOpacity(
                                                                                                    0.4,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(
                                                                                                    4,
                                                                                                  ),
                                                                                                ),
                                                                                                child: const Center(
                                                                                                  child: Icon(
                                                                                                    Icons.copy,
                                                                                                    color:
                                                                                                        Colors.white,
                                                                                                    size:
                                                                                                        16,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                                loader:
                                                                                    () => const SizedBox(
                                                                                      height:
                                                                                          50,
                                                                                      width:
                                                                                          50,
                                                                                      child: CircularProgressIndicator(
                                                                                        color:
                                                                                            Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                orElse:
                                                                                    () =>
                                                                                        const NullLyricsState(),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                    : NetworKerrorwidget(
                                                      color: Colors.transparent,
                                                      size: widget.size,
                                                    );
                                              },
                                              orElse: () => const SizedBox(),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                /* SizedBox(
                                  height: 120,
                                  width: widget.size.width,
                                  child: BlocBuilder<AudioBloc, AudioState>(
                                    builder: (context, state) {
                                      

                                      return state.maybeWhen(
                                        Localsongs: (
                                          isloading,
                                          isfailed,
                                          audios,
                                          valueStream,
                                          index,
                                          audioPlayer,
                                        ) {
                                          return isloading == true
                                              ? const MusicBottomBarloading()
                                              : StreamBuilder(
                                                stream: valueStream,
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData &&
                                                      snapshot.data != null) {
                                                    double postion =
                                                        snapshot.data!
                                                            .maybeMap(
                                                              orElse: () => 0,
                                                              LocalStreams:
                                                                  (value) =>
                                                                      value
                                                                          .pos
                                                                          .inSeconds,
                                                            )
                                                            .toDouble();

                                                    double duration =
                                                        snapshot.data!
                                                            .maybeMap(
                                                              orElse: () => 0,
                                                              LocalStreams:
                                                                  (value) =>
                                                                      value
                                                                          .Dur
                                                                          .inSeconds,
                                                            )
                                                            .toDouble();

                                                    PlayerState player =
                                                        PlayerState(
                                                          true,
                                                          ProcessingState
                                                              .loading,
                                                        );

                                                    PlayerState playerState =
                                                        snapshot.data!.maybeMap(
                                                          orElse: () => player,
                                                          LocalStreams:
                                                              (value) =>
                                                                  value
                                                                      .playerState,
                                                        );

                                                    int songindex = snapshot
                                                        .data!
                                                        .maybeMap(
                                                          orElse: () => 0,
                                                          LocalStreams:
                                                              (value) =>
                                                                  value.index,
                                                        );

                                                    return GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                          gradient:
                                                              Spaces.musicgradient(),
                                                        ),
                                                        child: Stack(
                                                          fit: StackFit.expand,
                                                          children: [
                                                            QueryArtworkWidget(
                                                              id:
                                                                  audios[songindex]
                                                                      .id,
                                                              artworkQuality:
                                                                  FilterQuality
                                                                      .low,
                                                              type:
                                                                  ArtworkType
                                                                      .AUDIO,
                                                              size: 1000,
                                                              artworkBlendMode:
                                                                  BlendMode
                                                                      .plus,
                                                              artworkClipBehavior:
                                                                  Clip.antiAlias,
                                                              keepOldArtwork:
                                                                  true,
                                                              format:
                                                                  ArtworkFormat
                                                                      .JPEG,
                                                              artworkBorder:
                                                                  BorderRadius
                                                                      .zero,
                                                              nullArtworkWidget: Shimmer(
                                                                gradient:
                                                                    const LinearGradient(
                                                                      colors: [
                                                                        Colors
                                                                            .grey,
                                                                        Colors
                                                                            .white,
                                                                      ],
                                                                    ),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          10,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                    0.6,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        10,
                                                                  ),
                                                              child: Row(
                                                                children: [
                                                                  QueryArtworkWidget(
                                                                    keepOldArtwork:
                                                                        true,
                                                                    id:
                                                                        audios[songindex]
                                                                            .id,
                                                                    type:
                                                                        ArtworkType
                                                                            .AUDIO,
                                                                    artworkHeight:
                                                                        50,
                                                                    artworkWidth:
                                                                        50,
                                                                    artworkBorder:
                                                                        BorderRadius.circular(
                                                                          4,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child: BlocBuilder<
                                                                      YoutubePlayerBackgroundBloc,
                                                                      YoutubePlayerBackgroundState
                                                                    >(
                                                                      builder: (
                                                                        context,
                                                                        youtube,
                                                                      ) {
                                                                        return youtube.maybeWhen(
                                                                          playBgvideo: (
                                                                            controlleryt,
                                                                            d,
                                                                          ) {
                                                                            return Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisAlignment:
                                                                                        MainAxisAlignment.center,
                                                                                    children: [
                                                                                      StreamBuilder(
                                                                                        stream:
                                                                                            d,
                                                                                        builder: (
                                                                                          context,
                                                                                          snapshot,
                                                                                        ) {
                                                                                          if (snapshot.data !=
                                                                                                  null &&
                                                                                              snapshot.hasData) {
                                                                                            Duration dur =
                                                                                                snapshot.data!['d']
                                                                                                    as Duration;
                                                                                            Duration pos =
                                                                                                snapshot.data!['p']
                                                                                                    as Duration;
                                                                                            return Column(
                                                                                              
                                                                                              crossAxisAlignment:
                                                                                                  CrossAxisAlignment.center,
                                                                                              mainAxisAlignment:
                                                                                                  MainAxisAlignment.center,
                                                                                              children: [
                                                                                                SliderTheme(
                                                                                                  data: const SliderThemeData(
                                                                                                    trackShape:
                                                                                                        RectangularSliderTrackShape(),
                                                                                                    trackHeight:
                                                                                                        4,
                                                                                                    thumbShape: RoundSliderThumbShape(
                                                                                                      enabledThumbRadius:
                                                                                                          5,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Slider(
                                                                                                    secondaryActiveColor: Colors.grey.withOpacity(
                                                                                                      0.6,
                                                                                                    ),
                                                                                                    thumbColor: const Color.fromARGB(
                                                                                                      255,
                                                                                                      255,
                                                                                                      255,
                                                                                                      255,
                                                                                                    ),
                                                                                                    activeColor:
                                                                                                        Colors.white,
                                                                                                    inactiveColor:
                                                                                                        Colors.grey,
                                                                                                    value:
                                                                                                        pos.inSeconds.toDouble(),
                                                                                                    max:
                                                                                                        dur.inSeconds.toDouble(),
                                                                                                    min:
                                                                                                        const Duration(
                                                                                                          microseconds:
                                                                                                              0,
                                                                                                        ).inSeconds.toDouble(),
                                                                                                    onChanged: (
                                                                                                      value,
                                                                                                    ) async {
                                                                                                      Duration duration0 = Duration(
                                                                                                        seconds:
                                                                                                            value.toInt(),
                                                                                                      );
                                                                                                      controlleryt.player.seek(
                                                                                                        duration0,
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    right:
                                                                                                        22,
                                                                                                    left:
                                                                                                        23,
                                                                                                    top:
                                                                                                        0,
                                                                                                    bottom:
                                                                                                        0,
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment:
                                                                                                        MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        pos
                                                                                                            .toString()
                                                                                                            .split(
                                                                                                              ".",
                                                                                                            )[0]
                                                                                                            .replaceRange(
                                                                                                              0,
                                                                                                              2,
                                                                                                              "",
                                                                                                            ),
                                                                                                        style: const TextStyle(
                                                                                                          color: Color.fromARGB(
                                                                                                            255,
                                                                                                            255,
                                                                                                            255,
                                                                                                            255,
                                                                                                          ),
                                                                                                          fontSize:
                                                                                                              15,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        dur
                                                                                                            .toString()
                                                                                                            .split(
                                                                                                              ".",
                                                                                                            )[0]
                                                                                                            .replaceRange(
                                                                                                              0,
                                                                                                              2,
                                                                                                              "",
                                                                                                            ),
                                                                                                        style: const TextStyle(
                                                                                                          color: Color.fromARGB(
                                                                                                            255,
                                                                                                            255,
                                                                                                            255,
                                                                                                            255,
                                                                                                          ),
                                                                                                          fontSize:
                                                                                                              15,
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
                                                                                height:
                                                                                    73,
                                                                                width:
                                                                                    MediaQuery.sizeOf(
                                                                                      context,
                                                                                    ).width,
                                                                                child: Column(
                                                                                  children: [
                                                                                    CustomSlider(
                                                                                      activecolor:
                                                                                          Colors.white,
                                                                                      inactiveColor:
                                                                                          Colors.grey,
                                                                                      audioPlayer:
                                                                                          audioPlayer,
                                                                                      postion:
                                                                                          postion,
                                                                                      duration:
                                                                                          duration,
                                                                                      trackHeight:
                                                                                          3,
                                                                                      thumshape: const RoundSliderThumbShape(
                                                                                        disabledThumbRadius:
                                                                                            4,
                                                                                        enabledThumbRadius:
                                                                                            4,
                                                                                        elevation:
                                                                                            4,
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width:
                                                                                          widget.size.width,
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.symmetric(
                                                                                          horizontal:
                                                                                              26,
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisAlignment:
                                                                                              MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Textutil(
                                                                                              text:
                                                                                                  snapshot.data!
                                                                                                      .mapOrNull(
                                                                                                        LocalStreams:
                                                                                                            (
                                                                                                              value,
                                                                                                            ) =>
                                                                                                                value.pos.toString(),
                                                                                                      )!
                                                                                                      .toString()
                                                                                                      .split(
                                                                                                        '.',
                                                                                                      )[0],
                                                                                              fontsize:
                                                                                                  14,
                                                                                              color:
                                                                                                  Colors.white,
                                                                                              fontWeight:
                                                                                                  FontWeight.w400,
                                                                                            ),
                                                                                            Textutil(
                                                                                              text:
                                                                                                  snapshot.data!
                                                                                                      .mapOrNull(
                                                                                                        LocalStreams:
                                                                                                            (
                                                                                                              value,
                                                                                                            ) =>
                                                                                                                value.Dur.toString(),
                                                                                                      )!
                                                                                                      .toString()
                                                                                                      .split(
                                                                                                        '.',
                                                                                                      )[0],
                                                                                              fontsize:
                                                                                                  14,
                                                                                              color:
                                                                                                  Colors.white,
                                                                                              fontWeight:
                                                                                                  FontWeight.w400,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  BlocBuilder<
                                                                    YoutubePlayerBackgroundBloc,
                                                                    YoutubePlayerBackgroundState
                                                                  >(
                                                                    builder: (
                                                                      context,
                                                                      youtube,
                                                                    ) {
                                                                      return youtube.maybeWhen(
                                                                        playBgvideo: (
                                                                          controlleryt,
                                                                          d,
                                                                        ) {
                                                                          audioPlayer
                                                                              .pause();
                                                                          return Stack(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            children: [
                                                                              Card(
                                                                                elevation:
                                                                                    11,
                                                                                color:
                                                                                    Colors.white,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                    60,
                                                                                  ),
                                                                                ),
                                                                                child: Container(
                                                                                  height:
                                                                                      65,
                                                                                  width:
                                                                                      65,
                                                                                  decoration: BoxDecoration(
                                                                                    color: const Color.fromARGB(
                                                                                      255,
                                                                                      239,
                                                                                      239,
                                                                                      239,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(
                                                                                      60,
                                                                                    ),
                                                                                  ),
                                                                                  child: PlayIcons(
                                                                                    playicons:
                                                                                        controlleryt.player.state.playing
                                                                                            ? CupertinoIcons.pause
                                                                                            : CupertinoIcons.play_arrow,
                                                                                    iconscolors:
                                                                                        Colors.black,
                                                                                    iconsize:
                                                                                        25,
                                                                                    ontap: () async {
                                                                                      if (controlleryt.player.state.playing) {
                                                                                        await controlleryt.player.pause();
                                                                                      } else {
                                                                                        await controlleryt.player.play();
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
                                                                        orElse:
                                                                            () => Container(
                                                                              height:
                                                                                  50,
                                                                              width:
                                                                                  50,
                                                                              decoration: BoxDecoration(
                                                                                color: const Color.fromARGB(
                                                                                  255,
                                                                                  239,
                                                                                  239,
                                                                                  239,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(
                                                                                  60,
                                                                                ),
                                                                              ),
                                                                              child: PlayIcons(
                                                                                playicons:
                                                                                    playerState.playing
                                                                                        ? CupertinoIcons.pause
                                                                                        : Icons.play_arrow_rounded,
                                                                                iconscolors:
                                                                                    Colors.black,
                                                                                iconsize:
                                                                                    25,
                                                                                ontap: () {
                                                                                  if (audioPlayer.playing ==
                                                                                      true) {
                                                                                    BlocProvider.of<
                                                                                      AudioBloc
                                                                                    >(
                                                                                      context,
                                                                                    ).add(
                                                                                      const AudioEvent.pause(),
                                                                                    );
                                                                                  } else {
                                                                                    BlocProvider.of<
                                                                                      AudioBloc
                                                                                    >(
                                                                                      context,
                                                                                    ).add(
                                                                                      const AudioEvent.resume(),
                                                                                    );
                                                                                  }
                                                                                },
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
                                                    );
                                                  } else {
                                                    return const SizedBox();
                                                  }
                                                },
                                              );
                                        },
                                        orElse: () => const SizedBox(),
                                      );
                                    },
                                  ),
                                ),*/
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      );
                    },
                    orElse: () {
                      return const SizedBox();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
