// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:norse/configs/musicnames.dart';
import 'package:norse/features/Presentation/pages/Youtube/ytsearchpage/ytsearchpage.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/home.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Data/Models/MusicModels/usermodel.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/playerui_bloc/playerui_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytrelatedvideos_bloc/ytrelatedvideos_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytsearch_bloc/ytsearch_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/shimmer.dart';
import 'package:norse/features/Presentation/pages/Youtube/youtubeplayer/testytplayerscreen.dart';
import '../../../../configs/notifier/notifiers.dart';
import '../../Blocs/Musicbloc/Trending_Song_bloc/trending_song_bloc.dart';
import '../../Blocs/Musicbloc/User_bloc/user_bloc_bloc.dart';
import '../../Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import '../../Blocs/Musicbloc/playlist_Bloc/playlist_bloc.dart';
import '../../Blocs/Musicbloc/recents_bloc/recents_bloc.dart';
import '../../CustomWidgets/CustomTextFormField.dart';
import '../MainHomePage/MainHomePage.dart';
import 'subscreens/SearchResultPage/SearchResultPage.dart';
import 'subscreens/SongDetailsPage/SongDetailsPage.dart';

void openDrawer() {
  scaffoldKey.currentState!.openDrawer();
}

void closeDrawer() {
  scaffoldKey.currentState!.closeDrawer();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _scrollController.dispose();
  }

  call1() async {
    BlocProvider.of<PlaylistBloc>(
      context,
    ).add(const PlaylistEvent.getallplaylist());
    BlocProvider.of<TrendingSongBloc>(
      context,
    ).add(const TrendingSongs(mode: 'refresh'));
  }

  @override
  void initState() {
    BlocProvider.of<PlayeruiBloc>(context).add(const PlayeruiEvent.initialui());
    BlocProvider.of<UserBlocBloc>(
      context,
    ).add(const UserBlocEvent.getuserdetails());
    super.initState();
    BlocProvider.of<RecentsBloc>(
      context,
    ).add(const RecentsEvent.getallrecent());
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return call1();
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                openDrawer();
                              },
                              child: SizedBox(
                                height: 40,
                                width: 48,
                                child: Image.asset(
                                  'assets/list.png',
                                  color: Colors.white,
                                  scale: 23,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  String url =
                                      'https://www.buymeacoffee.com/adarshadarz';

                                  await launchUrl(Uri.parse(url));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10,
                                      sigmaY: 10,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(
                                          alpha: 0.05,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.white10,
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(
                                              alpha: 0.4,
                                            ),
                                            blurRadius: 12,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white.withValues(
                                                alpha: 0.1,
                                              ),
                                              border: Border.all(
                                                color: Colors.white12,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.volunteer_activism_rounded,
                                              color: Colors.pinkAccent,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(width: 14),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Support the project',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white70,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.4,
                                                ),
                                              ),
                                              Text(
                                                'Donate',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ],
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
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Userspace(
                              size: size,
                              controller: controller,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 1,
                              ),
                              child: Row(
                                children: [
                                  /// 🔍 Search Songs
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageAnimationTransition(
                                            page: SearchResultscreen(
                                              querydata: '',
                                            ),
                                            pageAnimationType:
                                                FadeAnimationTransition(),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: "search",
                                        child: Container(
                                          height: 52,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF5F5F7),
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withValues(
                                                  alpha: 0.04,
                                                ),
                                                blurRadius: 8,
                                                offset: const Offset(2, 3),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                CupertinoIcons.search,
                                                color: Color(0xFF666666),
                                                size: 20,
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  "Explore songs, albums & artists",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                      0xFF666666,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  /// 📺 YouTube Button
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageAnimationTransition(
                                          page: Ytsearchpage(),
                                          pageAnimationType:
                                              FadeAnimationTransition(),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: "ytsearch",
                                      child: Container(
                                        height: 52,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 18,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFFF3D00),
                                              Color(0xFFD50000),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                255,
                                                86,
                                                86,
                                                86,
                                              ).withValues(alpha: 0.3),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child:const Row(
                                          children: [
                                            Icon(
                                              Ionicons.logo_youtube,
                                              color: const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ValueListenableBuilder(
                              valueListenable:
                                  Notifiers.launchdataprovidernotifiers,
                              builder: (context, value, child) {
                                if (value == 0) {
                                  return Column(
                                    children: [
                                      Spaces.kheigth5,
                                      Lastsession(size: size),
                                      Spaces.kheigth5,
                                     const redTitleWidget(
                                        one: "Trending ",
                                        two: "Now",
                                      ),
                                      BlocBuilder<
                                        TrendingSongBloc,
                                        TrendingSongState
                                      >(
                                        builder: (context, state) {
                                          if (state is Songstate) {
                                            return TrendingSongsWidget(
                                              details: state.trendingnow,
                                              size: size,
                                            );
                                          } else if (state
                                              is TrendingSongLoading) {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          } else {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          }
                                        },
                                      ),
                                      redTitleWidget(
                                        one: "Top ",
                                        two: "Charts",
                                      ),
                                      Spaces.kheight10,
                                      BlocBuilder<
                                        TrendingSongBloc,
                                        TrendingSongState
                                      >(
                                        builder: (context, state) {
                                          if (state is Songstate) {
                                            return Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(
                                                      context,
                                                    ).height /
                                                    4,
                                                width: size.width,
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      state.charts.length,
                                                  itemBuilder: (
                                                    context,
                                                    index,
                                                  ) {
                                                    final charts =
                                                        state.charts[index];
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) {
                                                              return SongDetailsPage(
                                                                type:
                                                                    charts.type,
                                                                imageurl:
                                                                    charts
                                                                        .image,
                                                                albumurl:
                                                                    charts
                                                                        .playlisturl,
                                                                name:
                                                                    charts
                                                                        .title,
                                                                id: charts.id,
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              right: 20,
                                                            ),
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                clipBehavior:
                                                                    Clip.antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            0,
                                                                          ),
                                                                    ),
                                                                child: CachedNetworkImage(
                                                                  imageUrl: charts
                                                                      .image
                                                                      .replaceAll(
                                                                        '150x150',
                                                                        '500x500',
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Spaces.kheight10,
                                                            Textutil(
                                                              text:
                                                                  charts.title,
                                                              fontsize: 12,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                            Spaces.kheight10,
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          } else if (state
                                              is TrendingSongLoading) {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          } else {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          }
                                        },
                                      ),
                                      redTitleWidget(
                                        one: 'Hot ',
                                        two: "Tracks",
                                      ),
                                      BlocBuilder<YtsearchBloc, YtsearchState>(
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                            fres: (
                                              videos,
                                              vidoes1,
                                              videos2,
                                              videos3,
                                              isloading,
                                              isfailed,
                                            ) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Spaces.kheight10,
                                                  CarouselSlider(
                                                    options: CarouselOptions(
                                                      pauseAutoPlayOnTouch:
                                                          true,
                                                      initialPage: Random()
                                                          .nextInt(
                                                            videos.length,
                                                          ),
                                                      height: 300.0,
                                                      viewportFraction: 1,
                                                      autoPlayInterval:
                                                          const Duration(
                                                            seconds: 10,
                                                          ),
                                                      autoPlay: true,
                                                    ),
                                                    items: Spaces().getList(videos.length, (
                                                      index,
                                                    ) {
                                                      Video vid = videos[index];
                                                      return GestureDetector(
                                                        onTap: () {
                                                          Notifiers
                                                              .showplayer
                                                              .value = false;
                                                          BlocProvider.of<
                                                            YtrelatedvideosBloc
                                                          >(context).add(
                                                            YtrelatedvideosEvent.relatedvideos(
                                                              videos[index].id
                                                                  .toString(),
                                                            ),
                                                          );
                                                          BlocProvider.of<
                                                            YoutubeplayerBloc
                                                          >(context).add(
                                                            YoutubeplayerEvent.ytplayerevent(
                                                              videos,
                                                              index,
                                                            ),
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                right: 10,
                                                                left: 10,
                                                              ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 220,
                                                                width:
                                                                    MediaQuery.sizeOf(
                                                                      context,
                                                                    ).width,
                                                                clipBehavior:
                                                                    Clip.antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            5,
                                                                          ),
                                                                    ),
                                                                child: Cachednetimagewidget(
                                                                  thumbnailSet:
                                                                      vid.thumbnails,
                                                                ),
                                                              ),
                                                              Spaces.kheight10,
                                                              Textutil(
                                                                text: vid.title,
                                                                fontsize: 15,
                                                                color:
                                                                    Spaces
                                                                        .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Textutil(
                                                                    text:
                                                                        "${vid.author}  •",
                                                                    fontsize:
                                                                        10,
                                                                    color:
                                                                        Spaces
                                                                            .textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textutil(
                                                                    text: timeago
                                                                        .format(
                                                                          vid.uploadDate!,
                                                                        ),
                                                                    fontsize:
                                                                        10,
                                                                    color:
                                                                        Spaces
                                                                            .textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ],
                                                              ),
                                                              const Textutil(
                                                                text: '',
                                                                fontsize: 10,
                                                                color:
                                                                    Spaces
                                                                        .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              );
                                            },
                                            loader: () => const LoadingHomeyt(),
                                            orElse: () => SizedBox(),
                                          );
                                        },
                                      ),

                                      redTitleWidget(
                                        one: "Top ",
                                        two: "Playlists",
                                      ),
                                      Spaces.kheight10,
                                      BlocBuilder<
                                        TrendingSongBloc,
                                        TrendingSongState
                                      >(
                                        builder: (context, state) {
                                          if (state is Songstate) {
                                            return SizedBox(
                                              height:
                                                  MediaQuery.sizeOf(
                                                    context,
                                                  ).height /
                                                  4,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    state.newlyreleased.length,
                                                itemBuilder: (context, index) {
                                                  final results =
                                                      state
                                                          .newlyreleased[index];
                                                  return Column(
                                                    children: [
                                                      TrendingImageWidgets(
                                                        size: size,
                                                        results: results,
                                                        index: index,
                                                      ),
                                                      Text(
                                                        state
                                                            .newlyreleased[index]
                                                            .suntitle,
                                                        style: Spaces.Getstyle(
                                                          8,
                                                          Colors.white,
                                                          FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            );
                                          } else if (state
                                              is TrendingSongLoading) {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          } else {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          }
                                        },
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Textutil(
                                              text: 'K',
                                              fontsize: 20,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            Textutil(
                                              text: 'POP',
                                              fontsize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ),
                                      BlocBuilder<YtsearchBloc, YtsearchState>(
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                            loader: () => const LoadingHomeyt(),
                                            orElse: () => SizedBox(),
                                            fres: (
                                              videos,
                                              vidoes1,
                                              videos2,
                                              videos3,
                                              isloading,
                                              isfailed,
                                            ) {
                                              return Column(
                                                children: [
                                                  Spaces.kheight10,

                                                  CarouselSlider(
                                                    options: CarouselOptions(
                                                      pauseAutoPlayOnTouch:
                                                          true,
                                                      initialPage: Random()
                                                          .nextInt(
                                                            videos2.length,
                                                          ),
                                                      height: 300.0,
                                                      viewportFraction: 1,
                                                      autoPlayInterval:
                                                          const Duration(
                                                            seconds: 10,
                                                          ),
                                                      autoPlay: true,
                                                    ),
                                                    items: Spaces().getList(videos2.length, (
                                                      index,
                                                    ) {
                                                      Video vid =
                                                          videos2[index];
                                                      return GestureDetector(
                                                        onTap: () {
                                                          Notifiers
                                                              .showplayer
                                                              .value = false;
                                                          BlocProvider.of<
                                                            YtrelatedvideosBloc
                                                          >(context).add(
                                                            YtrelatedvideosEvent.relatedvideos(
                                                              videos2[index].id
                                                                  .toString(),
                                                            ),
                                                          );
                                                          BlocProvider.of<
                                                            YoutubeplayerBloc
                                                          >(context).add(
                                                            YoutubeplayerEvent.ytplayerevent(
                                                              videos2,
                                                              index,
                                                            ),
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                right: 10,
                                                                left: 10,
                                                              ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 220,
                                                                width:
                                                                    MediaQuery.sizeOf(
                                                                      context,
                                                                    ).width,
                                                                clipBehavior:
                                                                    Clip.antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            5,
                                                                          ),
                                                                    ),
                                                                child: Cachednetimagewidget(
                                                                  thumbnailSet:
                                                                      vid.thumbnails,
                                                                ),
                                                              ),
                                                              Spaces.kheight10,
                                                              Textutil(
                                                                text: vid.title,
                                                                fontsize: 15,
                                                                color:
                                                                    Spaces
                                                                        .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Textutil(
                                                                    text:
                                                                        "${vid.author}  •",
                                                                    fontsize:
                                                                        10,
                                                                    color:
                                                                        Spaces
                                                                            .textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textutil(
                                                                    text: timeago
                                                                        .format(
                                                                          vid.uploadDate!,
                                                                        ),
                                                                    fontsize:
                                                                        10,
                                                                    color:
                                                                        Spaces
                                                                            .textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ],
                                                              ),
                                                              const Textutil(
                                                                text: '',
                                                                fontsize: 10,
                                                                color:
                                                                    Spaces
                                                                        .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                              Spaces.kheight20,
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      redTitleWidget(
                                        one: "Top ",
                                        two: "Albums",
                                      ),
                                      BlocBuilder<
                                        TrendingSongBloc,
                                        TrendingSongState
                                      >(
                                        builder: (context, state) {
                                          if (state is Songstate) {
                                            return TrendingSongsWidget(
                                              details: state.topalbums,
                                              size: size,
                                            );
                                          } else if (state
                                              is TrendingSongLoading) {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          } else {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          }
                                        },
                                      ),
                                      redTitleWidget(one: 'Anime ', two: "OP"),
                                      BlocBuilder<YtsearchBloc, YtsearchState>(
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                            loader: () => LoadingHomeyt(),
                                            orElse: () => SizedBox(),
                                            fres: (
                                              videos,
                                              vidoes1,
                                              videos2,
                                              videos3,
                                              isloading,
                                              isfailed,
                                            ) {
                                              return Column(
                                                children: [
                                                  Spaces.kheight10,
                                                  CarouselSlider(
                                                    options: CarouselOptions(
                                                      initialPage: Random()
                                                          .nextInt(
                                                            videos3.length,
                                                          ),
                                                      pauseAutoPlayOnTouch:
                                                          true,
                                                      height: 300.0,
                                                      viewportFraction: 1,
                                                      autoPlayInterval:
                                                          const Duration(
                                                            seconds: 10,
                                                          ),
                                                      autoPlay: true,
                                                    ),
                                                    items: Spaces().getList(videos3.length, (
                                                      index,
                                                    ) {
                                                      Video vid =
                                                          videos3[index];
                                                      return GestureDetector(
                                                        onTap: () {
                                                          Notifiers
                                                              .showplayer
                                                              .value = false;
                                                          BlocProvider.of<
                                                            YtrelatedvideosBloc
                                                          >(context).add(
                                                            YtrelatedvideosEvent.relatedvideos(
                                                              videos3[index].id
                                                                  .toString(),
                                                            ),
                                                          );
                                                          BlocProvider.of<
                                                            YoutubeplayerBloc
                                                          >(context).add(
                                                            YoutubeplayerEvent.ytplayerevent(
                                                              videos3,
                                                              index,
                                                            ),
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                right: 10,
                                                                left: 10,
                                                              ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 220,
                                                                width:
                                                                    MediaQuery.sizeOf(
                                                                      context,
                                                                    ).width,
                                                                clipBehavior:
                                                                    Clip.antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            5,
                                                                          ),
                                                                    ),
                                                                child: Cachednetimagewidget(
                                                                  thumbnailSet:
                                                                      vid.thumbnails,
                                                                ),
                                                              ),
                                                              Spaces.kheight10,
                                                              Textutil(
                                                                text: vid.title,
                                                                fontsize: 15,
                                                                color:
                                                                    Spaces
                                                                        .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Textutil(
                                                                    text:
                                                                        "${vid.author}  •",
                                                                    fontsize:
                                                                        10,
                                                                    color:
                                                                        Spaces
                                                                            .textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textutil(
                                                                    text: timeago
                                                                        .format(
                                                                          vid.uploadDate!,
                                                                        ),
                                                                    fontsize:
                                                                        10,
                                                                    color:
                                                                        Spaces
                                                                            .textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ],
                                                              ),
                                                              const Textutil(
                                                                text: '',
                                                                fontsize: 10,
                                                                color:
                                                                    Spaces
                                                                        .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                              Spaces.kheight20,
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      redTitleWidget(
                                        one: "Mollywood ",
                                        two: "Hits",
                                      ),
                                      BlocBuilder<
                                        TrendingSongBloc,
                                        TrendingSongState
                                      >(
                                        builder: (context, state) {
                                          if (state is Songstate) {
                                            return TrendingSongsWidget(
                                              details: state.Malayalam,
                                              size: size,
                                            );
                                          } else if (state
                                              is TrendingSongLoading) {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          } else {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          }
                                        },
                                      ),
                                      redTitleWidget(
                                        one: "Bollywood ",
                                        two: "Tadka",
                                      ),
                                      BlocBuilder<
                                        TrendingSongBloc,
                                        TrendingSongState
                                      >(
                                        builder: (context, state) {
                                          if (state is Songstate) {
                                            return TrendingSongsWidget(
                                              details: state.hindi,
                                              size: size,
                                            );
                                          } else if (state
                                              is TrendingSongLoading) {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          } else {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          }
                                        },
                                      ),
                                      redTitleWidget(
                                        one: "Kollywood ",
                                        two: "Hits",
                                      ),
                                      BlocBuilder<
                                        TrendingSongBloc,
                                        TrendingSongState
                                      >(
                                        builder: (context, state) {
                                          if (state is Songstate) {
                                            return TrendingSongsWidget(
                                              details: state.Tamil,
                                              size: size,
                                            );
                                          } else if (state
                                              is TrendingSongLoading) {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          } else {
                                            return Songloadingwidget(
                                              size: size,
                                            );
                                          }
                                        },
                                      ),
                                      redTitleWidget(
                                        one: "Most ",
                                        two: "Viewed",
                                      ),
                                      BlocBuilder<YtsearchBloc, YtsearchState>(
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                            orElse: () => SizedBox(),
                                            loader: () => LoadingHomeyt(),
                                            fres: (
                                              videos,
                                              vidoes1,
                                              videos2,
                                              videos3,
                                              isloading,
                                              isfailed,
                                            ) {
                                              return Column(
                                                children: [
                                                  Spaces.kheight10,
                                                  CarouselSlider(
                                                    options: CarouselOptions(
                                                      pauseAutoPlayOnTouch:
                                                          true,
                                                      initialPage: Random()
                                                          .nextInt(
                                                            vidoes1.length,
                                                          ),
                                                      height: 300.0,
                                                      viewportFraction: 1,
                                                      autoPlayInterval:
                                                          const Duration(
                                                            seconds: 10,
                                                          ),
                                                      autoPlay: true,
                                                    ),
                                                    items: Spaces().getList(vidoes1.length, (
                                                      index,
                                                    ) {
                                                      Video vid =
                                                          vidoes1[index];
                                                      return GestureDetector(
                                                        onTap: () {
                                                          Notifiers
                                                              .showplayer
                                                              .value = false;
                                                          BlocProvider.of<
                                                            YtrelatedvideosBloc
                                                          >(context).add(
                                                            YtrelatedvideosEvent.relatedvideos(
                                                              vidoes1[index].id
                                                                  .toString(),
                                                            ),
                                                          );
                                                          BlocProvider.of<
                                                            YoutubeplayerBloc
                                                          >(context).add(
                                                            YoutubeplayerEvent.ytplayerevent(
                                                              vidoes1,
                                                              index,
                                                            ),
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                right: 10,
                                                                left: 10,
                                                              ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height: 220,
                                                                width:
                                                                    MediaQuery.sizeOf(
                                                                      context,
                                                                    ).width,
                                                                clipBehavior:
                                                                    Clip.antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            5,
                                                                          ),
                                                                    ),
                                                                child: Cachednetimagewidget(
                                                                  thumbnailSet:
                                                                      vid.thumbnails,
                                                                ),
                                                              ),
                                                              Spaces.kheight10,
                                                              Textutil(
                                                                text: vid.title,
                                                                fontsize: 15,
                                                                color:
                                                                    Spaces
                                                                        .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Textutil(
                                                                    text:
                                                                        "${vid.author}  •",
                                                                    fontsize:
                                                                        10,
                                                                    color:
                                                                        Spaces
                                                                            .textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textutil(
                                                                    text: timeago
                                                                        .format(
                                                                          vid.uploadDate!,
                                                                        ),
                                                                    fontsize:
                                                                        10,
                                                                    color:
                                                                        Spaces
                                                                            .textColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ],
                                                              ),
                                                              const Textutil(
                                                                text: '',
                                                                fontsize: 10,
                                                                color:
                                                                    Spaces
                                                                        .textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                              Spaces.kheight20,
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                } else {
                                  return HomeSectionYT();
                                }
                              },
                            ),

                            SizedBox(height: 80),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingHomeyt extends StatelessWidget {
  const LoadingHomeyt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Customshimmer(
            height: MediaQuery.sizeOf(context).height / 4,
            width: MediaQuery.sizeOf(context).width,
            radius: 5,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spaces.kheight10,
              Customshimmer(height: 16, width: 200, radius: 30),
              Spaces.kheight10,
              Customshimmer(height: 10, width: 150, radius: 30),
              Spaces.kheight10,
            ],
          ),
        ],
      ),
    );
  }
}

class redTitleWidget extends StatelessWidget {
  final String one;
  final String two;

  const redTitleWidget({super.key, required this.one, required this.two});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: const TextStyle(fontSize: 16, height: 1.4),
              children: [
                TextSpan(
                  text: one,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: two,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Loadingpicks extends StatelessWidget {
  const Loadingpicks({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 330,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spaces.kheight10,
          const TitleText(titleTextt: 'Quick picks'),
          Spaces.kheight10,
          Expanded(
            child: PageView.builder(
              controller: PageController(viewportFraction: 1, initialPage: 0),
              scrollDirection: Axis.horizontal,
              itemCount: (10 / 4).ceil(),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: size.width,
                  child: Column(
                    children: List.generate(4, (innerIndex) {
                      final itemIndex = index * 4 + innerIndex;
                      if (itemIndex < 10) {
                        return SizedBox(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: ListTile(
                              leading: SizedBox(
                                height: 50,
                                width: 50,
                                child: Shimmer.fromColors(
                                  period: const Duration(seconds: 2),
                                  baseColor: const Color.fromARGB(
                                    255,
                                    18,
                                    41,
                                    61,
                                  ),
                                  highlightColor: const Color.fromARGB(
                                    255,
                                    2,
                                    38,
                                    68,
                                  ).withOpacity(0.5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        3,
                                        33,
                                        57,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                              subtitle: SizedBox(
                                width: 150,
                                height: 7,
                                child: Shimmer.fromColors(
                                  period: const Duration(seconds: 2),
                                  baseColor: const Color.fromARGB(
                                    255,
                                    18,
                                    41,
                                    61,
                                  ),
                                  highlightColor: const Color.fromARGB(
                                    255,
                                    2,
                                    38,
                                    68,
                                  ).withValues(alpha: 0.5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        3,
                                        33,
                                        57,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                              title: SizedBox(
                                width: MediaQuery.sizeOf(context).width / 1.5,
                                height: 10,
                                child: Shimmer.fromColors(
                                  period: const Duration(seconds: 2),
                                  baseColor: const Color.fromARGB(
                                    255,
                                    18,
                                    41,
                                    61,
                                  ),
                                  highlightColor: const Color.fromARGB(
                                    255,
                                    2,
                                    38,
                                    68,
                                  ).withValues(alpha: 0.5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        3,
                                        33,
                                        57,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Userspace extends StatelessWidget {
  const Userspace({
    super.key,
    required this.size,
    required TextEditingController controller,
  }) : _controller = controller;

  final Size size;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBlocBloc, UserBlocState>(
      builder: (context, state) {
        return state.maybeWhen(
          userdetails: (user) {
            return user.name.isEmpty
                ? SizedBox(
                  height: double.infinity,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spaces.kheight10,
                      Textutil(
                        text: magic[Random().nextInt(magic.length)],
                        fontsize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      Spaces.kheigth5,
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      surfaceTintColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        height: size.height / 3.5,
                                        width: size.width / 1.1,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CustomTextFormField(
                                              controller: _controller,
                                              ContentType: "Name",
                                              obscureText: false,
                                              prefixicon: Icons.playlist_add,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    child: const Center(
                                                      child: Textutil(
                                                        text: 'Cancel',
                                                        fontsize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Usermodel user = Usermodel(
                                                      name:
                                                          _controller.text
                                                              .trim(),
                                                      date:
                                                          DateTime.now()
                                                              .toString(),
                                                    );
                                                    BlocProvider.of<
                                                      UserBlocBloc
                                                    >(context).add(
                                                      UserBlocEvent.userdetails(
                                                        user,
                                                        'initial',
                                                      ),
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    child: const Center(
                                                      child: Textutil(
                                                        text: 'Update',
                                                        fontsize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Textutil(
                                text: 'guest',
                                fontsize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                      Spaces.kheigth5,
                    ],
                  ),
                )
                : SizedBox(
                  height: double.infinity,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spaces.kheight10,
                      Textutil(
                        text: magic[Random().nextInt(magic.length)],
                        fontsize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      Spaces.kheigth5,
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      surfaceTintColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        height: size.height / 3.5,
                                        width: size.width / 1.1,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CustomTextFormField(
                                              controller: _controller,
                                              ContentType: "Name",
                                              obscureText: false,
                                              prefixicon: Icons.playlist_add,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    child: const Center(
                                                      child: Textutil(
                                                        text: 'Cancel',
                                                        fontsize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Usermodel user = Usermodel(
                                                      name:
                                                          _controller.text
                                                              .trim(),
                                                      date:
                                                          DateTime.now()
                                                              .toString(),
                                                    );
                                                    BlocProvider.of<
                                                      UserBlocBloc
                                                    >(context).add(
                                                      UserBlocEvent.userdetails(
                                                        user,
                                                        'update',
                                                      ),
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    child: const Center(
                                                      child: Textutil(
                                                        text: 'Update',
                                                        fontsize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Textutil(
                                text: user.name,
                                fontsize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spaces.kheigth5,
                    ],
                  ),
                );
          },
          orElse:
              () => SizedBox(
                height: double.infinity,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spaces.kheight10,
                    Textutil(
                      text: magic[Random().nextInt(magic.length)],
                      fontsize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    Spaces.kheigth5,
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Textutil(
                            text: 'USER',
                            fontsize: 25,
                            color: Colors.red,
                            fontWeight: FontWeight.normal,
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    surfaceTintColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    child: Container(
                                      height: size.height / 3.5,
                                      width: size.width / 1.1,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomTextFormField(
                                            controller: _controller,
                                            ContentType: "Name",
                                            obscureText: false,
                                            prefixicon: Icons.playlist_add,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          20,
                                                        ),
                                                  ),
                                                  child: const Center(
                                                    child: Textutil(
                                                      text: 'Cancel',
                                                      fontsize: 13,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Usermodel user = Usermodel(
                                                    name:
                                                        _controller.text.trim(),
                                                    date:
                                                        DateTime.now()
                                                            .toString(),
                                                  );
                                                  BlocProvider.of<UserBlocBloc>(
                                                    context,
                                                  ).add(
                                                    UserBlocEvent.userdetails(
                                                      user,
                                                      'initial',
                                                    ),
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          20,
                                                        ),
                                                  ),
                                                  child: const Center(
                                                    child: Textutil(
                                                      text: 'Update',
                                                      fontsize: 13,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spaces.kheigth5,
                  ],
                ),
              ),
        );
      },
    );
  }
}

class Lastsession extends StatefulWidget {
  const Lastsession({super.key, required this.size});

  final Size size;

  @override
  State<Lastsession> createState() => _LastsessionState();
}

class _LastsessionState extends State<Lastsession> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecentsBloc>(
      context,
    ).add(const RecentsEvent.getallrecent());
    return BlocBuilder<RecentsBloc, RecentsState>(
      builder: (context, state) {
        return state.maybeWhen(
          recents: (quickpicks) {
            return SizedBox(
              height:
                  quickpicks.length == 3
                      ? 260
                      : quickpicks.length == 2
                      ? 190
                      : quickpicks.length == 1
                      ? 115
                      : quickpicks.isEmpty
                      ? 0
                      : 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spaces.kheight10,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [redTitleWidget(one: "Recently ", two: "Played")],
                  ),
                  Spaces.kheight10,
                  Expanded(
                    child:
                        quickpicks.isNotEmpty
                            ? PageView.builder(
                              padEnds: false,
                              controller: PageController(
                                viewportFraction: 0.9,
                                initialPage: 0,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: (quickpicks.length / 4).ceil(),
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  width: widget.size.width,
                                  child: Column(
                                    children: List.generate(4, (innerIndex) {
                                      final itemIndex = index * 4 + innerIndex;
                                      if (itemIndex < quickpicks.length) {
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            BlocProvider.of<
                                              YoutubePlayerBackgroundBloc
                                            >(context).add(
                                              YoutubePlayerBackgroundEvent.started(),
                                            );
                                            Notifiers.showplayer.value = true;
                                            List<AlbumSongEntity> allsongs = [];
                                            for (var element in quickpicks) {
                                              final song = AlbumSongEntity(
                                                type: "saavn",
                                                id: element['id'],
                                                name: element['title'],
                                                year: 'null',
                                                primaryArtists:
                                                    element['artist'],
                                                image: element['imageurl'],
                                                songs: element['downloadurl'],
                                                albumurl: 'null',
                                              );
                                              allsongs.add(song);
                                            }

                                            BlocProvider.of<AudioBloc>(
                                              context,
                                            ).add(
                                              AudioEvent.onlineaudio(
                                                allsongs[itemIndex].id,
                                                0,
                                                allsongs[itemIndex].songs,
                                                allsongs[itemIndex].image,
                                                allsongs[itemIndex].name,
                                                allsongs[itemIndex]
                                                    .primaryArtists,
                                                const [],
                                                [allsongs[itemIndex]],
                                                const [],
                                                const [],
                                              ),
                                            );
                                          },
                                          child: SizedBox(
                                            height: 70,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 7,
                                              ),
                                              child: ListTile(
                                                leading: Container(
                                                  height: 90,
                                                  width: 55,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          6,
                                                        ),
                                                    image: DecorationImage(
                                                      image: CachedNetworkImageProvider(
                                                        quickpicks[itemIndex]['imageurl'],
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  quickpicks[itemIndex]['artist'],
                                                  style: Spaces.Getstyle(
                                                    10,
                                                    const Color.fromARGB(
                                                      255,
                                                      129,
                                                      129,
                                                      129,
                                                    ),
                                                    FontWeight.normal,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                title: Text(
                                                  quickpicks[itemIndex]['title'],
                                                  style: Spaces.Getstyle(
                                                    15,
                                                    Colors.white,
                                                    FontWeight.w500,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                                  ),
                                );
                              },
                            )
                            : const SizedBox(),
                  ),
                ],
              ),
            );
          },
          orElse: () => SizedBox(),
        );
      },
    );
  }
}

class TitleText extends StatelessWidget {
  final String titleTextt;
  const TitleText({super.key, required this.titleTextt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Textutil(
        text: titleTextt,
        fontsize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TrendingSongsWidget extends StatelessWidget {
  final List<launchdataEntity> details;
  final Size size;
  const TrendingSongsWidget({
    super.key,
    required this.details,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3.8,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: details.length,
        itemBuilder: (context, index) {
          final results = details[index];
          return TrendingImageWidgets(
            size: size,
            results: results,
            index: index,
          );
        },
      ),
    );
  }
}

class TrendingImageWidgets extends StatelessWidget {
  const TrendingImageWidgets({
    super.key,
    required this.size,
    required this.results,
    required this.index,
  });

  final Size size;
  final launchdataEntity results;
  final int index;

  @override
  Widget build(BuildContext context) {
    final img = results.image.replaceAll('150x150.jpg', '500x500.jpg');
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            if (results.type == 'album') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SongDetailsPage(
                      type: results.type,
                      imageurl: results.image,
                      albumurl: results.albumurl,
                      name: results.title,
                      id: results.id,
                    );
                  },
                ),
              );
            } else if (results.type == 'playlist') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SongDetailsPage(
                      type: results.type,
                      imageurl: results.image,
                      albumurl: results.albumurl,
                      name: results.title,
                      id: results.id,
                    );
                  },
                ),
              );
            }
          },
          child: SizedBox(
            width: size.width / 2.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height / 5.5,
                  padding: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Colors.transparent,
                  ),
                  child: SizedBox(
                    width: size.width / 2.3,
                    child: CachedNetworkImage(
                      imageUrl: img,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      placeholder:
                          (context, url) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/musical-note.png',
                              color: Colors.grey,
                            ),
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  child: Textutil(
                    text: results.title,
                    fontsize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
