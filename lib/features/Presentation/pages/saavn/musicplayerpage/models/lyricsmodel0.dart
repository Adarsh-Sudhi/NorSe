import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../../../configs/constants/Spaces.dart';
import '../../../../Blocs/Musicbloc/Lyrics_bloc/lyrics_bloc.dart';
import '../../../../Blocs/Musicbloc/audio_bloc/audio_bloc.dart';

int lyricsindex = 1000;

class LyricsModel0 extends StatefulWidget {
  const LyricsModel0({super.key});

  @override
  State<LyricsModel0> createState() => _LyricsModel0State();
}

class _LyricsModel0State extends State<LyricsModel0> {
  void changeduration(int sceconds, AudioPlayer player) {
    Duration duration = Duration(seconds: sceconds);
    player.seek(duration);
  }

  void _copyToClipboard(BuildContext context, String textToCopy) {
    Clipboard.setData(ClipboardData(text: textToCopy));
    Spaces.showtoast('Copied to Clipboard');
  }

  // late WebViewController controller;

  int progresss = 0;

  @override
  void didUpdateWidget(covariant LyricsModel0 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    log("called");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<AudioBloc, AudioState>(
              builder: (context, state) {
                return state.maybeWhen(
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
                        if (snapshot.hasData && snapshot.data != null) {
                          int songindex = snapshot.data!.maybeWhen(
                            onlinestreams:
                                (pos, dur, playerState, index) => index,
                            orElse: () => 0,
                          );

                          if (lyricsindex != songindex) {
                            BlocProvider.of<LyricsBloc>(context).add(
                              LyricsEvent.getlyrics(
                                audios[audioPlayer.currentIndex!].id,
                                "${audios[audioPlayer.currentIndex!].title} | ${audios[audioPlayer.currentIndex!].artist.replaceAll("(", "").replaceAll(")", "")}  ",
                              ),
                            );
                            lyricsindex = songindex;
                          }

                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        spacing: 10,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Textutil(
                                                text: "Lyrics",
                                                fontsize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Row(
                                                children: [
                                                  Textutil(
                                                    text:
                                                        audios[songindex]
                                                            .artist,
                                                    fontsize: 13,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  Textutil(
                                                    text:
                                                        " • ${audios[songindex].title}",
                                                    fontsize: 13,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spaces.kheight20,
                                      Expanded(
                                        child: SizedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 2,
                                              right: 2,
                                              bottom: 10,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  BlocBuilder<
                                                    LyricsBloc,
                                                    LyricsState
                                                  >(
                                                    builder: (context, state) {
                                                      return state.maybeWhen(
                                                        lyrics: (lyrics) {
                                                          List<String>
                                                          orginalLyrices =
                                                              lyrics['lyrics']
                                                                  .toString()
                                                                  .split(
                                                                    '<br>',
                                                                  );
                                                          return Stack(
                                                            fit:
                                                                StackFit.expand,
                                                            children: [
                                                              ListView(
                                                                children: List.generate(
                                                                  orginalLyrices
                                                                      .length,
                                                                  (
                                                                    index,
                                                                  ) => Text(
                                                                    orginalLyrices[index],
                                                                    style: GoogleFonts.aBeeZee(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontSize:
                                                                          20,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .bottomRight,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    _copyToClipboard(
                                                                      context,
                                                                      orginalLyrices
                                                                          .toString()
                                                                          .replaceAll(
                                                                            '[',
                                                                            '',
                                                                          )
                                                                          .replaceAll(
                                                                            ']',
                                                                            '',
                                                                          ),
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
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
                                                                          borderRadius:
                                                                              BorderRadius.circular(
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
                                                              height: 50,
                                                              width: 50,
                                                              child: CircularProgressIndicator(
                                                                color:
                                                                    Colors
                                                                        .white,
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
                                /* SizedBox(
                                  height: 120,
                                  child: BlocBuilder<AudioBloc, AudioState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        onlinesongs: (
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
                                                    Duration position = snapshot
                                                        .data!
                                                        .maybeMap(
                                                          orElse:
                                                              () =>
                                                                  const Duration(
                                                                    seconds: 0,
                                                                  ),
                                                          onlinestreams:
                                                              (value) =>
                                                                  value.pos,
                                                        );
                            
                                                    Duration duration = snapshot
                                                        .data!
                                                        .maybeMap(
                                                          orElse:
                                                              () =>
                                                                  const Duration(
                                                                    seconds: 0,
                                                                  ),
                                                          onlinestreams:
                                                              (value) =>
                                                                  value.dur,
                                                        );
                            
                                                    int songindex = snapshot
                                                        .data!
                                                        .maybeMap(
                                                          orElse: () => 0,
                                                          onlinestreams:
                                                              (val) =>
                                                                  val.index,
                                                        );
                            
                                                    PlayerState dupplayerstate =
                                                        PlayerState(
                                                          false,
                                                          ProcessingState
                                                              .loading,
                                                        );
                            
                                                    PlayerState playerState =
                                                        snapshot.data!.maybeMap(
                                                          orElse:
                                                              () =>
                                                                  dupplayerstate,
                                                          onlinestreams:
                                                              (value) =>
                                                                  value
                                                                      .playerState,
                                                        );
                            
                                                    return GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        height: 73,
                                                        decoration: BoxDecoration(
                                                          gradient:
                                                              Spaces.musicgradient(),
                                                        ),
                                                        child: Stack(
                                                          fit: StackFit.expand,
                                                          children: [
                                                            Container(
                                                              height: 50,
                                                              width: 50,
                                                              clipBehavior:
                                                                  Clip.antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          5,
                                                                        ),
                                                                  ),
                                                              child: Image.network(
                                                                errorBuilder: (
                                                                  context,
                                                                  error,
                                                                  stackTrace,
                                                                ) {
                                                                  return Image.asset(
                                                                    'assets/musical-note.png',
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                          0.6,
                                                                        ),
                                                                  );
                                                                },
                                                                audios[songindex]
                                                                    .imageurl,
                                                                fit:
                                                                    BoxFit
                                                                        .cover,
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
                                                                  Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            5,
                                                                          ),
                                                                    ),
                                                                    child: Image.network(
                                                                      errorBuilder: (
                                                                        context,
                                                                        error,
                                                                        stackTrace,
                                                                      ) {
                                                                        return Image.asset(
                                                                          'assets/musical-note.png',
                                                                          color: Colors.black.withOpacity(
                                                                            0.6,
                                                                          ),
                                                                        );
                                                                      },
                                                                      audios[songindex]
                                                                          .imageurl,
                                                                      fit:
                                                                          BoxFit
                                                                              .cover,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: SizedBox(
                                                                      height:
                                                                          73,
                                                                      width:
                                                                          MediaQuery.sizeOf(
                                                                            context,
                                                                          ).width,
                                                                      child: Column(
                                                                        children: [
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
                                                                                  return Row(
                                                                                    mainAxisAlignment:
                                                                                        MainAxisAlignment.center,
                                                                                    crossAxisAlignment:
                                                                                        CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          crossAxisAlignment:
                                                                                              CrossAxisAlignment.center,
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
                                                                                                  return Padding(
                                                                                                    padding: const EdgeInsets.only(
                                                                                                      top:
                                                                                                          40,
                                                                                                    ),
                                                                                                    child: Column(
                                                                                                      children: [
                                                                                                        SliderTheme(
                                                                                                          data: const SliderThemeData(
                                                                                                            trackShape:
                                                                                                                RectangularSliderTrackShape(),
                                                                                                            trackHeight:
                                                                                                                5,
                                                                                                            thumbShape:
                                                                                                                RoundSliderThumbShape(),
                                                                                                          ),
                                                                                                          child: Slider(
                                                                                                            thumbColor: const Color.fromARGB(
                                                                                                              255,
                                                                                                              255,
                                                                                                              255,
                                                                                                              255,
                                                                                                            ),
                                                                                                            activeColor: const Color.fromARGB(
                                                                                                              255,
                                                                                                              255,
                                                                                                              255,
                                                                                                              255,
                                                                                                            ),
                                                                                                            inactiveColor: const Color.fromARGB(
                                                                                                              255,
                                                                                                              125,
                                                                                                              125,
                                                                                                              125,
                                                                                                            ).withOpacity(
                                                                                                              0.6,
                                                                                                            ),
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
                                                                                                    ),
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
                                                                                    () => Row(
                                                                                      mainAxisAlignment:
                                                                                          MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                height:
                                                                                                    30,
                                                                                                child: CustomSlider(
                                                                                                  inactiveColor:
                                                                                                      Colors.grey,
                                                                                                  activecolor:
                                                                                                      Colors.white,
                                                                                                  durationyt: snapshot.data!.maybeMap(
                                                                                                    orElse:
                                                                                                        () => const Duration(
                                                                                                          seconds:
                                                                                                              0,
                                                                                                        ),
                                                                                                    onlinestreams:
                                                                                                        (
                                                                                                          value,
                                                                                                        ) =>
                                                                                                            value.dur,
                                                                                                  ),
                                                                                                  audioPlayer:
                                                                                                      audioPlayer,
                                                                                                  postion:
                                                                                                      position.inSeconds.toDouble(),
                                                                                                  duration:
                                                                                                      duration.inSeconds.toDouble(),
                                                                                                  trackHeight:
                                                                                                      5,
                                                                                                  thumshape: const RoundSliderThumbShape(
                                                                                                    enabledThumbRadius:
                                                                                                        8,
                                                                                                    disabledThumbRadius:
                                                                                                        8,
                                                                                                    elevation:
                                                                                                        7,
                                                                                                  ),
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
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisAlignment:
                                                                                                      MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      snapshot.data!
                                                                                                          .mapOrNull(
                                                                                                            onlinestreams:
                                                                                                                (
                                                                                                                  value,
                                                                                                                ) =>
                                                                                                                    value.pos.toString(),
                                                                                                          )!
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
                                                                                                      snapshot.data!
                                                                                                          .mapOrNull(
                                                                                                            onlinestreams:
                                                                                                                (
                                                                                                                  value,
                                                                                                                ) =>
                                                                                                                    value.dur.toString(),
                                                                                                          )!
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
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                 /* BlocBuilder<
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
                                                                            () => Stack(
                                                                              alignment:
                                                                                  Alignment.center,
                                                                              children: [
                                                                                playerState.processingState ==
                                                                                            ProcessingState.loading ||
                                                                                        playerState.processingState ==
                                                                                            ProcessingState.buffering
                                                                                    ? const SizedBox(
                                                                                      height:
                                                                                          75,
                                                                                      width:
                                                                                          75,
                                                                                      child: CircularProgressIndicator(
                                                                                        color:
                                                                                            Colors.white,
                                                                                      ),
                                                                                    )
                                                                                    : const SizedBox(),
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
                                                                                          audioPlayer.playing ==
                                                                                                  true
                                                                                              ? CupertinoIcons.pause
                                                                                              : CupertinoIcons.play_arrow,
                                                                                      iconscolors:
                                                                                          Colors.black,
                                                                                      iconsize:
                                                                                          25,
                                                                                      ontap: () async {
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
                                                                                ),
                                                                              ],
                                                                            ),
                                                                      );
                                                                    },
                                                                  ), */
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
                            ),
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
    );
  }
}

class NullLyricsState extends StatelessWidget {
  const NullLyricsState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ':)',
              style: Spaces.Getstyle(60, Colors.white, FontWeight.normal),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Textutil(
                  text: 'Lyrics ',
                  fontsize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                Textutil(
                  text: 'Not available ',
                  fontsize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
