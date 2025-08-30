import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_ytmusic_api/yt_music.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:norse/features/Presentation/Blocs/ytmusic/ytmusic_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/loadingbottombar.dart';
import 'package:norse/features/Presentation/CustomWidgets/onlinemusicbottombar.dart';
import 'package:norse/features/Presentation/pages/offline/homepage.dart';
import 'package:norse/features/Presentation/pages/offline/localmodels/localmodel1.dart';
import 'package:norse/features/Presentation/pages/saavn/Aboutpage/aboutpage.dart';
import 'package:norse/features/Presentation/pages/saavn/DownloadPages/Downloadpages.dart';
import 'package:norse/features/Presentation/pages/saavn/Settings/settingspage.dart';
import 'package:norse/features/Presentation/pages/saavn/Settings/ytmusiclogin.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/home.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:norse/features/Presentation/Blocs/Connectivity_bloc/connnectivity_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../configs/constants/Spaces.dart';
import '../../../../configs/notifier/notifiers.dart';
import '../../../Data/Models/MusicModels/onlinesongmodel.dart';
import '../../Blocs/Musicbloc/Trending_Song_bloc/trending_song_bloc.dart';
import '../../Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import '../../Blocs/Musicbloc/favorite_bloc/favoriteplaylist_bloc.dart';
import '../../Blocs/Musicbloc/playlist_Bloc/playlist_bloc.dart';
import '../../Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import '../../Blocs/youtubeBloc/ytsearch_bloc/ytsearch_bloc.dart';
import '../Youtube/youtubeplayer/testytplayerscreen.dart';
import '../saavn/HomePage.dart';
import '../Youtube/onlinefavepage.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt;
import 'package:norse/injection_container.dart' as di;

bool isytplayingvisible = false;
bool isSuffled = false;

final _navigatorkey0 = GlobalKey();
final navigatorkey1 = GlobalKey();
final navigatorkey2 = GlobalKey();
final ytnavigator0 = GlobalKey();
final ytchannelnav0 = GlobalKey();

Future<String?> checkplatform() async {
  String? fetchedValue = await MusicPreference.getPlatform();
  if (fetchedValue != null) {
    fetchedValue == 'Saavn'
        ? Notifiers.launchdataprovidernotifiers.value = 0
        : Notifiers.launchdataprovidernotifiers.value = 1;
    return fetchedValue;
  } else {
    await MusicPreference.savePlatform("Saavn");
    return "Saavn";
  }
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MainHomePage extends StatefulWidget {
  static const String mainHomePAge = '/mainhomepage';
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late PageController pageController;

  _getrequiredhomedata() async {
    developer.log('Herre not wokring');
    final header = await getYtMusicHeaders();

    final headers = {
      "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0",
      "Accept": "*/*",
      "Accept-Language": "en-US,en;q=0.5",
      "Content-Type": "application/json",
      "X-Goog-AuthUser": "0",
      "x-origin": "https://music.youtube.com",
      "Cookie": header['cookie'],
      "x-goog-visitor-id": header['x-goog-visitor-id'],
      "x-goog-authuser": "0",
      "authorization": header['authorization'],
      "referer": "https://music.youtube.com/",
    };

    final url = Uri.parse("http://192.168.18.253:8000/gather");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(headers),
    );

    if (response.statusCode == 200) {
      final overalldata = jsonDecode(response.body);

      // Map userinfo = overalldata['userinfo'];
      // List userhistory0 = overalldata['history'];
      //  List playlists0 = overalldata['likeds'];
      //  List allongs0 = overalldata['libsongs'];
      List moods0 = overalldata['moods']['Moods & moments'];
      developer.log(overalldata.toString());
      List genres0 = overalldata['moods']['Genres'];
      // List artist0 = overalldata['artists'];
      //  List subscription0 = overalldata['subscription'];

      // allsongs = userhistory0;
      //  userplaylist = playlists0;
      moods = moods0;
      genres = genres0;

      // artists = artist0;
      // subscriptions = subscription0;

      setState(() {});
    } else {
      developer.log('failed respos epo f jb');
    }
  }

  _checkheaders() async {
    final header = await getYtMusicHeaders();
    if (header['cookie'] != 'null') {
      await _getrequiredhomedata();
    }
  }

  int currentindex = 0;

  List<Widget> pages = [
    Navigator(
      key: _navigatorkey0,
      onGenerateRoute:
          (settings) => MaterialPageRoute(
            settings: settings,
            builder: (_) => const HomePage(),
          ),
    ),
    Navigator(
      key: navigatorkey1,
      onGenerateRoute:
          (settings) => MaterialPageRoute(
            settings: settings,
            builder: (_) => const OfflineMusic(),
          ),
    ),
    Navigator(
      key: navigatorkey2,
      onGenerateRoute:
          (settings) => MaterialPageRoute(
            settings: settings,
            builder: (_) => const Onlinefavscreen(),
          ),
    ),

    Downloadpage(),
  ];

  void call() async {
    _checkheaders();
    await checkplatform();

    final yt = di.di<YTMusic>();

    await yt.initialize().then((r) {
      if (mounted) {
        BlocProvider.of<YtmusicBloc>(
          context,
        ).add(YtmusicEvent.getinitiallaunch());
      }
    });

    BlocProvider.of<YtsearchBloc>(context).add(const YtsearchEvent.freestate());
    BlocProvider.of<PlaylistBloc>(
      context,
    ).add(const PlaylistEvent.getallplaylist());

    BlocProvider.of<FavoriteplaylistBloc>(
      context,
    ).add(const FavoriteplaylistEvent.getallsongs());

    BlocProvider.of<TrendingSongBloc>(
      context,
    ).add(const TrendingSongs(mode: 'initial'));
  }

  @override
  void initState() {
    super.initState();
    call();
    pageController = PageController(
      initialPage: currentindex,
      viewportFraction: 1,
    );
  }

  final List<IconData> _icons = [
    Ionicons.home,
    Icons.folder,
    Icons.my_library_music_outlined,
    Ionicons.download,
  ];

  final List<String> _labels = ['Home', "My Music", 'Library', "Downloads"];

  void _onItemTapped(int index) async {
    Notifiers.pagenotifer.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Spaces.backgroundColor,
          key: scaffoldKey,
          bottomNavigationBar: ValueListenableBuilder(
            valueListenable: Notifiers.pagenotifer,
            builder: (context, value, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: Stack(
                  children: [
                    // Gradient background container behind navbar
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 70, // Match your BottomNavigationBar height
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.3),
                                Colors.black.withValues(alpha: 0.9),
                                Colors.black,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Actual BottomNavigationBar
                    ValueListenableBuilder(
                      valueListenable: Notifiers.pagenotifer,
                      builder: (context, value, child) {
                        return BottomNavigationBar(
                          useLegacyColorScheme: false,
                          showUnselectedLabels: true,
                          currentIndex: value,
                          onTap: _onItemTapped,
                          selectedLabelStyle: Spaces.Getstyle(
                            12,
                            Colors.white,
                            FontWeight.bold,
                          ),
                          backgroundColor: Colors.transparent,
                          selectedItemColor: Colors.white,
                          unselectedItemColor: Colors.grey.withValues(
                            alpha: 0.7,
                          ),
                          type: BottomNavigationBarType.fixed,
                          items: List.generate(_icons.length, (index) {
                            return BottomNavigationBarItem(
                              icon: Icon(_icons[index], size: 17),
                              label: _labels[index],
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          drawer: buildModernDrawer(context, closeDrawer),
          body: BlocBuilder<ConnnectivityBloc, ConnnectivityState>(
            builder: (context, state) {
              return state.maybeWhen(
                networkstate: (isavailable) {
                  return Stack(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: Notifiers.pagenotifer,
                        builder: (context, value, child) {
                          return pages[value];
                        },
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SafeArea(child: BottomMusicBar()),
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SafeArea(
                          child: BlocBuilder<
                            YoutubeplayerBloc,
                            YoutubeplayerState
                          >(
                            builder: (context, state) {
                              Size size = MediaQuery.sizeOf(context);

                              return state.maybeWhen(
                                orElse: () => const SizedBox.shrink(),
                                youtubeplayerstate:
                                    (
                                      info,
                                      index,
                                      video,
                                      loading,
                                      failed,
                                      controller,
                                      streams,
                                    ) => ValueListenableBuilder(
                                      valueListenable: Notifiers.showplayer,
                                      builder: (context, value, child) {
                                        return Offstage(
                                          offstage: value,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageAnimationTransition(
                                                  page: Testytplayer(
                                                    video: video,
                                                    index: index,
                                                    height: 0,
                                                    persentage: 0,
                                                    context: context,
                                                  ),
                                                  pageAnimationType:
                                                      FadeAnimationTransition(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                              ),
                                              height: 70,
                                              width: size.width,
                                              child:
                                                  loading
                                                      ? Row(
                                                        spacing: 10,
                                                        children: [
                                                          SizedBox(
                                                            height: 70,
                                                            width: 100,
                                                            child: Video(
                                                              controller:
                                                                  controller,
                                                              fit:
                                                                  BoxFit
                                                                      .fitWidth,
                                                            ),
                                                          ),
                                                          Column(
                                                            spacing: 3,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Customshimmer(
                                                                height: 11,
                                                                width: 200,
                                                                radius: 20,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Customshimmer(
                                                                height: 8,
                                                                width: 100,
                                                                radius: 20,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                      : Column(
                                                        children: [
                                                          Row(
                                                            spacing: 10,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                height: 70,
                                                                width: 100,
                                                                child: Video(
                                                                  controller:
                                                                      controller,
                                                                  fit:
                                                                      BoxFit
                                                                          .fitWidth,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  spacing: 5,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Textutil(
                                                                      text:
                                                                          (info['video']
                                                                                  as yt.Video)
                                                                              .title,
                                                                      fontsize:
                                                                          15,
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                    Textutil(
                                                                      text:
                                                                          (info['video']
                                                                                  as yt.Video)
                                                                              .author,
                                                                      fontsize:
                                                                          11,
                                                                      color:
                                                                          Colors
                                                                              .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                child: IconButton(
                                                                  onPressed: () async {
                                                                    if (controller
                                                                        .player
                                                                        .state
                                                                        .playing) {
                                                                      await controller
                                                                          .player
                                                                          .pause();
                                                                    } else {
                                                                      await controller
                                                                          .player
                                                                          .play();
                                                                    }
                                                                    setState(
                                                                      () {},
                                                                    );
                                                                  },
                                                                  icon: Icon(
                                                                    controller
                                                                            .player
                                                                            .state
                                                                            .playing
                                                                        ? Ionicons
                                                                            .pause
                                                                        : Ionicons
                                                                            .play,
                                                                    color:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
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
                        ),
                      ),
                      !isavailable
                          ? ValueListenableBuilder(
                            valueListenable: Notifiers.pagenotifer,
                            builder: (context, value, child) {
                              return value != 1
                                  ? Padding(
                                    padding: const EdgeInsets.only(top: 100),
                                    child: NetworKerrorwidget(
                                      size: MediaQuery.sizeOf(context),
                                      color: Colors.transparent,
                                    ),
                                  )
                                  : SizedBox();
                            },
                          )
                          : const SizedBox(),
                    ],
                  );
                },
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class NewDraweritems extends StatelessWidget {
  const NewDraweritems({
    super.key,
    required this.callback,
    required this.title,
  });
  final VoidCallback callback;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: ListTile(
        leading: Image.asset(
          'assets/yt.png',
          scale: 24,
          filterQuality: FilterQuality.low,
        ),
        title: Text(
          title,
          style: GoogleFonts.aldrich(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}

class NetworKerrorwidget extends StatelessWidget {
  const NetworKerrorwidget({
    super.key,
    required this.size,
    required this.color,
  });

  final Color color;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: color,
      child: Center(
        child: Stack(
          children: [
            // Blurred glass container
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: size.height / 2.8,
                  width: size.width / 1.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.1),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 25,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon or image
                        Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.15),
                          ),
                          child: Image.asset('assets/no-wifi.png'),
                        ),
                        const SizedBox(height: 20),
                        const Textutil(
                          text: 'Whoops!',
                          fontsize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 10),
                        Textutil(
                          text: 'No internet connection found',
                          fontsize: 14,
                          color: Colors.white.withOpacity(0.75),
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 4),
                        Textutil(
                          text: 'Please check your connection and try again.',
                          fontsize: 13,
                          color: Colors.white.withOpacity(0.65),
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Draweritems extends StatelessWidget {
  final VoidCallback ontap;
  final String title;
  final IconData iconsdata;
  const Draweritems({
    super.key,
    required this.ontap,
    required this.title,
    required this.iconsdata,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: Icon(iconsdata, color: Colors.white, size: 21),
        title: Text(
          title,
          style: GoogleFonts.aldrich(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}

class BottomMusicBar extends StatefulWidget {
  const BottomMusicBar({super.key});

  @override
  State<BottomMusicBar> createState() => _BottomMusicBarState();
}

class _BottomMusicBarState extends State<BottomMusicBar>
    with TickerProviderStateMixin {
  void changeduration(int sceconds, AudioPlayer player) {
    Duration duration = Duration(seconds: sceconds);
    player.seek(duration);
  }

  late Animation<double> fadeanimation;
  late AnimationController fadeanimationcontroller;

  bool get() {
    try {
      fadeanimationcontroller;
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    fadeanimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
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
  void dispose() {
    fadeanimationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: (imageurl, title, subtitle) {
            return Loadingbottombar(
              title: title,
              imag: imageurl,
              subtitle: subtitle,
            );
          },
          ytmusic: (
            video,
            index,
            isloading,
            isfailed,
            valueStream,
            songs,
            audioplayer,
          ) {
            return Onlinemusicbottombar(
              index: index,
              isloading: isloading,
              valueStream: valueStream,
              audioPlayer: audioPlayer,
              audios: songs,
            );
          },
          Localsongs: (
            isloading,
            isfailed,
            audios,
            valueStream,
            index,
            audioPlayer,
          ) {
            return FadeTransition(
              opacity: fadeanimation,
              child: StreamBuilder(
                stream: valueStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    PlayerState player = PlayerState(
                      true,
                      ProcessingState.loading,
                    );

                    PlayerState playerState = snapshot.data!.maybeMap(
                      orElse: () => player,
                      LocalStreams: (value) => value.playerState,
                    );

                    int songindex = snapshot.data!.maybeMap(
                      orElse: () => 0,
                      LocalStreams: (value) => value.index,
                    );

                    final song = audios[songindex];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageAnimationTransition(
                            page: LocalModel1(
                              index: songindex,
                              initialpath:
                                  song.title.contains(".")
                                      ? song.title.split(".")[0]
                                      : song.title,
                            ),
                            pageAnimationType: FadeAnimationTransition(),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 70,

                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            BlocBuilder<
                              YoutubePlayerBackgroundBloc,
                              YoutubePlayerBackgroundState
                            >(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  playBgvideo: (controller, streams) {
                                    audioPlayer.pause();
                                    return Video(
                                      fit: BoxFit.cover,
                                      controls: (_) => const SizedBox(),
                                      controller: controller,
                                    );
                                  },
                                  orElse:
                                      () => Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          QueryArtworkWidget(
                                            id: song.id,
                                            artworkQuality: FilterQuality.low,
                                            type: ArtworkType.AUDIO,
                                            size: 400,
                                            artworkBorder: BorderRadius.zero,
                                            artworkBlendMode: BlendMode.plus,
                                            artworkClipBehavior: Clip.antiAlias,
                                            keepOldArtwork: true,
                                            format: ArtworkFormat.JPEG,
                                            nullArtworkWidget: Shimmer(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Colors.grey,
                                                  Colors.white,
                                                ],
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey.shade800,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.black.withValues(
                                              alpha: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                );
                              },
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Row(
                                children: [
                                  QueryArtworkWidget(
                                    artworkWidth: 48,
                                    artworkHeight: 48,
                                    id: song.id,
                                    artworkQuality: FilterQuality.high,
                                    type: ArtworkType.AUDIO,
                                    artworkBorder: BorderRadius.zero,
                                    artworkBlendMode: BlendMode.plus,
                                    artworkClipBehavior: Clip.antiAlias,
                                    keepOldArtwork: true,
                                    format: ArtworkFormat.JPEG,
                                    nullArtworkWidget: Shimmer(
                                      gradient: const LinearGradient(
                                        colors: [Colors.grey, Colors.white],
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Textutil(
                                          text: song.title.split(".")[0],
                                          fontsize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        const SizedBox(height: 4),
                                        Textutil(
                                          text: song.subtitle,
                                          fontsize: 12,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  BlocBuilder<
                                    YoutubePlayerBackgroundBloc,
                                    YoutubePlayerBackgroundState
                                  >(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        playBgvideo: (controller, streams) {
                                          audioPlayer.pause();
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              right: 12,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Ionicons.play_back,
                                                  size: 22,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 10),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller
                                                            .player
                                                            .state
                                                            .playing
                                                        ? controller.player
                                                            .pause()
                                                        : controller.player
                                                            .play();
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 44,
                                                    width: 44,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            22,
                                                          ),
                                                      color: Colors.white,
                                                    ),
                                                    child: Icon(
                                                      controller
                                                              .player
                                                              .state
                                                              .playing
                                                          ? CupertinoIcons.pause
                                                          : CupertinoIcons
                                                              .play_arrow,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Icon(
                                                  Ionicons.play_forward,
                                                  size: 22,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        orElse:
                                            () => Padding(
                                              padding: const EdgeInsets.only(
                                                right: 8,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        const BoxConstraints(),
                                                    onPressed: () {
                                                      BlocProvider.of<
                                                        AudioBloc
                                                      >(context).add(
                                                        const AudioEvent.SeekPreviousAudio(),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Ionicons.play_back,
                                                      color:
                                                          audioPlayer
                                                                  .hasPrevious
                                                              ? Colors.white
                                                              : Colors.grey,
                                                      size: 18,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      playerState.playing
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
                                                    child: Container(
                                                      height: 44,
                                                      width: 44,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              22,
                                                            ),
                                                        color: Colors.white,
                                                      ),
                                                      child: Icon(
                                                        playerState.playing
                                                            ? CupertinoIcons
                                                                .pause
                                                            : CupertinoIcons
                                                                .play_arrow,
                                                        color: Colors.black,
                                                        size: 22,
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        const BoxConstraints(),
                                                    onPressed: () {
                                                      BlocProvider.of<
                                                        AudioBloc
                                                      >(context).add(
                                                        const AudioEvent.seeknextaudio(),
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Ionicons.play_forward,
                                                      color:
                                                          audioPlayer.hasNext
                                                              ? Colors.white
                                                              : Colors.grey,
                                                      size: 18,
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
                    );
                  } else {
                    return const SizedBox(height: 70);
                  }
                },
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
            return Onlinemusicbottombar(
              index: index,
              isloading: isloading,
              valueStream: valueStream,
              audioPlayer: audioPlayer,
              audios: audios,
            );
          },

          orElse: () {
            return const SizedBox(height: 70);
          },
        );
      },
    );
  }
}

class Loadingcustomgradient extends StatefulWidget {
  const Loadingcustomgradient({super.key});

  @override
  State<Loadingcustomgradient> createState() => _LoadingcustomgradientState();
}

class _LoadingcustomgradientState extends State<Loadingcustomgradient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 150,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 81, 81, 81),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class MusicbottombarWidget extends StatefulWidget {
  const MusicbottombarWidget({
    super.key,
    required this.songindex,
    required this.type,
    required this.ontap,
    required this.audios,
    required this.audioPlayer,
    required this.playerState,
    required this.pos,
    required this.dur,
    required this.onchange,
  });

  final int songindex;
  final String type;
  final VoidCallback ontap;
  final List<OnlineSongModel> audios;
  final AudioPlayer audioPlayer;
  final PlayerState playerState;
  final double pos;
  final double dur;
  final ValueChanged<double> onchange;

  @override
  State<MusicbottombarWidget> createState() => _MusicbottombarWidgetState();
}

class _MusicbottombarWidgetState extends State<MusicbottombarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      YoutubePlayerBackgroundBloc,
      YoutubePlayerBackgroundState
    >(
      builder: (context, state) {
        return state.maybeWhen(
          playBgvideo: (controller, streams) {
            return GestureDetector(
              onTap: widget.ontap,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                height: 70,

                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Video(
                              controller: controller,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: MediaQuery.sizeOf(context).width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Image.network(
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/musical-note.png',
                                        color: Colors.black.withValues(
                                          alpha: 0.6,
                                        ),
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
                                      height: 20,
                                      width: 150,
                                      child: Textutil(
                                        text:
                                            widget
                                                .audios[widget.songindex]
                                                .title,
                                        fontsize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spaces.kheigth5,
                                    SizedBox(
                                      height: 20,
                                      width: 100,
                                      child: Textutil(
                                        text:
                                            widget
                                                .audios[widget.songindex]
                                                .artist,
                                        fontsize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Spaces.showtoast(
                                            'Switch back to audio streaming',
                                          );
                                        },
                                        icon: Icon(
                                          CupertinoIcons.backward_end_fill,
                                          color:
                                              widget.audioPlayer.hasPrevious
                                                  ? Colors.white
                                                  : Colors.grey,
                                          size: 15,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (controller.player.state.playing) {
                                            await controller.player.pause();
                                          } else {
                                            await controller.player.play();
                                          }
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Icon(
                                            controller.player.state.playing ==
                                                    true
                                                ? CupertinoIcons.pause
                                                : CupertinoIcons.play_arrow,
                                            color: Colors.black,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Spaces.showtoast(
                                            'Switch back to audio streaming',
                                          );
                                        },
                                        icon: Icon(
                                          CupertinoIcons.forward_end_fill,
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
          },
          orElse:
              () => GestureDetector(
                onTap: widget.ontap,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.audios[widget.songindex].imageurl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: Colors.black.withValues(alpha: 0.7),
                            ),
                            SizedBox(
                              height: 60,
                              width: MediaQuery.sizeOf(context).width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(),
                                    child: Image.network(
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Image.asset(
                                          'assets/musical-note.png',
                                          color: Colors.black.withValues(
                                            alpha: 0.6,
                                          ),
                                        );
                                      },
                                      widget.audios[widget.songindex].imageurl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 150,
                                        child: Textutil(
                                          text:
                                              widget
                                                  .audios[widget.songindex]
                                                  .title,
                                          fontsize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spaces.kheigth5,
                                      SizedBox(
                                        height: 20,
                                        width: 100,
                                        child: Textutil(
                                          text:
                                              widget
                                                  .audios[widget.songindex]
                                                  .artist,
                                          fontsize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                            CupertinoIcons.backward_end_fill,
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
                                                ).add(
                                                  const AudioEvent.resume(),
                                                );
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.white,
                                            ),
                                            child: Icon(
                                              widget.playerState.playing == true
                                                  ? CupertinoIcons.pause
                                                  : CupertinoIcons.play_arrow,
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
                                            CupertinoIcons.forward_end_fill,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        );
      },
    );
  }
}

Drawer buildModernDrawer(BuildContext context, VoidCallback closeDrawer) {
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.45,
    backgroundColor: Colors.black,
    child: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset("assets/icon.png", scale: 15),
              ),
              const SizedBox(height: 6),
              const Textutil(
                text: 'NorSe',
                fontsize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 2),
              const Textutil(
                text: Spaces.version,
                fontsize: 11,
                color: Colors.white38,
                fontWeight: FontWeight.w400,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textutil(
                    text: 'Built with ',
                    fontsize: 13,
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                  ),
                  Icon(Icons.favorite, size: 12, color: Colors.redAccent),
                  Textutil(
                    text: ' by Adarsh N S',
                    fontsize: 13,
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),
          const Divider(color: Colors.white10),

          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                _drawerItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  onTap: () {
                    closeDrawer();
                  },
                ),
                _drawerItem(
                  icon: Icons.download_rounded,
                  label: 'Downloads',
                  onTap: () {
                    Notifiers.pagenotifer.value = 3;
                  },
                ),

                _drawerItem(
                  icon: Icons.my_library_music_outlined,
                  label: 'Library',
                  onTap: () {
                    Notifiers.pagenotifer.value = 2;
                  },
                ),
                _drawerItem(
                  icon: Icons.folder,
                  label: 'My Music',
                  onTap: () {
                    Notifiers.pagenotifer.value = 1;
                  },
                ),
                _drawerItem(
                  icon: Icons.settings_rounded,
                  label: 'Settings',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Settingpage()),
                    );
                  },
                ),
                _drawerItem(
                  icon: Icons.info_outline_rounded,
                  label: 'About',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Aboutpage()),
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
}

Widget _drawerItem({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.white12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Textutil(
                text: label,
                fontsize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
