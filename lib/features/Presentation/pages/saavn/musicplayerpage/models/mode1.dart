// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytdownload_bloc/ytdownload_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/audiospeed.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/favbutton.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/plainlyrics.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as vidlib;
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Data/Models/MusicModels/onlinesongmodel.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/Lyrics_bloc/lyrics_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/CustomSliderWidget.dart';
import 'package:norse/features/Presentation/pages/offline/qualizer/equalizer.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/lyricsmodel0.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/staticbar.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/timesynced.dart';
import 'package:norse/features/Presentation/pages/saavn/queue/onlinequeue.dart';
import 'package:norse/injection_container.dart' as di;
import '../../../../../../configs/constants/Spaces.dart';
import '../../../../../Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import '../../../../../Domain/UseCases/Sql_UseCase/addtodownloads_Usecase.dart';
import '../../../../Blocs/Musicbloc/Library/song/library_bloc/library_bloc.dart';
import '../../../../Blocs/Musicbloc/Library/song/songlike_bloc/songlike_bloc.dart';
import '../../../../Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import '../testonlineplayerscreen.dart';

bool viewtype = false;
bool showlyrics = false;
int lateindex = 100;

class Model1 extends StatefulWidget {
  final int index;
  const Model1({super.key, required this.index});

  @override
  State<Model1> createState() => _Model1State();
}

class _Model1State extends State<Model1> with TickerProviderStateMixin {
  late final player = mediaplayer.Player();
  late PageController pageController;
  vidlib.YoutubeExplode yt = vidlib.YoutubeExplode();
  final FlipController flipController = FlipController();

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
  void initState() {
    pageController = PageController(
      viewportFraction: 1,
      initialPage: widget.index,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void changeduration(int sceconds, AudioPlayer player) {
    Duration duration = Duration(seconds: sceconds);
    player.seek(duration);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((a) {
      BlocBuilder<AudioBloc, AudioState>(
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
                    final songindex = snapshot.data!.maybeMap(
                      orElse: () => 0,
                      onlinestreams: (value) => value.index,
                    );
                    BlocProvider.of<LyricsBloc>(context).add(
                      LyricsEvent.getlyrics(
                        audios[songindex].id,
                        "${audios[songindex].title} | ${audios[songindex].artist.replaceAll("(", "").replaceAll(")", "")}",
                      ),
                    );
                    return const SizedBox(height: 0);
                  } else {
                    return const SizedBox(height: 0);
                  }
                },
              );
            },
            orElse: () => SizedBox(),
          );
        },
      );
    });
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,

        body: Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: BlocBuilder<AudioBloc, AudioState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    ytmusic: (
                      video,
                      index,
                      isloading,
                      isfailed,
                      valueStream,
                      songs,
                      audioplayer,
                    ) {
                      return StreamBuilder(
                        stream: valueStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            final songindex = snapshot.data!.maybeMap(
                              orElse: () => 0,
                              onlinestreams: (value) => value.index,
                            );

                            return SizedBox(
                              height: size.height,
                              width: size.width,
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 20,
                                  sigmaY: 20,
                                ),
                                child: Image.network(
                                  songs[songindex].imageurl,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.none,
                                ),
                              ),
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
                          if (snapshot.hasData && snapshot.data != null) {
                            final songindex = snapshot.data!.maybeMap(
                              orElse: () => 0,
                              onlinestreams: (value) => value.index,
                            );

                            return SizedBox(
                              height: size.height,
                              width: size.width,
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 20,
                                  sigmaY: 20,
                                ),
                                child: Image.network(
                                  audios[songindex].imageurl,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.none,
                                ),
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      );
                    },
                    orElse: () => SizedBox(),
                  );
                },
              ),
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
                    Colors.black.withValues(alpha: 0.83),
                    Colors.black.withValues(alpha: 0.1),
                  ],
                ),
              ),
            ),
            BlocBuilder<
              YoutubePlayerBackgroundBloc,
              YoutubePlayerBackgroundState
            >(
              builder: (context, state) {
                return state.maybeWhen(
                  playBgvideo: (controllerr, d) {
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: Notifiers.viewtype,
                          builder:
                              (context, value, child) =>
                                  value
                                      ? SizedBox()
                                      : SizedBox(
                                        child: Video(
                                          pauseUponEnteringBackgroundMode:
                                              false,
                                          fit: BoxFit.cover,
                                          controller: controllerr,
                                        ),
                                      ),
                        ),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: size.height,
                            width: size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                colors: [
                                  Colors.black,
                                  Colors.black.withValues(alpha: 0.83),
                                  Colors.black.withValues(alpha: 0.1),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  orElse: () => const SizedBox(),
                );
              },
            ),
            ListView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<AudioBloc, AudioState>(
                          builder: (context, audstate) {
                            return audstate.maybeMap(
                              ytmusic: (value) {
                                return Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        StreamBuilder(
                                          stream: value.valueStream,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData &&
                                                snapshot.data != null) {
                                              double postion =
                                                  snapshot.data!
                                                      .maybeMap(
                                                        orElse: () => 0,
                                                        onlinestreams:
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
                                                        onlinestreams:
                                                            (value) =>
                                                                value
                                                                    .dur
                                                                    .inSeconds,
                                                      )
                                                      .toDouble();

                                              PlayerState duplayer =
                                                  PlayerState(
                                                    false,
                                                    ProcessingState.loading,
                                                  );

                                              final songindex = snapshot.data!
                                                  .maybeMap(
                                                    orElse: () => 0,
                                                    onlinestreams:
                                                        (value) => value.index,
                                                  );

                                              PlayerState playerState = snapshot
                                                  .data!
                                                  .maybeMap(
                                                    orElse: () => duplayer,
                                                    onlinestreams:
                                                        (value) =>
                                                            value.playerState,
                                                  );

                                              value.songs.isNotEmpty
                                                  ? BlocProvider.of<
                                                    SonglikeBloc
                                                  >(context).add(
                                                    SonglikeEvent.checkifpresent(
                                                      value.songs[songindex].id,
                                                    ),
                                                  )
                                                  : null;

                                              lateindex = songindex;

                                              return SizedBox(
                                                height: size.height,
                                                width: size.width,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                            top: 125,
                                                          ),
                                                      child: BlocBuilder<
                                                        YoutubePlayerBackgroundBloc,
                                                        YoutubePlayerBackgroundState
                                                      >(
                                                        builder: (
                                                          context,
                                                          controlleryt,
                                                        ) {
                                                          return controlleryt.maybeWhen(
                                                            playBgvideo: (
                                                              controller,
                                                              d,
                                                            ) {
                                                              return SizedBox(
                                                                height:
                                                                    MediaQuery.sizeOf(
                                                                      context,
                                                                    ).height /
                                                                    2.6,
                                                                width:
                                                                    MediaQuery.sizeOf(
                                                                      context,
                                                                    ).width,
                                                                child: ValueListenableBuilder(
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
                                                                              ? Video(
                                                                                pauseUponEnteringBackgroundMode:
                                                                                    false,
                                                                                fit:
                                                                                    BoxFit.fitHeight,
                                                                                controller:
                                                                                    controller,
                                                                              )
                                                                              : const SizedBox(),
                                                                ),
                                                              );
                                                            },
                                                            orElse:
                                                                () => SizedBox(
                                                                  height:
                                                                      MediaQuery.sizeOf(
                                                                        context,
                                                                      ).height /
                                                                      2.5,
                                                                  width:
                                                                      MediaQuery.sizeOf(
                                                                        context,
                                                                      ).width,
                                                                  child: PageView.builder(
                                                                    controller:
                                                                        pageController,
                                                                    itemCount:
                                                                        value
                                                                            .songs
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
                                                                        padding: const EdgeInsets.only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20,
                                                                          top:
                                                                              10,
                                                                        ),
                                                                        child: GestureDetector(
                                                                          onTap: () {
                                                                            flipController.flip();
                                                                            BlocProvider.of<
                                                                              LyricsBloc
                                                                            >(
                                                                              context,
                                                                            ).add(
                                                                              LyricsEvent.getlyrics(
                                                                                value.songs[songindex].id,
                                                                                "${value.songs[songindex].title} | ${value.songs[songindex].artist.replaceAll("(", "").replaceAll(")", "")}",
                                                                              ),
                                                                            );
                                                                          },

                                                                          child: SizedBox(
                                                                            child: SizedBox(
                                                                              height:
                                                                                  MediaQuery.sizeOf(
                                                                                    context,
                                                                                  ).height /
                                                                                  2.7,
                                                                              width:
                                                                                  MediaQuery.sizeOf(
                                                                                    context,
                                                                                  ).width,
                                                                              child: Material(
                                                                                elevation:
                                                                                    6,
                                                                                surfaceTintColor:
                                                                                    Colors.transparent,
                                                                                color:
                                                                                    Colors.transparent,
                                                                                shadowColor:
                                                                                    Colors.transparent,
                                                                                borderRadius: BorderRadius.circular(
                                                                                  5,
                                                                                ),
                                                                                child: Container(
                                                                                  clipBehavior:
                                                                                      Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    color:
                                                                                        Colors.transparent,
                                                                                    borderRadius: BorderRadius.circular(
                                                                                      5,
                                                                                    ),
                                                                                  ),
                                                                                  child: Flip(
                                                                                    controller:
                                                                                        flipController,
                                                                                    firstChild: CachedNetworkImage(
                                                                                      errorWidget:
                                                                                          (
                                                                                            context,
                                                                                            url,
                                                                                            error,
                                                                                          ) => Icon(
                                                                                            Ionicons.musical_notes,
                                                                                            color:
                                                                                                Colors.white,
                                                                                            size:
                                                                                                30,
                                                                                          ),
                                                                                      imageUrl:
                                                                                          value.songs[index].imageurl,
                                                                                      fit:
                                                                                          BoxFit.cover,
                                                                                    ),
                                                                                    secondChild: SizedBox(
                                                                                      child: BlocBuilder<
                                                                                        AudioBloc,
                                                                                        AudioState
                                                                                      >(
                                                                                        builder: (
                                                                                          context,
                                                                                          state1,
                                                                                        ) {
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
                                                                                                stream:
                                                                                                    valueStream,
                                                                                                builder: (
                                                                                                  context,
                                                                                                  snapshot,
                                                                                                ) {
                                                                                                  if (snapshot.data !=
                                                                                                          null &&
                                                                                                      snapshot.hasData) {
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
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsets.symmetric(
                                                                                                                        horizontal:
                                                                                                                            5,
                                                                                                                        vertical:
                                                                                                                            0,
                                                                                                                      ),
                                                                                                                      child: Row(
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
                                                                                                                                      ) => SpotifyStyleFullScreenLyrics(
                                                                                                                                        audios:
                                                                                                                                            songs,
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
                                                                                                                              Navigator.of(
                                                                                                                                context,
                                                                                                                              ).push(
                                                                                                                                MaterialPageRoute(
                                                                                                                                  builder:
                                                                                                                                      (
                                                                                                                                        _,
                                                                                                                                      ) => Plainlyrics(
                                                                                                                                        audios:
                                                                                                                                            songs,
                                                                                                                                        stream:
                                                                                                                                            valueStream,
                                                                                                                                        size:
                                                                                                                                            size,
                                                                                                                                        lyrics:
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
                                                                                                                              splashColor:
                                                                                                                                  Colors.transparent,
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
                                                                                            orElse:
                                                                                                () =>
                                                                                                    const SizedBox(),
                                                                                            onlinesongs: (
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
                                                                                                  if (snapshot.data !=
                                                                                                          null &&
                                                                                                      snapshot.hasData) {
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
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsets.symmetric(
                                                                                                                        horizontal:
                                                                                                                            5,
                                                                                                                        vertical:
                                                                                                                            0,
                                                                                                                      ),
                                                                                                                      child: Row(
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
                                                                                                                                      ) => SpotifyStyleFullScreenLyrics(
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
                                                                                                                              Navigator.of(
                                                                                                                                context,
                                                                                                                              ).push(
                                                                                                                                MaterialPageRoute(
                                                                                                                                  builder:
                                                                                                                                      (
                                                                                                                                        _,
                                                                                                                                      ) => Plainlyrics(
                                                                                                                                        audios:
                                                                                                                                            audios,
                                                                                                                                        stream:
                                                                                                                                            valueStream,
                                                                                                                                        size:
                                                                                                                                            size,
                                                                                                                                        lyrics:
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
                                                                                                                              splashColor:
                                                                                                                                  Colors.transparent,
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
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),

                                                    //title
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10,
                                                          ),
                                                      child: SizedBox(
                                                        height: size.height / 3,
                                                        width: size.width,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 10,
                                                                  ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Textutil(
                                                                              text:
                                                                                  value.songs[songindex].title,
                                                                              fontsize:
                                                                                  20,
                                                                              color:
                                                                                  Colors.white,
                                                                              fontWeight:
                                                                                  FontWeight.bold,
                                                                            ),
                                                                            Spaces.kheigth5,
                                                                            Textutil(
                                                                              text:
                                                                                  value.songs[songindex].artist,
                                                                              fontsize:
                                                                                  13,
                                                                              color:
                                                                                  Colors.white,
                                                                              fontWeight:
                                                                                  FontWeight.bold,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),

                                                                      PlaybackSpeedDropdownSlider(
                                                                        audioPlayer:
                                                                            value.audioPlayer,
                                                                      ),

                                                                      PlayIcons(
                                                                        playicons:
                                                                            Icons.lyrics,
                                                                        iconscolors:
                                                                            Colors.white,
                                                                        iconsize:
                                                                            26,

                                                                        ontap: () {
                                                                          flipController
                                                                              .flip();
                                                                          BlocProvider.of<
                                                                            LyricsBloc
                                                                          >(
                                                                            context,
                                                                          ).add(
                                                                            LyricsEvent.getlyrics(
                                                                              value.songs[songindex].id,
                                                                              "${value.songs[songindex].title} | ${value.songs[songindex].artist.replaceAll("(", "").replaceAll(")", "")}",
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
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
                                                                    return Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child: Column(
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
                                                                                      children: [
                                                                                        Column(
                                                                                          children: [
                                                                                            Stack(
                                                                                              alignment:
                                                                                                  Alignment.center,
                                                                                              children: [
                                                                                                InteractiveBarSlider(
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
                                                                                                        7,
                                                                                                    thumbShape: RoundSliderThumbShape(
                                                                                                      disabledThumbRadius:
                                                                                                          6,
                                                                                                      enabledThumbRadius:
                                                                                                          6,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Slider(
                                                                                                    secondaryActiveColor:
                                                                                                        Colors.transparent,
                                                                                                    thumbColor: const Color.fromARGB(
                                                                                                      255,
                                                                                                      255,
                                                                                                      255,
                                                                                                      255,
                                                                                                    ),
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
                                                                                                    22,
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
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child: Column(
                                                                              children: [
                                                                                Stack(
                                                                                  alignment:
                                                                                      Alignment.center,
                                                                                  children: [
                                                                                    InteractiveBarSlider(
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
                                                                                          value.audioPlayer,
                                                                                      postion:
                                                                                          postion,
                                                                                      duration:
                                                                                          duration,
                                                                                      trackHeight:
                                                                                          5,
                                                                                      thumshape: RoundSliderThumbShape(
                                                                                        enabledThumbRadius:
                                                                                            5,
                                                                                        disabledThumbRadius:
                                                                                            5,
                                                                                        elevation:
                                                                                            8,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(
                                                                                    horizontal:
                                                                                        23,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisAlignment:
                                                                                        MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        formatTime(
                                                                                          postion,
                                                                                        ),
                                                                                        style: const TextStyle(
                                                                                          fontSize:
                                                                                              12,
                                                                                          color:
                                                                                              Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        formatTime(
                                                                                          duration,
                                                                                        ),
                                                                                        style: const TextStyle(
                                                                                          fontSize:
                                                                                              12,
                                                                                          color:
                                                                                              Colors.white,
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

                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ValueListenableBuilder(
                                                                  valueListenable:
                                                                      Notifiers
                                                                          .isloopednotifer,
                                                                  builder: (
                                                                    context,
                                                                    bool value,
                                                                    child,
                                                                  ) {
                                                                    return PlayIcons(
                                                                      iconscolors:
                                                                          value
                                                                              ? Colors.white
                                                                              : const Color.fromARGB(
                                                                                255,
                                                                                68,
                                                                                68,
                                                                                68,
                                                                              ),
                                                                      iconsize:
                                                                          24,
                                                                      playicons:
                                                                          CupertinoIcons
                                                                              .loop_thick,
                                                                      ontap: () {
                                                                        Notifiers
                                                                            .isloopednotifer
                                                                            .value = !Notifiers.isloopednotifer.value;

                                                                        if (Notifiers
                                                                            .isloopednotifer
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
                                                                                value.audioPlayer.hasPrevious
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
                                                                                24,
                                                                            playicons:
                                                                                Ionicons.play_back,
                                                                            ontap: () async {
                                                                              Spaces.showtoast(
                                                                                'switch back to audio streaming',
                                                                              );
                                                                            },
                                                                          ),
                                                                      orElse: () {
                                                                        return PlayIcons(
                                                                          iconscolors:
                                                                              value.audioPlayer.hasPrevious
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
                                                                              24,
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
                                                                      playBgvideo: (
                                                                        controlleryt,
                                                                        d,
                                                                      ) {
                                                                        value
                                                                            .audioPlayer
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
                                                                                          ? Ionicons.pause
                                                                                          : Ionicons.play,
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
                                                                                        70,
                                                                                    width:
                                                                                        70,
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
                                                                                        value.audioPlayer.playing ==
                                                                                                true
                                                                                            ? Ionicons.pause
                                                                                            : Ionicons.play,
                                                                                    iconscolors:
                                                                                        Colors.black,
                                                                                    iconsize:
                                                                                        25,
                                                                                    ontap: () async {
                                                                                      if (value.audioPlayer.playing ==
                                                                                          true) {
                                                                                        // _controller.stop();
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
                                                                                value.audioPlayer.hasNext
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
                                                                                24,
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
                                                                                value.audioPlayer.hasNext
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
                                                                                24,
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
                                                                          .isshufflednotifier,
                                                                  builder: (
                                                                    context,
                                                                    bool value,
                                                                    child,
                                                                  ) {
                                                                    return PlayIcons(
                                                                      iconscolors:
                                                                          value
                                                                              ? Colors.white
                                                                              : const Color.fromARGB(
                                                                                255,
                                                                                68,
                                                                                68,
                                                                                68,
                                                                              ),
                                                                      iconsize:
                                                                          20,
                                                                      playicons:
                                                                          CupertinoIcons
                                                                              .shuffle,
                                                                      ontap: () {
                                                                        Notifiers
                                                                            .isshufflednotifier
                                                                            .value = !Notifiers.isshufflednotifier.value;

                                                                        if (Notifiers
                                                                            .isshufflednotifier
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
                                                            BottomSection(
                                                              onqueuetap: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (
                                                                      context,
                                                                    ) {
                                                                      return Onlinequeue(
                                                                        audios:
                                                                            value.songs,
                                                                        audioPlayer:
                                                                            value.audioPlayer,
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                              audios:
                                                                  value.songs,
                                                              audioPlayer:
                                                                  value
                                                                      .audioPlayer,
                                                            ),
                                                          ],
                                                        ),
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
                                        /*  */
                                      ],
                                    ),

                                    SafeArea(
                                      child: SizedBox(
                                        height: 60,
                                        width: size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 4,
                                                  ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                  StreamBuilder(
                                                    stream: value.valueStream,
                                                    builder: (
                                                      context,
                                                      snapshot,
                                                    ) {
                                                      if (snapshot.hasData &&
                                                          snapshot.data !=
                                                              null) {
                                                        int songindex = snapshot
                                                            .data!
                                                            .maybeMap(
                                                              orElse: () => 0,
                                                              onlinestreams: (
                                                                val,
                                                              ) {
                                                                return val
                                                                    .index;
                                                              },
                                                            );

                                                        return SizedBox(
                                                          width: size.width / 2,
                                                          child: Column(
                                                            children: [
                                                              Textutil(
                                                                text: "Playing",
                                                                fontsize: 20,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              Textutil(
                                                                text:
                                                                    "${value.songs[songindex].title} by ${value.songs[songindex].artist}",
                                                                fontsize: 15,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else {
                                                        return const SizedBox();
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          right: 10,
                                                        ),
                                                    child: BlocBuilder<
                                                      AudioBloc,
                                                      AudioState
                                                    >(
                                                      builder: (
                                                        context,
                                                        state,
                                                      ) {
                                                        return state.maybeWhen(
                                                          orElse:
                                                              () =>
                                                                  const SizedBox(),
                                                          ytmusic: (
                                                            video,
                                                            index,
                                                            isloading,
                                                            isfailed,
                                                            valueStream,
                                                            songs,
                                                            audioPlayer,
                                                          ) {
                                                            return IconButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (
                                                                          _,
                                                                        ) => EqualizerPage(
                                                                          audioPlayer:
                                                                              audioPlayer,
                                                                        ),
                                                                  ),
                                                                );
                                                              },
                                                              icon: Image.asset(
                                                                "assets/equalizer.png",
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                scale: 26,
                                                              ),
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
                                                            return IconButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (
                                                                          _,
                                                                        ) => EqualizerPage(
                                                                          audioPlayer:
                                                                              audioPlayer,
                                                                        ),
                                                                  ),
                                                                );
                                                              },
                                                              icon: Image.asset(
                                                                "assets/equalizer.png",
                                                                color:
                                                                    Colors
                                                                        .white,
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              onlinesongs: (astate) {
                                return Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        StreamBuilder(
                                          stream: astate.valueStream,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData &&
                                                snapshot.data != null) {
                                              double postion =
                                                  snapshot.data!
                                                      .maybeMap(
                                                        orElse: () => 0,
                                                        onlinestreams:
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
                                                        onlinestreams:
                                                            (value) =>
                                                                value
                                                                    .dur
                                                                    .inSeconds,
                                                      )
                                                      .toDouble();

                                              PlayerState duplayer =
                                                  PlayerState(
                                                    false,
                                                    ProcessingState.loading,
                                                  );

                                              final songindex = snapshot.data!
                                                  .maybeMap(
                                                    orElse: () => 0,
                                                    onlinestreams:
                                                        (value) => value.index,
                                                  );

                                              PlayerState playerState = snapshot
                                                  .data!
                                                  .maybeMap(
                                                    orElse: () => duplayer,
                                                    onlinestreams:
                                                        (value) =>
                                                            value.playerState,
                                                  );

                                              astate.audios.isNotEmpty
                                                  ? BlocProvider.of<
                                                    SonglikeBloc
                                                  >(context).add(
                                                    SonglikeEvent.checkifpresent(
                                                      astate
                                                          .audios[songindex]
                                                          .id,
                                                    ),
                                                  )
                                                  : null;

                                              lateindex = songindex;

                                              return SizedBox(
                                                height: size.height,
                                                width: size.width,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                            top: 125,
                                                          ),
                                                      child: BlocBuilder<
                                                        YoutubePlayerBackgroundBloc,
                                                        YoutubePlayerBackgroundState
                                                      >(
                                                        builder: (
                                                          context,
                                                          controlleryt,
                                                        ) {
                                                          return controlleryt.maybeWhen(
                                                            playBgvideo: (
                                                              controller,
                                                              d,
                                                            ) {
                                                              return SizedBox(
                                                                height:
                                                                    MediaQuery.sizeOf(
                                                                      context,
                                                                    ).height /
                                                                    2.6,
                                                                width:
                                                                    MediaQuery.sizeOf(
                                                                      context,
                                                                    ).width,
                                                                child: ValueListenableBuilder(
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
                                                                              ? Video(
                                                                                pauseUponEnteringBackgroundMode:
                                                                                    false,
                                                                                fit:
                                                                                    BoxFit.fitHeight,
                                                                                controller:
                                                                                    controller,
                                                                              )
                                                                              : const SizedBox(),
                                                                ),
                                                              );
                                                            },
                                                            orElse:
                                                                () => SizedBox(
                                                                  height:
                                                                      MediaQuery.sizeOf(
                                                                        context,
                                                                      ).height /
                                                                      2.5,
                                                                  width:
                                                                      MediaQuery.sizeOf(
                                                                        context,
                                                                      ).width,
                                                                  child: PageView.builder(
                                                                    controller:
                                                                        pageController,
                                                                    itemCount:
                                                                        astate
                                                                            .audios
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
                                                                        padding: const EdgeInsets.only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20,
                                                                          top:
                                                                              10,
                                                                        ),
                                                                        child: GestureDetector(
                                                                          onTap: () {
                                                                            flipController.flip();
                                                                            BlocProvider.of<
                                                                              LyricsBloc
                                                                            >(
                                                                              context,
                                                                            ).add(
                                                                              LyricsEvent.getlyrics(
                                                                                astate.audios[songindex].id,
                                                                                "${astate.audios[songindex].title} | ${astate.audios[songindex].artist.replaceAll("(", "").replaceAll(")", "")}",
                                                                              ),
                                                                            );
                                                                          },

                                                                          child: SizedBox(
                                                                            child: SizedBox(
                                                                              height:
                                                                                  MediaQuery.sizeOf(
                                                                                    context,
                                                                                  ).height /
                                                                                  2.7,
                                                                              width:
                                                                                  MediaQuery.sizeOf(
                                                                                    context,
                                                                                  ).width,
                                                                              child: Material(
                                                                                elevation:
                                                                                    6,
                                                                                surfaceTintColor:
                                                                                    Colors.transparent,
                                                                                color:
                                                                                    Colors.transparent,
                                                                                shadowColor:
                                                                                    Colors.transparent,
                                                                                borderRadius: BorderRadius.circular(
                                                                                  5,
                                                                                ),
                                                                                child: Container(
                                                                                  clipBehavior:
                                                                                      Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    color:
                                                                                        Colors.transparent,
                                                                                    borderRadius: BorderRadius.circular(
                                                                                      5,
                                                                                    ),
                                                                                  ),
                                                                                  child: Flip(
                                                                                    controller:
                                                                                        flipController,
                                                                                    firstChild: CachedNetworkImage(
                                                                                      imageUrl:
                                                                                          astate.audios[index].imageurl,
                                                                                      fit:
                                                                                          BoxFit.cover,
                                                                                    ),
                                                                                    secondChild: SizedBox(
                                                                                      child: BlocBuilder<
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
                                                                                            onlinesongs: (
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
                                                                                                  if (snapshot.data !=
                                                                                                          null &&
                                                                                                      snapshot.hasData) {
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
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsets.symmetric(
                                                                                                                        horizontal:
                                                                                                                            5,
                                                                                                                        vertical:
                                                                                                                            0,
                                                                                                                      ),
                                                                                                                      child: Row(
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
                                                                                                                                      ) => SpotifyStyleFullScreenLyrics(
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
                                                                                                                              Navigator.of(
                                                                                                                                context,
                                                                                                                              ).push(
                                                                                                                                MaterialPageRoute(
                                                                                                                                  builder:
                                                                                                                                      (
                                                                                                                                        _,
                                                                                                                                      ) => Plainlyrics(
                                                                                                                                        audios:
                                                                                                                                            audios,
                                                                                                                                        stream:
                                                                                                                                            valueStream,
                                                                                                                                        size:
                                                                                                                                            size,
                                                                                                                                        lyrics:
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
                                                                                                                              splashColor:
                                                                                                                                  Colors.transparent,
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
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),

                                                    //title
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 10,
                                                          ),
                                                      child: SizedBox(
                                                        height: size.height / 3,
                                                        width: size.width,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                    left: 20,
                                                                    right: 10,
                                                                  ),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Textutil(
                                                                              text:
                                                                                  astate.audios[songindex].title,
                                                                              fontsize:
                                                                                  20,
                                                                              color:
                                                                                  Colors.white,
                                                                              fontWeight:
                                                                                  FontWeight.bold,
                                                                            ),
                                                                            Spaces.kheigth5,
                                                                            Textutil(
                                                                              text:
                                                                                  astate.audios[songindex].artist,
                                                                              fontsize:
                                                                                  13,
                                                                              color:
                                                                                  Colors.white,
                                                                              fontWeight:
                                                                                  FontWeight.bold,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      FavButton(
                                                                        type:
                                                                            'saavn',
                                                                        astate:
                                                                            astate,
                                                                        songindex:
                                                                            songindex,
                                                                      ),
                                                                      PlaybackSpeedDropdownSlider(
                                                                        audioPlayer:
                                                                            astate.audioPlayer,
                                                                      ),
                                                                      PlayIcons(
                                                                        playicons:
                                                                            Icons.lyrics,
                                                                        iconscolors:
                                                                            Colors.white,
                                                                        iconsize:
                                                                            26,

                                                                        ontap: () {
                                                                          flipController
                                                                              .flip();
                                                                          BlocProvider.of<
                                                                            LyricsBloc
                                                                          >(
                                                                            context,
                                                                          ).add(
                                                                            LyricsEvent.getlyrics(
                                                                              astate.audios[songindex].id,
                                                                              "${astate.audios[songindex].title} | ${astate.audios[songindex].artist.replaceAll("(", "").replaceAll(")", "")}",
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
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
                                                                    return Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child: Column(
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
                                                                                      children: [
                                                                                        Column(
                                                                                          children: [
                                                                                            Stack(
                                                                                              alignment:
                                                                                                  Alignment.center,
                                                                                              children: [
                                                                                                InteractiveBarSlider(
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
                                                                                                        7,
                                                                                                    thumbShape: RoundSliderThumbShape(
                                                                                                      disabledThumbRadius:
                                                                                                          6,
                                                                                                      enabledThumbRadius:
                                                                                                          6,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Slider(
                                                                                                    secondaryActiveColor:
                                                                                                        Colors.transparent,
                                                                                                    thumbColor: const Color.fromARGB(
                                                                                                      255,
                                                                                                      255,
                                                                                                      255,
                                                                                                      255,
                                                                                                    ),
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
                                                                                                    22,
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
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child: Column(
                                                                              children: [
                                                                                Stack(
                                                                                  alignment:
                                                                                      Alignment.center,
                                                                                  children: [
                                                                                    InteractiveBarSlider(
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
                                                                                          astate.audioPlayer,
                                                                                      postion:
                                                                                          postion,
                                                                                      duration:
                                                                                          duration,
                                                                                      trackHeight:
                                                                                          5,
                                                                                      thumshape: RoundSliderThumbShape(
                                                                                        enabledThumbRadius:
                                                                                            5,
                                                                                        disabledThumbRadius:
                                                                                            5,
                                                                                        elevation:
                                                                                            8,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(
                                                                                    horizontal:
                                                                                        23,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisAlignment:
                                                                                        MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        formatTime(
                                                                                          postion,
                                                                                        ),
                                                                                        style: const TextStyle(
                                                                                          fontSize:
                                                                                              12,
                                                                                          color:
                                                                                              Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        formatTime(
                                                                                          duration,
                                                                                        ),
                                                                                        style: const TextStyle(
                                                                                          fontSize:
                                                                                              12,
                                                                                          color:
                                                                                              Colors.white,
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

                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ValueListenableBuilder(
                                                                  valueListenable:
                                                                      Notifiers
                                                                          .isloopednotifer,
                                                                  builder: (
                                                                    context,
                                                                    bool value,
                                                                    child,
                                                                  ) {
                                                                    return PlayIcons(
                                                                      iconscolors:
                                                                          value
                                                                              ? Colors.white
                                                                              : const Color.fromARGB(
                                                                                255,
                                                                                68,
                                                                                68,
                                                                                68,
                                                                              ),
                                                                      iconsize:
                                                                          24,
                                                                      playicons:
                                                                          CupertinoIcons
                                                                              .loop_thick,
                                                                      ontap: () {
                                                                        Notifiers
                                                                            .isloopednotifer
                                                                            .value = !Notifiers.isloopednotifer.value;

                                                                        if (Notifiers
                                                                            .isloopednotifer
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
                                                                                astate.audioPlayer.hasPrevious
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
                                                                                24,
                                                                            playicons:
                                                                                Ionicons.play_back,
                                                                            ontap: () async {
                                                                              Spaces.showtoast(
                                                                                'switch back to audio streaming',
                                                                              );
                                                                            },
                                                                          ),
                                                                      orElse: () {
                                                                        return PlayIcons(
                                                                          iconscolors:
                                                                              astate.audioPlayer.hasPrevious
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
                                                                              24,
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
                                                                      playBgvideo: (
                                                                        controlleryt,
                                                                        d,
                                                                      ) {
                                                                        astate
                                                                            .audioPlayer
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
                                                                                          ? Ionicons.pause
                                                                                          : Ionicons.play,
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
                                                                                        70,
                                                                                    width:
                                                                                        70,
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
                                                                                        astate.audioPlayer.playing ==
                                                                                                true
                                                                                            ? Ionicons.pause
                                                                                            : Ionicons.play,
                                                                                    iconscolors:
                                                                                        Colors.black,
                                                                                    iconsize:
                                                                                        25,
                                                                                    ontap: () async {
                                                                                      if (astate.audioPlayer.playing ==
                                                                                          true) {
                                                                                        // _controller.stop();
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
                                                                                astate.audioPlayer.hasNext
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
                                                                                24,
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
                                                                                astate.audioPlayer.hasNext
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
                                                                                24,
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
                                                                          .isshufflednotifier,
                                                                  builder: (
                                                                    context,
                                                                    bool value,
                                                                    child,
                                                                  ) {
                                                                    return PlayIcons(
                                                                      iconscolors:
                                                                          value
                                                                              ? Colors.white
                                                                              : const Color.fromARGB(
                                                                                255,
                                                                                68,
                                                                                68,
                                                                                68,
                                                                              ),
                                                                      iconsize:
                                                                          20,
                                                                      playicons:
                                                                          CupertinoIcons
                                                                              .shuffle,
                                                                      ontap: () {
                                                                        Notifiers
                                                                            .isshufflednotifier
                                                                            .value = !Notifiers.isshufflednotifier.value;

                                                                        if (Notifiers
                                                                            .isshufflednotifier
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
                                                            BottomSection(
                                                              onqueuetap: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (
                                                                      context,
                                                                    ) {
                                                                      return Onlinequeue(
                                                                        audios:
                                                                            astate.audios,
                                                                        audioPlayer:
                                                                            astate.audioPlayer,
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                              audios:
                                                                  astate.audios,
                                                              audioPlayer:
                                                                  astate
                                                                      .audioPlayer,
                                                            ),
                                                          ],
                                                        ),
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
                                        /*  */
                                      ],
                                    ),

                                    SafeArea(
                                      child: SizedBox(
                                        height: 60,
                                        width: size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 4,
                                                  ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                  StreamBuilder(
                                                    stream: astate.valueStream,
                                                    builder: (
                                                      context,
                                                      snapshot,
                                                    ) {
                                                      if (snapshot.hasData &&
                                                          snapshot.data !=
                                                              null) {
                                                        int songindex = snapshot
                                                            .data!
                                                            .maybeMap(
                                                              orElse: () => 0,
                                                              onlinestreams: (
                                                                val,
                                                              ) {
                                                                return val
                                                                    .index;
                                                              },
                                                            );

                                                        return SizedBox(
                                                          width: size.width / 2,
                                                          child: Column(
                                                            children: [
                                                              Textutil(
                                                                text: "Playing",
                                                                fontsize: 20,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              Textutil(
                                                                text:
                                                                    "${astate.audios[songindex].title} by ${astate.audios[songindex].artist}",
                                                                fontsize: 15,
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      } else {
                                                        return const SizedBox();
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          right: 10,
                                                        ),
                                                    child: BlocBuilder<
                                                      AudioBloc,
                                                      AudioState
                                                    >(
                                                      builder: (
                                                        context,
                                                        state,
                                                      ) {
                                                        return state.maybeWhen(
                                                          orElse:
                                                              () =>
                                                                  const SizedBox(),
                                                          onlinesongs: (
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
                                                                        (
                                                                          _,
                                                                        ) => EqualizerPage(
                                                                          audioPlayer:
                                                                              audioPlayer,
                                                                        ),
                                                                  ),
                                                                );
                                                              },
                                                              icon: Image.asset(
                                                                "assets/equalizer.png",
                                                                color:
                                                                    Colors
                                                                        .white,
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              orElse: () => const SizedBox(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                Spaces.kheight20,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Blockhole extends StatelessWidget {
  const Blockhole({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
    );
  }
}

class BottomSection extends StatefulWidget {
  final List<OnlineSongModel> audios;
  final AudioPlayer audioPlayer;
  final VoidCallback onqueuetap;
  const BottomSection({
    Key? key,
    required this.audios,
    required this.audioPlayer,
    required this.onqueuetap,
  }) : super(key: key);

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  _downloadsong(List<OnlineSongModel> song, int index) async {
    final data = song[index];
    AlbumElements albumElements = AlbumElements(
      id: data.id,
      name: data.title,
      year: 'null',
      type: data.album,
      language: 'null',
      Artist: data.artist,
      url: data.downloadurl,
      image: data.imageurl,
    );
    await di.di<addtodownloadsUsecase>().call(albumElements);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<AudioBloc, AudioState>(
            builder: (context, audiostate) {
              return audiostate.maybeWhen(
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
                    builder: (context, snapshot) {
                      if (snapshot.data != null && snapshot.hasData) {
                        int songindex = snapshot.data!.maybeMap(
                          orElse: () => 0,
                          onlinestreams: (val) {
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
                                    onLongPress: () {
                                      setState(() {
                                        viewtype = !viewtype;
                                      });
                                    },
                                    onTap: () {
                                      BlocProvider.of<
                                        YoutubePlayerBackgroundBloc
                                      >(context).add(
                                        const YoutubePlayerBackgroundEvent.started(),
                                      );
                                      setState(() {});
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
                                      BlocProvider.of<
                                        YoutubePlayerBackgroundBloc
                                      >(context).add(
                                        YoutubePlayerBackgroundEvent.getinitialized(
                                          "${songs[songindex].title} by ${songs[songindex].artist} Offical Video",
                                          Notifiers.videoQualityNotifier.value,
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        const SizedBox(
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
                        int songindex = snapshot.data!.maybeMap(
                          orElse: () => 0,
                          onlinestreams: (val) {
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
                                    onLongPress: () {
                                      setState(() {
                                        viewtype = !viewtype;
                                      });
                                    },
                                    onTap: () {
                                      BlocProvider.of<
                                        YoutubePlayerBackgroundBloc
                                      >(context).add(
                                        const YoutubePlayerBackgroundEvent.started(),
                                      );
                                      setState(() {});
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
                                      BlocProvider.of<
                                        YoutubePlayerBackgroundBloc
                                      >(context).add(
                                        YoutubePlayerBackgroundEvent.getinitialized(
                                          "${audios[songindex].title} by ${audios[songindex].artist} official video",
                                          Notifiers.videoQualityNotifier.value,
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        const SizedBox(
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
                    width: 140,
                    height: 40,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                    () => BlocBuilder<AudioBloc, AudioState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          ytmusic: (
                            video,
                            index,
                            isloading,
                            isfailed,
                            valueStream,
                            songs,
                            audioPlayer,
                          ) {
                            return BlocBuilder<YtdownloadBloc, YtdownloadState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width: 140,
                                  height: 40,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        state.maybeWhen(
                                          loading:
                                              () => Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 10,
                                                ),
                                                child: SizedBox(
                                                  width: 25,
                                                  height: 25,
                                                  child:
                                                      CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                          complete:
                                              () => IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                    YtdownloadBloc
                                                  >(context).add(
                                                    YtdownloadEvent.downloadsongspotify(
                                                      songs[widget
                                                                  .audioPlayer
                                                                  .currentIndex ??
                                                              0]
                                                          .title,
                                                      songs[widget
                                                                  .audioPlayer
                                                                  .currentIndex ??
                                                              0]
                                                          .artist,
                                                      songs[widget
                                                                  .audioPlayer
                                                                  .currentIndex ??
                                                              0]
                                                          .imageurl,
                                                    ),
                                                  );
                                                },
                                                icon: Icon(
                                                  Ionicons.download,
                                                  color: Colors.white,
                                                ),
                                              ),
                                          downloading: (progress) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 25,
                                                    height: 25,
                                                    child: StreamBuilder<int>(
                                                      stream:
                                                          progress
                                                              .stream, // Your StreamController<int>
                                                      initialData: 0,
                                                      builder: (
                                                        context,
                                                        snapshot,
                                                      ) {
                                                        double value =
                                                            (snapshot.data ??
                                                                0) /
                                                            100.0;
                                                        return CircularProgressIndicator(
                                                          value: value,
                                                          backgroundColor:
                                                              Colors.grey[300],
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                Color
                                                              >(Colors.red),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  StreamBuilder<int>(
                                                    stream: progress.stream,
                                                    initialData: 0,
                                                    builder: (
                                                      context,
                                                      snapshot,
                                                    ) {
                                                      return Text(
                                                        "${snapshot.data ?? 0}%",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 8,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },

                                          orElse:
                                              () => IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                    YtdownloadBloc
                                                  >(context).add(
                                                    YtdownloadEvent.downloadsongspotify(
                                                      songs[widget
                                                                  .audioPlayer
                                                                  .currentIndex ??
                                                              0]
                                                          .title,
                                                      songs[widget
                                                                  .audioPlayer
                                                                  .currentIndex ??
                                                              0]
                                                          .artist,
                                                      songs[widget
                                                                  .audioPlayer
                                                                  .currentIndex ??
                                                              0]
                                                          .imageurl,
                                                    ),
                                                  );
                                                },
                                                icon: Icon(
                                                  Ionicons.download,
                                                  color: Colors.white,
                                                  size: 19,
                                                ),
                                              ),
                                        ),

                                        PlayIcons(
                                          playicons: Icons.queue_music,
                                          iconscolors: Colors.white,
                                          iconsize: 23,
                                          ontap: widget.onqueuetap,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          orElse:
                              () => SizedBox(
                                width: 140,
                                height: 40,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          _downloadsong(
                                            widget.audios,
                                            widget.audioPlayer.currentIndex ??
                                                0,
                                          );
                                        },
                                        icon: Icon(
                                          Ionicons.download,
                                          color: Colors.white,
                                        ),
                                      ),

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
              );
            },
          ),
        ],
      ),
    );
  }
}
