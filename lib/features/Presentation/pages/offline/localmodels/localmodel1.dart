import 'dart:developer';
import 'dart:ui';
import 'package:flip/flip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_kit/media_kit.dart' as mediaplayer;
import 'package:media_kit_video/media_kit_video.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/Lyrics_bloc/lyrics_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/audiospeed.dart';
import 'package:norse/features/Presentation/pages/offline/localmodels/localplainlyrics.dart';
import 'package:norse/features/Presentation/pages/offline/localmodels/offlinelyricssynced.dart';
import 'package:norse/features/Presentation/pages/offline/queue.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/lyricsmodel0.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/staticbar.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:waveform_extractor/waveform_extractor.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as vidlib;
import 'package:norse/features/Data/Models/MusicModels/songmodel.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/favorite_bloc/favoriteplaylist_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/favsong_bloc/favsongs_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/CustomSliderWidget.dart';
import 'package:norse/features/Presentation/CustomWidgets/nullmusicWidget.dart';
import 'package:norse/features/Presentation/pages/offline/localmodels/waveformslider.dart';
import 'package:norse/features/Presentation/pages/offline/qualizer/equalizer.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/testonlineplayerscreen.dart';
import '../../../../../../configs/constants/Spaces.dart';
import '../../../../../../configs/notifier/notifiers.dart';

String _selectedResolution = "1080p";
List<int>? waveformOnlyint;

class LocalModel1 extends StatefulWidget {
  final String initialpath;
  final int index;
  const LocalModel1({
    super.key,
    required this.initialpath,
    required this.index,
  });

  @override
  State<LocalModel1> createState() => _LocalModel1State();
}

class _LocalModel1State extends State<LocalModel1>
    with TickerProviderStateMixin {
  late Animation<double> fadeanimation;
  late AnimationController fadeanimationcontroller;
  late PageController pageController;
  final waveformExtractor = WaveformExtractor();
  final FlipController flipController = FlipController();
  bool _showLyricsAbove = false;

  _checkisinitialized() {
    try {
      Wavecontroller;
      return true;
    } catch (e) {
      return false;
    }
  }

  String removeDurationTags(String lyrics) {
    final regex = RegExp(r'\[\d{2}:\d{2}\.\d{2}\]');
    return lyrics.replaceAll(regex, '').trim();
  }

  _getWaveFormData(String audiopath) async {
    _checkisinitialized() ? Wavecontroller.reverse() : null;
    final audioSourceFile = audiopath;
    List<int> waveformdata = await waveformExtractor.extractWaveformDataOnly(
      useCache: false,
      audioSourceFile,
    );
    //  setState(() {
    waveformOnlyint = waveformdata;
    //});
  }

  String _gettite(String name, int index) {
    return name.contains("storage") ? name.split(".")[index] : name;
  }

  late final player = mediaplayer.Player();
  late final controller = VideoController(player);
  vidlib.YoutubeExplode yt = vidlib.YoutubeExplode();

  late List<Songmodel> lateaudios;
  int? lateindex;
  int newindex = 1000;
  late bool isplaying;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: 1,
      initialPage: widget.index,
    );
    _getWaveFormData("${widget.initialpath}.m4a");

    Notifiers.tabindexNotifer.value = 0;

    fadeanimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    fadeanimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: fadeanimationcontroller,
        curve: Curves.easeInToLinear,
      ),
    );

    fadeanimationcontroller.forward();
  }

  @override
  void dispose() async {
    fadeanimationcontroller.dispose();
    super.dispose();
    lateaudios.clear();
    waveformOnlyint?.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          BlocBuilder<AudioBloc, AudioState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox(),
                Localsongs: (
                  isloading,
                  isfailed,
                  audios,
                  valueStream,
                  index,
                  audioPlayer,
                ) {
                  audios.isNotEmpty
                      ? BlocProvider.of<FavoriteplaylistBloc>(
                        context,
                      ).add(const FavoriteplaylistEvent.getallsongs())
                      : null;

                  isplaying = audioPlayer.playerState.playing;

                  return StreamBuilder(
                    stream: valueStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        final songindex = snapshot.data!.maybeMap(
                          orElse: () => 0,
                          LocalStreams: (value) => value.index,
                        );

                        lateindex = songindex;

                        audios.isNotEmpty
                            ? BlocProvider.of<FavsongsBloc>(
                              context,
                              listen: true,
                            ).add(
                              FavsongsEvent.checkforfav(
                                audios[songindex].id.toString(),
                              ),
                            )
                            : null;

                        lateaudios = List.from(audios);

                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            BlocBuilder<
                              YoutubePlayerBackgroundBloc,
                              YoutubePlayerBackgroundState
                            >(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  playBgvideo:
                                      (
                                        controller,
                                        streams,
                                      ) => ValueListenableBuilder(
                                        valueListenable: Notifiers.viewtype,
                                        builder:
                                            (context, value, child) =>
                                                !value
                                                    ? Stack(
                                                      children: [
                                                        QueryArtworkWidget(
                                                          artworkHeight:
                                                              size.height,
                                                          artworkWidth:
                                                              size.width,
                                                          keepOldArtwork: true,
                                                          id:
                                                              audios[songindex]
                                                                  .id,
                                                          type:
                                                              ArtworkType.AUDIO,
                                                          size: 400,
                                                        ),
                                                        Container(
                                                          height: size.height,
                                                          width: size.width,
                                                          decoration: BoxDecoration(
                                                            gradient: LinearGradient(
                                                              begin:
                                                                  Alignment
                                                                      .bottomCenter,
                                                              end:
                                                                  Alignment
                                                                      .center,
                                                              colors: [
                                                                Colors.black,
                                                                Colors.black
                                                                    .withValues(
                                                                      alpha:
                                                                          0.9,
                                                                    ),
                                                                Colors.black
                                                                    .withValues(
                                                                      alpha:
                                                                          0.5,
                                                                    ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                    : SizedBox(),
                                      ),
                                  orElse:
                                      () => Stack(
                                        children: [
                                          QueryArtworkWidget(
                                            artworkHeight: size.height,
                                            artworkWidth: size.width,
                                            keepOldArtwork: true,
                                            id: audios[songindex].id,
                                            type: ArtworkType.AUDIO,
                                            size: 400,
                                          ),
                                          Container(
                                            height: size.height,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.center,
                                                colors: [
                                                  Colors.black,
                                                  Colors.black.withValues(
                                                    alpha: 0.9,
                                                  ),
                                                  Colors.black.withValues(
                                                    alpha: 0.5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                );
                              },
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
          BlocBuilder<
            YoutubePlayerBackgroundBloc,
            YoutubePlayerBackgroundState
          >(
            builder: (context, state) {
              return state.maybeWhen(
                playBgvideo:
                    (controller, streams) => ValueListenableBuilder(
                      valueListenable: Notifiers.viewtype,
                      builder:
                          (context, value, child) =>
                              !value
                                  ? SizedBox()
                                  : SizedBox(
                                    child: Stack(
                                      children: [
                                        Video(
                                          pauseUponEnteringBackgroundMode:
                                              false,
                                          fit: BoxFit.cover,
                                          controller: controller,
                                        ),
                                        Container(
                                          height: size.height,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center,
                                              colors: [
                                                Colors.black,
                                                Colors.black.withValues(
                                                  alpha: 0.83,
                                                ),
                                                Colors.black.withValues(
                                                  alpha: 0.1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                    ),
                orElse: () => SizedBox(),
              );
            },
          ),

          ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: size.height / 1.09,
                width: size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 75),
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
                              lateaudios = List.from(audios);

                              return SizedBox(
                                height: size.height,
                                child: Column(
                                  children: [
                                    Spaces.kheight20,
                                    Expanded(
                                      child: StreamBuilder(
                                        stream: valueStream,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData &&
                                              snapshot.data != null) {
                                            final songindex = snapshot.data!
                                                .maybeMap(
                                                  orElse: () => 0,
                                                  LocalStreams:
                                                      (value) => value.index,
                                                );
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

                                            if (newindex != songindex) {
                                              _getWaveFormData(
                                                "${audios[songindex].title.split(".")[1]}.m4a",
                                              );
                                              newindex = songindex;
                                            }

                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BlocBuilder<
                                                  YoutubePlayerBackgroundBloc,
                                                  YoutubePlayerBackgroundState
                                                >(
                                                  builder: (context, state) {
                                                    return state.maybeWhen(
                                                      playBgvideo: (
                                                        controllerr,
                                                        d,
                                                      ) {
                                                        audioPlayer.pause();
                                                        return SizedBox(
                                                          width: size.width,
                                                          height:
                                                              size.height / 2.6,
                                                          child: Stack(
                                                            children: [
                                                              ValueListenableBuilder(
                                                                valueListenable:
                                                                    Notifiers
                                                                        .viewtype,
                                                                builder:
                                                                    (
                                                                      context,
                                                                      value,
                                                                      child,
                                                                    ) =>
                                                                        value
                                                                            ? SizedBox()
                                                                            : SizedBox(
                                                                              child: Video(
                                                                                pauseUponEnteringBackgroundMode:
                                                                                    false,
                                                                                fit:
                                                                                    BoxFit.cover,
                                                                                controller:
                                                                                    controllerr,
                                                                              ),
                                                                            ),
                                                              ),
                                                              _showLyricsAbove
                                                                  ? BlocBuilder<
                                                                    AudioBloc,
                                                                    AudioState
                                                                  >(
                                                                    builder: (
                                                                      context,
                                                                      state1,
                                                                    ) {
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
                                                                            stream:
                                                                                valueStream,
                                                                            builder: (
                                                                              context,
                                                                              snapshot,
                                                                            ) {
                                                                              if (snapshot.hasData &&
                                                                                  snapshot.data !=
                                                                                      null) {
                                                                                return BlocBuilder<
                                                                                  LyricsBloc,
                                                                                  LyricsState
                                                                                >(
                                                                                  builder: (
                                                                                    context,
                                                                                    state,
                                                                                  ) {
                                                                                    return state.maybeWhen(
                                                                                      loader: () {
                                                                                        return Center(
                                                                                          child: const SizedBox(
                                                                                            child: CircularProgressIndicator(
                                                                                              color:
                                                                                                  Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                      lyrics: (
                                                                                        lyrics,
                                                                                      ) {
                                                                                        List<
                                                                                          String
                                                                                        >
                                                                                        orginalLyrices = lyrics['lyrics'].toString().split(
                                                                                          '<br>',
                                                                                        );
                                                                                        return lyrics['lyrics'] ==
                                                                                                "failure"
                                                                                            ? NullLyricsState()
                                                                                            : Column(
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisAlignment:
                                                                                                      MainAxisAlignment.start,
                                                                                                  spacing:
                                                                                                      10,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsets.only(
                                                                                                        left:
                                                                                                            10,
                                                                                                      ),
                                                                                                      child: GestureDetector(
                                                                                                        onTap: () {
                                                                                                          Navigator.push(
                                                                                                            context,
                                                                                                            MaterialPageRoute(
                                                                                                              builder:
                                                                                                                  (
                                                                                                                    _,
                                                                                                                  ) => PlainLocalLyrics(
                                                                                                                    syncedLyrics:
                                                                                                                        lyrics['lyrics'],
                                                                                                                    audioPlayer:
                                                                                                                        audioPlayer,
                                                                                                                    audios:
                                                                                                                        audios,
                                                                                                                    size:
                                                                                                                        size,
                                                                                                                    stream:
                                                                                                                        valueStream,
                                                                                                                    waveformOnlyint:
                                                                                                                        waveformOnlyint!,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                        child: SizedBox(
                                                                                                          height:
                                                                                                              35,
                                                                                                          width:
                                                                                                              80,
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(
                                                                                                              5,
                                                                                                            ),
                                                                                                            child: BackdropFilter(
                                                                                                              filter: ImageFilter.blur(
                                                                                                                sigmaX:
                                                                                                                    10,
                                                                                                                sigmaY:
                                                                                                                    10,
                                                                                                              ),
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Colors.white.withValues(
                                                                                                                    alpha:
                                                                                                                        0.1,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(
                                                                                                                    5,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                alignment:
                                                                                                                    Alignment.center,
                                                                                                                padding: const EdgeInsets.symmetric(
                                                                                                                  horizontal:
                                                                                                                      10,
                                                                                                                ),
                                                                                                                child: Column(
                                                                                                                  mainAxisAlignment:
                                                                                                                      MainAxisAlignment.center,
                                                                                                                  crossAxisAlignment:
                                                                                                                      CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Textutil(
                                                                                                                      text:
                                                                                                                          "Plain",
                                                                                                                      fontsize:
                                                                                                                          13,
                                                                                                                      color:
                                                                                                                          Colors.white,
                                                                                                                      fontWeight:
                                                                                                                          FontWeight.bold,
                                                                                                                    ),
                                                                                                                    Textutil(
                                                                                                                      text:
                                                                                                                          "By LRCLIB",
                                                                                                                      fontsize:
                                                                                                                          9,
                                                                                                                      color:
                                                                                                                          Colors.white,
                                                                                                                      fontWeight:
                                                                                                                          FontWeight.bold,
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Spaces.kheight20,
                                                                                                Expanded(
                                                                                                  child: Stack(
                                                                                                    fit:
                                                                                                        StackFit.expand,
                                                                                                    children: [
                                                                                                      ListView(
                                                                                                        children: List.generate(
                                                                                                          orginalLyrices.length,
                                                                                                          (
                                                                                                            index,
                                                                                                          ) => Text(
                                                                                                            removeDurationTags(
                                                                                                              orginalLyrices[index],
                                                                                                            ),
                                                                                                            style: GoogleFonts.aBeeZee(
                                                                                                              color:
                                                                                                                  Colors.white,
                                                                                                              fontSize:
                                                                                                                  20,
                                                                                                            ),
                                                                                                            textAlign:
                                                                                                                TextAlign.center,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment:
                                                                                                            Alignment.bottomRight,
                                                                                                        child: InkWell(
                                                                                                          onTap: () {
                                                                                                            Clipboard.setData(
                                                                                                              ClipboardData(
                                                                                                                text: removeDurationTags(
                                                                                                                  lyrics['lyrics'],
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                            Spaces.showtoast(
                                                                                                              "Copied to ClipBoard",
                                                                                                            );
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
                                                                                                                  color: Colors.white.withValues(
                                                                                                                    alpha:
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
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                      },
                                                                                      orElse:
                                                                                          () =>
                                                                                              SizedBox(),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              } else {
                                                                                return SizedBox();
                                                                              }
                                                                            },
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  )
                                                                  : SizedBox(),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      orElse:
                                                          () => FadeTransition(
                                                            opacity:
                                                                fadeanimation,
                                                            child: Stack(
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      size.width,
                                                                  height:
                                                                      size.height /
                                                                      2.60,

                                                                  child: PageView.builder(
                                                                    controller:
                                                                        pageController,
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    itemCount:
                                                                        audios
                                                                            .length,
                                                                    itemBuilder: (
                                                                      context,
                                                                      index,
                                                                    ) {
                                                                      if (songindex !=
                                                                          index) {
                                                                        pageController.animateToPage(
                                                                          songindex,
                                                                          duration: Duration(
                                                                            milliseconds:
                                                                                300,
                                                                          ),
                                                                          curve:
                                                                              Curves.linear,
                                                                        );
                                                                      }

                                                                      return Padding(
                                                                        padding: const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              26,
                                                                        ),
                                                                        child: SizedBox(
                                                                          height:
                                                                              size.height /
                                                                              2,
                                                                          width:
                                                                              size.width,
                                                                          child: Flip(
                                                                            controller:
                                                                                flipController,
                                                                            firstChild: LocalQueryArtWidget(
                                                                              fit:
                                                                                  BoxFit.fitWidth,
                                                                              size:
                                                                                  size,
                                                                              audios:
                                                                                  lateaudios,
                                                                              songindex:
                                                                                  index,
                                                                            ),
                                                                            secondChild: BlocBuilder<
                                                                              AudioBloc,
                                                                              AudioState
                                                                            >(
                                                                              builder: (
                                                                                context,
                                                                                state1,
                                                                              ) {
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
                                                                                      stream:
                                                                                          valueStream,
                                                                                      builder: (
                                                                                        context,
                                                                                        snapshot,
                                                                                      ) {
                                                                                        if (snapshot.hasData &&
                                                                                            snapshot.data !=
                                                                                                null) {
                                                                                          return BlocBuilder<
                                                                                            LyricsBloc,
                                                                                            LyricsState
                                                                                          >(
                                                                                            builder: (
                                                                                              context,
                                                                                              state,
                                                                                            ) {
                                                                                              return state.maybeWhen(
                                                                                                loader: () {
                                                                                                  return Center(
                                                                                                    child: const SizedBox(
                                                                                                      child: CircularProgressIndicator(
                                                                                                        color:
                                                                                                            Colors.white,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                                lyrics: (
                                                                                                  lyrics,
                                                                                                ) {
                                                                                                  List<
                                                                                                    String
                                                                                                  >
                                                                                                  orginalLyrices = lyrics['lyrics'].toString().split(
                                                                                                    '<br>',
                                                                                                  );
                                                                                                  return lyrics['lyrics'] ==
                                                                                                          "failure"
                                                                                                      ? NullLyricsState()
                                                                                                      : Column(
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisAlignment:
                                                                                                                MainAxisAlignment.start,
                                                                                                            spacing:
                                                                                                                10,
                                                                                                            children: [
                                                                                                              GestureDetector(
                                                                                                                onTap: () {
                                                                                                                  Navigator.push(
                                                                                                                    context,
                                                                                                                    MaterialPageRoute(
                                                                                                                      builder:
                                                                                                                          (
                                                                                                                            _,
                                                                                                                          ) => SpotifyStyleOfflineFullScreenLyrics(
                                                                                                                            waveformOnlyint:
                                                                                                                                waveformOnlyint !=
                                                                                                                                        null
                                                                                                                                    ? waveformOnlyint!
                                                                                                                                    : [],
                                                                                                                            audios:
                                                                                                                                audios,
                                                                                                                            stream:
                                                                                                                                valueStream,
                                                                                                                            size:
                                                                                                                                size,
                                                                                                                            syncedLyrics:
                                                                                                                                lyrics['lyrics'],
                                                                                                                            audioPlayer:
                                                                                                                                audioPlayer,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                                child: SizedBox(
                                                                                                                  height:
                                                                                                                      35,
                                                                                                                  width:
                                                                                                                      80,
                                                                                                                  child: ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(
                                                                                                                      5,
                                                                                                                    ),
                                                                                                                    child: BackdropFilter(
                                                                                                                      filter: ImageFilter.blur(
                                                                                                                        sigmaX:
                                                                                                                            10,
                                                                                                                        sigmaY:
                                                                                                                            10,
                                                                                                                      ),
                                                                                                                      child: Container(
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Colors.white.withValues(
                                                                                                                            alpha:
                                                                                                                                0.1,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(
                                                                                                                            5,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        alignment:
                                                                                                                            Alignment.center,
                                                                                                                        padding: const EdgeInsets.symmetric(
                                                                                                                          horizontal:
                                                                                                                              10,
                                                                                                                        ),
                                                                                                                        child: Column(
                                                                                                                          mainAxisAlignment:
                                                                                                                              MainAxisAlignment.center,
                                                                                                                          crossAxisAlignment:
                                                                                                                              CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Textutil(
                                                                                                                              text:
                                                                                                                                  "Synced",
                                                                                                                              fontsize:
                                                                                                                                  13,
                                                                                                                              color:
                                                                                                                                  Colors.white,
                                                                                                                              fontWeight:
                                                                                                                                  FontWeight.bold,
                                                                                                                            ),
                                                                                                                            Textutil(
                                                                                                                              text:
                                                                                                                                  "By LRCLIB",
                                                                                                                              fontsize:
                                                                                                                                  9,
                                                                                                                              color:
                                                                                                                                  Colors.white,
                                                                                                                              fontWeight:
                                                                                                                                  FontWeight.bold,
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              GestureDetector(
                                                                                                                onTap: () {
                                                                                                                  Navigator.push(
                                                                                                                    context,
                                                                                                                    MaterialPageRoute(
                                                                                                                      builder:
                                                                                                                          (
                                                                                                                            _,
                                                                                                                          ) => PlainLocalLyrics(
                                                                                                                            syncedLyrics:
                                                                                                                                lyrics['lyrics'],
                                                                                                                            audioPlayer:
                                                                                                                                audioPlayer,
                                                                                                                            audios:
                                                                                                                                audios,
                                                                                                                            size:
                                                                                                                                size,
                                                                                                                            stream:
                                                                                                                                valueStream,
                                                                                                                            waveformOnlyint:
                                                                                                                                waveformOnlyint!,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                                child: SizedBox(
                                                                                                                  height:
                                                                                                                      35,
                                                                                                                  width:
                                                                                                                      80,
                                                                                                                  child: ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(
                                                                                                                      5,
                                                                                                                    ),
                                                                                                                    child: BackdropFilter(
                                                                                                                      filter: ImageFilter.blur(
                                                                                                                        sigmaX:
                                                                                                                            10,
                                                                                                                        sigmaY:
                                                                                                                            10,
                                                                                                                      ),
                                                                                                                      child: Container(
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Colors.white.withValues(
                                                                                                                            alpha:
                                                                                                                                0.1,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(
                                                                                                                            5,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        alignment:
                                                                                                                            Alignment.center,
                                                                                                                        padding: const EdgeInsets.symmetric(
                                                                                                                          horizontal:
                                                                                                                              10,
                                                                                                                        ),
                                                                                                                        child: Column(
                                                                                                                          mainAxisAlignment:
                                                                                                                              MainAxisAlignment.center,
                                                                                                                          crossAxisAlignment:
                                                                                                                              CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Textutil(
                                                                                                                              text:
                                                                                                                                  "Plain",
                                                                                                                              fontsize:
                                                                                                                                  13,
                                                                                                                              color:
                                                                                                                                  Colors.white,
                                                                                                                              fontWeight:
                                                                                                                                  FontWeight.bold,
                                                                                                                            ),
                                                                                                                            Textutil(
                                                                                                                              text:
                                                                                                                                  "By LRCLIB",
                                                                                                                              fontsize:
                                                                                                                                  9,
                                                                                                                              color:
                                                                                                                                  Colors.white,
                                                                                                                              fontWeight:
                                                                                                                                  FontWeight.bold,
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          Spaces.kheight20,
                                                                                                          Expanded(
                                                                                                            child: Stack(
                                                                                                              fit:
                                                                                                                  StackFit.expand,
                                                                                                              children: [
                                                                                                                ListView(
                                                                                                                  children: List.generate(
                                                                                                                    orginalLyrices.length,
                                                                                                                    (
                                                                                                                      index,
                                                                                                                    ) => Text(
                                                                                                                      removeDurationTags(
                                                                                                                        orginalLyrices[index],
                                                                                                                      ),
                                                                                                                      style: GoogleFonts.aBeeZee(
                                                                                                                        color:
                                                                                                                            Colors.white,
                                                                                                                        fontSize:
                                                                                                                            20,
                                                                                                                      ),
                                                                                                                      textAlign:
                                                                                                                          TextAlign.center,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment:
                                                                                                                      Alignment.bottomRight,
                                                                                                                  child: InkWell(
                                                                                                                    onTap: () {
                                                                                                                      Clipboard.setData(
                                                                                                                        ClipboardData(
                                                                                                                          text: removeDurationTags(
                                                                                                                            lyrics['lyrics'],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                      Spaces.showtoast(
                                                                                                                        "Copied to ClipBoard",
                                                                                                                      );
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
                                                                                                                            color: Colors.white.withValues(
                                                                                                                              alpha:
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
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      );
                                                                                                },
                                                                                                orElse:
                                                                                                    () =>
                                                                                                        SizedBox(),
                                                                                              );
                                                                                            },
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
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 2,
                                                        vertical: 5,
                                                      ),
                                                  child: SizedBox(
                                                    height: size.height / 3.3,
                                                    width: size.width,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 12,
                                                              ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets.only(
                                                                        left:
                                                                            15,
                                                                      ),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            double.infinity,
                                                                        child: Textutil(
                                                                          text: _gettite(
                                                                            audios[songindex].title,
                                                                            0,
                                                                          ),
                                                                          fontsize:
                                                                              19,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        lateaudios[songindex]
                                                                            .subtitle,
                                                                        style: Spaces.Getstyle(
                                                                          11,
                                                                          Colors
                                                                              .white,
                                                                          FontWeight
                                                                              .normal,
                                                                        ),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              BlocBuilder<
                                                                FavsongsBloc,
                                                                FavsongsState
                                                              >(
                                                                builder: (
                                                                  context,
                                                                  state2,
                                                                ) {
                                                                  return state2.maybeWhen(
                                                                    notpresent: () {
                                                                      return BlocBuilder<
                                                                        FavsongsBloc,
                                                                        FavsongsState
                                                                      >(
                                                                        builder: (
                                                                          context,
                                                                          state1,
                                                                        ) {
                                                                          return state1.maybeWhen(
                                                                            added: () {
                                                                              return PlayIcons(
                                                                                playicons:
                                                                                    CupertinoIcons.heart_fill,
                                                                                iconscolors:
                                                                                    Colors.red,
                                                                                iconsize:
                                                                                    30,
                                                                                ontap: () {
                                                                                  BlocProvider.of<
                                                                                    FavsongsBloc
                                                                                  >(
                                                                                    context,
                                                                                  ).add(
                                                                                    FavsongsEvent.removefromfav(
                                                                                      lateaudios[lateindex!].id.toString(),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            removed: () {
                                                                              return PlayIcons(
                                                                                playicons:
                                                                                    CupertinoIcons.heart,
                                                                                iconscolors:
                                                                                    Colors.white,
                                                                                iconsize:
                                                                                    30,
                                                                                ontap: () {
                                                                                  final details =
                                                                                      lateaudios[lateindex!];
                                                                                  final song = AlbumElements(
                                                                                    id:
                                                                                        details.id.toString(),
                                                                                    name:
                                                                                        details.title,
                                                                                    year:
                                                                                        '',
                                                                                    type:
                                                                                        '',
                                                                                    language:
                                                                                        '',
                                                                                    Artist:
                                                                                        details.subtitle,
                                                                                    url:
                                                                                        details.uri,
                                                                                    image:
                                                                                        '',
                                                                                  );
                                                                                  BlocProvider.of<
                                                                                    FavsongsBloc
                                                                                  >(
                                                                                    context,
                                                                                  ).add(
                                                                                    FavsongsEvent.addtofav(
                                                                                      song,
                                                                                      false,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            orElse:
                                                                                () => PlayIcons(
                                                                                  playicons:
                                                                                      CupertinoIcons.heart,
                                                                                  iconscolors:
                                                                                      Colors.white,
                                                                                  iconsize:
                                                                                      30,
                                                                                  ontap: () {
                                                                                    final details =
                                                                                        lateaudios[lateindex!];
                                                                                    final song = AlbumElements(
                                                                                      id:
                                                                                          details.id.toString(),
                                                                                      name:
                                                                                          details.title,
                                                                                      year:
                                                                                          '',
                                                                                      type:
                                                                                          '',
                                                                                      language:
                                                                                          '',
                                                                                      Artist:
                                                                                          details.subtitle,
                                                                                      url:
                                                                                          details.uri,
                                                                                      image:
                                                                                          '',
                                                                                    );
                                                                                    BlocProvider.of<
                                                                                      FavsongsBloc
                                                                                    >(
                                                                                      context,
                                                                                    ).add(
                                                                                      FavsongsEvent.addtofav(
                                                                                        song,
                                                                                        false,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    ispresent: (
                                                                      ispresent,
                                                                    ) {
                                                                      return PlayIcons(
                                                                        playicons:
                                                                            CupertinoIcons.heart_fill,
                                                                        iconscolors:
                                                                            Colors.red,
                                                                        iconsize:
                                                                            25,
                                                                        ontap: () {
                                                                          BlocProvider.of<
                                                                            FavsongsBloc
                                                                          >(
                                                                            context,
                                                                          ).add(
                                                                            FavsongsEvent.checkforfav(
                                                                              lateaudios[lateindex!].id.toString(),
                                                                            ),
                                                                          );

                                                                          BlocProvider.of<
                                                                            FavsongsBloc
                                                                          >(
                                                                            context,
                                                                          ).add(
                                                                            FavsongsEvent.checkforfav(
                                                                              lateaudios[lateindex!].id.toString(),
                                                                            ),
                                                                          );

                                                                          BlocProvider.of<
                                                                            FavsongsBloc
                                                                          >(
                                                                            context,
                                                                          ).add(
                                                                            FavsongsEvent.removefromfav(
                                                                              lateaudios[lateindex!].id.toString(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    orElse:
                                                                        () => PlayIcons(
                                                                          playicons:
                                                                              CupertinoIcons.heart_fill,
                                                                          iconscolors:
                                                                              Colors.red,
                                                                          iconsize:
                                                                              25,
                                                                          ontap:
                                                                              () {},
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                              PlaybackSpeedDropdownSlider(
                                                                audioPlayer:
                                                                    audioPlayer,
                                                              ),

                                                              BlocBuilder<
                                                                YoutubePlayerBackgroundBloc,
                                                                YoutubePlayerBackgroundState
                                                              >(
                                                                builder: (
                                                                  context,
                                                                  state,
                                                                ) {
                                                                  return state.maybeWhen(
                                                                    playBgvideo:
                                                                        (
                                                                          controller,
                                                                          streams,
                                                                        ) => PlayIcons(
                                                                          playicons:
                                                                              Icons.lyrics,
                                                                          iconscolors:
                                                                              Colors.white,
                                                                          iconsize:
                                                                              26,

                                                                          ontap: () {
                                                                            _showLyricsAbove =
                                                                                !_showLyricsAbove;
                                                                            setState(
                                                                              () {},
                                                                            );
                                                                          },
                                                                        ),
                                                                    orElse:
                                                                        () => PlayIcons(
                                                                          playicons:
                                                                              Icons.lyrics,
                                                                          iconscolors:
                                                                              Colors.white,
                                                                          iconsize:
                                                                              26,

                                                                          ontap: () {
                                                                            flipController.flip();
                                                                            BlocProvider.of<
                                                                              LyricsBloc
                                                                            >(
                                                                              context,
                                                                            ).add(
                                                                              LyricsEvent.getlyrics(
                                                                                audios[songindex].id.toString(),
                                                                                "${audios[songindex].title.split(".")[0]} | ${audios[songindex].subtitle.replaceAll("(", "").replaceAll(")", "")}  ",
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        Spaces.kheight10,
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 4,
                                                              ),
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
                                                                        MainAxisAlignment
                                                                            .center,
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
                                                                                  return Column(
                                                                                    mainAxisAlignment:
                                                                                        MainAxisAlignment.center,
                                                                                    crossAxisAlignment:
                                                                                        CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Stack(
                                                                                        alignment:
                                                                                            Alignment.center,
                                                                                        children: [
                                                                                          waveformOnlyint !=
                                                                                                      null &&
                                                                                                  waveformOnlyint!.isNotEmpty
                                                                                              ? Padding(
                                                                                                padding: const EdgeInsets.symmetric(
                                                                                                  horizontal:
                                                                                                      5,
                                                                                                ),
                                                                                                child: SizedBox(
                                                                                                  height:
                                                                                                      30,
                                                                                                  width:
                                                                                                      size.width,
                                                                                                  child: InteractiveBarSlideer(
                                                                                                    waveList:
                                                                                                        waveformOnlyint!,
                                                                                                    position:
                                                                                                        pos.inSeconds.toDouble(),
                                                                                                    duration:
                                                                                                        dur.inSeconds.toDouble(),
                                                                                                  ),
                                                                                                ),
                                                                                              )
                                                                                              : InteractiveBarSlider(
                                                                                                position:
                                                                                                    pos.inSeconds.toDouble(),
                                                                                                duration:
                                                                                                    dur.inSeconds.toDouble(),
                                                                                              ),
                                                                                          SliderTheme(
                                                                                            data: const SliderThemeData(
                                                                                              trackShape:
                                                                                                  RectangularSliderTrackShape(),
                                                                                              trackHeight:
                                                                                                  5,
                                                                                              thumbShape: RoundSliderThumbShape(
                                                                                                enabledThumbRadius:
                                                                                                    5,
                                                                                                disabledThumbRadius:
                                                                                                    5,
                                                                                                elevation:
                                                                                                    5,
                                                                                              ),
                                                                                            ),
                                                                                            child: Slider(
                                                                                              secondaryActiveColor:
                                                                                                  Colors.transparent,
                                                                                              thumbColor:
                                                                                                  Colors.white,
                                                                                              activeColor:
                                                                                                  Colors.transparent,
                                                                                              inactiveColor:
                                                                                                  Colors.transparent,
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
                                                                                        ],
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
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child: Column(
                                                                            children: [
                                                                              Stack(
                                                                                alignment:
                                                                                    Alignment.center,
                                                                                children: [
                                                                                  waveformOnlyint !=
                                                                                              null &&
                                                                                          waveformOnlyint!.isNotEmpty
                                                                                      ? Padding(
                                                                                        padding: const EdgeInsets.symmetric(
                                                                                          horizontal:
                                                                                              5,
                                                                                        ),
                                                                                        child: SizedBox(
                                                                                          height:
                                                                                              30,
                                                                                          width:
                                                                                              size.width,
                                                                                          child: InteractiveBarSlideer(
                                                                                            waveList:
                                                                                                waveformOnlyint!,
                                                                                            position:
                                                                                                postion,
                                                                                            duration:
                                                                                                duration,
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                      : InteractiveBarSlider(
                                                                                        position:
                                                                                            postion,
                                                                                        duration:
                                                                                            duration,
                                                                                      ),
                                                                                  CustomSlider(
                                                                                    activecolor:
                                                                                        Colors.transparent,
                                                                                    inactiveColor:
                                                                                        Colors.transparent,
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
                                                                                ],
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
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              ValueListenableBuilder(
                                                                valueListenable:
                                                                    Notifiers
                                                                        .isLoloopednotifier,
                                                                builder: (
                                                                  context,
                                                                  value,
                                                                  child,
                                                                ) {
                                                                  return PlayIcons(
                                                                    iconscolors:
                                                                        value
                                                                            ? Colors.red
                                                                            : const Color.fromARGB(
                                                                              255,
                                                                              75,
                                                                              75,
                                                                              75,
                                                                            ),
                                                                    iconsize:
                                                                        22,
                                                                    playicons:
                                                                        CupertinoIcons
                                                                            .loop,
                                                                    ontap: () {
                                                                      Notifiers
                                                                          .isLoloopednotifier
                                                                          .value = !Notifiers
                                                                              .isLoloopednotifier
                                                                              .value;

                                                                      if (Notifiers
                                                                          .isLoloopednotifier
                                                                          .value) {
                                                                        BlocProvider.of<
                                                                          AudioBloc
                                                                        >(
                                                                          context,
                                                                        ).add(
                                                                          const AudioEvent.loopon(
                                                                            true,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        BlocProvider.of<
                                                                          AudioBloc
                                                                        >(
                                                                          context,
                                                                        ).add(
                                                                          const AudioEvent.loopon(
                                                                            false,
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  );
                                                                },
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
                                                                    playBgvideo:
                                                                        (
                                                                          controller,
                                                                          d,
                                                                        ) => PlayIcons(
                                                                          iconscolors:
                                                                              audioPlayer.hasPrevious
                                                                                  ? const Color.fromARGB(
                                                                                    255,
                                                                                    255,
                                                                                    255,
                                                                                    255,
                                                                                  )
                                                                                  : Colors.white.withValues(
                                                                                    alpha:
                                                                                        0.3,
                                                                                  ),
                                                                          iconsize:
                                                                              30,
                                                                          playicons:
                                                                              Ionicons.play_back,
                                                                          ontap: () async {
                                                                            Spaces.showtoast(
                                                                              'switch back to audio streaming',
                                                                            );
                                                                          },
                                                                        ),
                                                                    orElse:
                                                                        () => PlayIcons(
                                                                          iconscolors:
                                                                              audioPlayer.hasPrevious
                                                                                  ? const Color.fromARGB(
                                                                                    255,
                                                                                    255,
                                                                                    255,
                                                                                    255,
                                                                                  )
                                                                                  : Colors.white.withValues(
                                                                                    alpha:
                                                                                        0.3,
                                                                                  ),
                                                                          iconsize:
                                                                              35,
                                                                          playicons:
                                                                              Ionicons.play_back,
                                                                          ontap: () async {
                                                                            BlocProvider.of<
                                                                              AudioBloc
                                                                            >(
                                                                              context,
                                                                            ).add(
                                                                              const AudioEvent.SeekPreviousAudio(),
                                                                            );
                                                                          },
                                                                        ),
                                                                  );
                                                                },
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
                                                                                  60,
                                                                              width:
                                                                                  60,
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
                                                                                    22,
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
                                                                    orElse: () {
                                                                      return Stack(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        children: [
                                                                          Card(
                                                                            elevation:
                                                                                5,
                                                                            shadowColor:
                                                                                Colors.white,
                                                                            color:
                                                                                Colors.white,
                                                                            shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(
                                                                                60,
                                                                              ),
                                                                            ),
                                                                            child: Container(
                                                                              height:
                                                                                  60,
                                                                              width:
                                                                                  60,
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
                                                                                    isplaying
                                                                                        ? CupertinoIcons.pause
                                                                                        : Icons.play_arrow_rounded,
                                                                                iconscolors:
                                                                                    Colors.black,
                                                                                iconsize:
                                                                                    22,
                                                                                ontap: () {
                                                                                  if (audioPlayer.playing ==
                                                                                      true) {
                                                                                    setState(
                                                                                      () =>
                                                                                          isplaying =
                                                                                              true,
                                                                                    );
                                                                                    BlocProvider.of<
                                                                                      AudioBloc
                                                                                    >(
                                                                                      context,
                                                                                    ).add(
                                                                                      const AudioEvent.pause(),
                                                                                    );
                                                                                  } else {
                                                                                    setState(
                                                                                      () =>
                                                                                          isplaying =
                                                                                              true,
                                                                                    );
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
                                                                      );
                                                                    },
                                                                  );
                                                                },
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
                                                                    playBgvideo:
                                                                        (
                                                                          controller,
                                                                          d,
                                                                        ) => PlayIcons(
                                                                          iconscolors:
                                                                              audioPlayer.hasNext
                                                                                  ? const Color.fromARGB(
                                                                                    255,
                                                                                    255,
                                                                                    255,
                                                                                    255,
                                                                                  )
                                                                                  : Colors.white.withValues(
                                                                                    alpha:
                                                                                        0.3,
                                                                                  ),
                                                                          iconsize:
                                                                              30,
                                                                          playicons:
                                                                              Ionicons.play_forward,
                                                                          ontap: () async {
                                                                            Spaces.showtoast(
                                                                              'switch back to audio streaming',
                                                                            );
                                                                          },
                                                                        ),
                                                                    orElse:
                                                                        () => PlayIcons(
                                                                          iconscolors:
                                                                              audioPlayer.hasNext
                                                                                  ? const Color.fromARGB(
                                                                                    255,
                                                                                    255,
                                                                                    255,
                                                                                    255,
                                                                                  )
                                                                                  : Colors.white.withValues(
                                                                                    alpha:
                                                                                        0.3,
                                                                                  ),
                                                                          iconsize:
                                                                              35,
                                                                          playicons:
                                                                              Ionicons.play_forward,
                                                                          ontap: () async {
                                                                            BlocProvider.of<
                                                                              AudioBloc
                                                                            >(
                                                                              context,
                                                                            ).add(
                                                                              const AudioEvent.seeknextaudio(),
                                                                            );
                                                                          },
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                              ValueListenableBuilder(
                                                                valueListenable:
                                                                    Notifiers
                                                                        .isLoshufflednotifier,
                                                                builder: (
                                                                  context,
                                                                  value,
                                                                  child,
                                                                ) {
                                                                  return PlayIcons(
                                                                    iconscolors:
                                                                        value
                                                                            ? Colors.red
                                                                            : const Color.fromARGB(
                                                                              255,
                                                                              75,
                                                                              75,
                                                                              75,
                                                                            ),
                                                                    iconsize:
                                                                        22,
                                                                    playicons:
                                                                        CupertinoIcons
                                                                            .shuffle,
                                                                    ontap: () {
                                                                      Notifiers
                                                                          .isLoshufflednotifier
                                                                          .value = !Notifiers
                                                                              .isLoshufflednotifier
                                                                              .value;

                                                                      if (Notifiers
                                                                          .isLoshufflednotifier
                                                                          .value) {
                                                                        BlocProvider.of<
                                                                          AudioBloc
                                                                        >(
                                                                          context,
                                                                        ).add(
                                                                          const AudioEvent.shuffleon(
                                                                            true,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        BlocProvider.of<
                                                                          AudioBloc
                                                                        >(
                                                                          context,
                                                                        ).add(
                                                                          const AudioEvent.shuffleon(
                                                                            false,
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        BottomSection(
                                                          audios: audios,
                                                          audioPlayer:
                                                              audioPlayer,
                                                          onqualitytap: () {},
                                                          onqueuetap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (
                                                                      _,
                                                                    ) => Reorder(
                                                                      audios:
                                                                          audios,
                                                                      audioPlayer:
                                                                          audioPlayer,
                                                                    ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                          return const SizedBox();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            orElse: () => const SizedBox(),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SafeArea(
                        child: SizedBox(
                          height: 60,
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Transform.rotate(
                                      angle: -100 / 65,
                                      child: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  BlocBuilder<AudioBloc, AudioState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () => const SizedBox(),
                                        Localsongs: (
                                          isloading,
                                          isfailed,
                                          audioss,
                                          valueStream,
                                          index,
                                          audioPlayer,
                                        ) {
                                          return StreamBuilder(
                                            stream: valueStream,
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData &&
                                                  snapshot.data != null) {
                                                int songindex = snapshot.data!
                                                    .maybeMap(
                                                      orElse: () => 0,
                                                      LocalStreams: (val) {
                                                        return val.index;
                                                      },
                                                    );

                                                return SizedBox(
                                                  width: size.width / 2,
                                                  child: Column(
                                                    children: [
                                                      Textutil(
                                                        text: "Playing",
                                                        fontsize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      Textutil(
                                                        text:
                                                            "${audioss[songindex].title.split(".")[0]} by ${audioss[songindex].subtitle}",
                                                        fontsize: 15,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ],
                                                  ),
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

                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: BlocBuilder<AudioBloc, AudioState>(
                                      builder: (context, state) {
                                        return state.maybeWhen(
                                          orElse: () => const SizedBox(),
                                          Localsongs: (
                                            isloading,
                                            isfailed,
                                            audios,
                                            valueStream,
                                            index,
                                            audioPlayer,
                                          ) {
                                            return IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (_) => EqualizerPage(
                                                          audioPlayer:
                                                              audioPlayer,
                                                        ),
                                                  ),
                                                );
                                              },
                                              icon: Image.asset(
                                                "assets/equalizer.png",
                                                color: Colors.white,
                                                scale: 26,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
               ),
              Spaces.kheight20,
            ],
          ),
        ],
      ),
    );
  }
}

class BottomSection extends StatefulWidget {
  final List<Songmodel> audios;
  final AudioPlayer audioPlayer;
  final VoidCallback onqualitytap;
  final VoidCallback onqueuetap;
  const BottomSection({
    super.key,
    required this.audios,
    required this.audioPlayer,
    required this.onqualitytap,
    required this.onqueuetap,
  });

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  String _gettite(String name, int index) {
    return name.contains(".") ? name.split(".")[index] : name;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 29),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<AudioBloc, AudioState>(
            builder: (context, audiostate) {
              return audiostate.maybeWhen(
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
                        int songindex = snapshot.data!.maybeMap(
                          orElse: () => 0,
                          LocalStreams: (val) {
                            return val.index;
                          },
                        );

                        return BlocBuilder<
                          YoutubePlayerBackgroundBloc,
                          YoutubePlayerBackgroundState
                        >(
                          builder: (context, state) {
                            return state.maybeWhen(
                              loadingBg:
                                  () => SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                              playBgvideo:
                                  (controller, d) => GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<
                                        YoutubePlayerBackgroundBloc
                                      >(context).add(
                                        const YoutubePlayerBackgroundEvent.started(),
                                      );
                                    },
                                    child: const SizedBox(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.music_note,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(width: 5),
                                          Textutil(
                                            text: 'Audio',
                                            fontsize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              orElse:
                                  () => GestureDetector(
                                    onTap: () {
                                      String name = "${_gettite(audios[songindex].title, 0)} by ${audios[songindex].subtitle} offical video";
                                      log(name);
                                      BlocProvider.of<
                                        YoutubePlayerBackgroundBloc
                                      >(context).add(
                                        YoutubePlayerBackgroundEvent.getinitialized(
                                           name,
                                          _selectedResolution,
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    child: const Row(
                                      children: [
                                        SizedBox(
                                          child: Icon(
                                            Icons.personal_video,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Textutil(
                                          text: 'Video',
                                          fontsize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                            );
                          },
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
          BlocBuilder<
            YoutubePlayerBackgroundBloc,
            YoutubePlayerBackgroundState
          >(
            builder: (context, state) {
              return state.maybeWhen(
                playBgvideo: (controller, streams) {
                  return SizedBox(
                    width: state.maybeWhen(
                      playBgvideo: (controller, streams) => 99,
                      orElse: () => 50,
                    ),
                    height: 40,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlayIcons(
                            playicons: Icons.queue_music,
                            iconscolors: Colors.white,
                            iconsize: 23,
                            ontap: widget.onqueuetap,
                          ),

                          BlocBuilder<
                            YoutubePlayerBackgroundBloc,
                            YoutubePlayerBackgroundState
                          >(
                            builder: (context, state) {
                              return state.maybeWhen(
                                playBgvideo:
                                    (
                                      controller,
                                      streams,
                                    ) => ValueListenableBuilder(
                                      valueListenable: Notifiers.viewtype,
                                      builder: (context, value, child) {
                                        return PlayIcons(
                                          playicons:
                                              value
                                                  ? Icons.fullscreen
                                                  : Icons
                                                      .fullscreen_exit_outlined,

                                          iconscolors: Colors.white,
                                          iconsize: 23,
                                          ontap: () {
                                            if (Notifiers.viewtype.value ==
                                                true) {
                                              Notifiers.viewtype.value = false;
                                            } else {
                                              Notifiers.viewtype.value = true;
                                            }
                                          },
                                        );
                                      },
                                    ),
                                orElse: () => SizedBox(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                orElse:
                    () => SizedBox(
                      width: 50,
                      height: 40,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlayIcons(
                              playicons: Icons.queue_music,
                              iconscolors: Colors.white,
                              iconsize: 23,
                              ontap: widget.onqueuetap,
                            ),
                          ],
                        ),
                      ),
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LocalQueryArtWidget extends StatelessWidget {
  const LocalQueryArtWidget({
    super.key,
    required this.size,
    required this.audios,
    required this.songindex,
    required this.fit,
  });

  final Size size;
  final List<Songmodel> audios;
  final int songindex;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      quality: 100,
      nullArtworkWidget: const NullMusicAlbumWidget(),
      artworkBorder: BorderRadius.circular(2),
      size: 2000,
      format: ArtworkFormat.JPEG,
      artworkFit: fit,
      artworkQuality: FilterQuality.high,
      keepOldArtwork: true,
      artworkHeight: size.height,
      artworkWidth: size.width,
      artworkBlendMode: BlendMode.colorBurn,
      id: audios[songindex].id,
      type: ArtworkType.AUDIO,
    );
  }
}
