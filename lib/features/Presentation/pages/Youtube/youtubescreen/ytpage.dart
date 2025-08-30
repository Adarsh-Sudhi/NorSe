import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/CustomWidgets/custumlistviewbuilder.dart';
import 'package:norse/features/Presentation/pages/MainHomePage/MainHomePage.dart';
import 'package:norse/features/Presentation/pages/Youtube/ytsearchpage/ytsearchpage.dart';
import 'package:norse/features/Presentation/pages/saavn/HomePage.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/testonlineplayerscreen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:norse/configs/constants/Spaces.dart';
import '../../../Blocs/youtubeBloc/ytrelatedvideos_bloc/ytrelatedvideos_bloc.dart';
import '../../../Blocs/youtubeBloc/ytsearch_bloc/ytsearch_bloc.dart';
import '../youtubeplayer/testytplayerscreen.dart';

class Youtubepage extends StatefulWidget {
  static const String ytHome = './ythome';
  const Youtubepage({super.key});

  @override
  State<Youtubepage> createState() => _YoutubepageState();
}

class _YoutubepageState extends State<Youtubepage> {
  String formatdatetime(DateTime dateTime) {
    String date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    return date;
  }

  String formatViewCount(int count) {
    if (count >= 1000000000) {
      return '${(count / 1000000000).toStringAsFixed(1)}B';
    } else if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Container(
        color: Colors.black,
        width: size.width,
        height: size.width,
        child: Stack(
          children: [
            Navigator(
              key: ytnavigator0,
              initialRoute: '/',
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case 'search':
                    return MaterialPageRoute(builder: (_) => Ytsearchpage());

                  default:
                    return MaterialPageRoute(
                      builder: (_) => const IntialytHomepage(),
                    );
                }
              },
            ),
            /* SafeArea(
                child: BlocBuilder<YoutubeplayerBloc, YoutubeplayerState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        youtubeplayerstate: (controller, index, video, m, audio,
                                vid, loading,failed) =>
                            Offstage(
                              offstage: state.maybeWhen(
                                loading: () => false,
                                switchstate: () => true,
                                orElse: () => true,
                                youtubeplayerstate: (controller, index, video,
                                        m, audio, vid, loading) =>
                                    false,
                              ),
                              child: Miniplayer(
                                minHeight: 60,
                                maxHeight: size.height,
                                valueNotifier: Notifiers.ytexpandnotifer,
                                builder: (height, percentage) {
                                  return Testytplayer(
                                      height: height,
                                      persentage: percentage,
                                      video: video,
                                      index: index,
                                      context: context,
                                      controller: controller);
                                },
                              ),
                            ),
                        orElse: () => const SizedBox.shrink());
                  },
                ),
              ) */
          ],
        ),
      ),
    );
  }
}

class IntialytHomepage extends StatefulWidget {
  const IntialytHomepage({super.key});

  @override
  State<IntialytHomepage> createState() => _IntialytHomepageState();
}

class _IntialytHomepageState extends State<IntialytHomepage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.black,
      child: ListView(
        shrinkWrap: true,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Spaces.backgroundColor,
            leading: GestureDetector(
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
            actions: [
              PlayIcons(
                playicons: Icons.search,
                iconscolors: Colors.white,
                iconsize: 24,
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Ytsearchpage()),
                  );
                },
              ),
            ],
            title: SizedBox(
              width: size.width / 2,
              child: Row(
                children: [
                  Image.asset('assets/yt.png', scale: 15),
                  const SizedBox(width: 5),
                  const Textutil(
                    text: 'YouTube',
                    fontsize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<YtsearchBloc, YtsearchState>(
            builder: (context, state) {
              return state.maybeWhen(
                fres: (videos, vidoes1, videos2, videos3, isloading, isfailed) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spaces.kheight10,
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Textutil(
                              text: 'Hot ',
                              fontsize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                            Textutil(
                              text: 'Tracks',
                              fontsize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Spaces.kheight10,
                      CarouselSlider(
                        options: CarouselOptions(
                          pauseAutoPlayOnTouch: true,
                          height: 300.0,
                          viewportFraction: 1,
                          autoPlayInterval: const Duration(seconds: 10),
                          autoPlay: true,
                        ),
                        items: Spaces().getList(videos.length, (index) {
                          Video vid = videos[index];
                          return GestureDetector(
                            onTap: () {
                              Notifiers.showplayer.value = false;
                              BlocProvider.of<YtrelatedvideosBloc>(context).add(
                                YtrelatedvideosEvent.relatedvideos(
                                  videos[index].id.toString(),
                                ),
                              );
                              BlocProvider.of<YoutubeplayerBloc>(context).add(
                                YoutubeplayerEvent.ytplayerevent(videos, index),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                                left: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 220,
                                    width: MediaQuery.sizeOf(context).width,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Cachednetimagewidget(
                                      thumbnailSet: vid.thumbnails,
                                    ),
                                  ),
                                  Spaces.kheight10,
                                  Textutil(
                                    text: vid.title,
                                    fontsize: 15,
                                    color: Spaces.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Row(
                                    children: [
                                      Textutil(
                                        text: "${vid.author}  •",
                                        fontsize: 10,
                                        color: Spaces.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(width: 10),
                                      Textutil(
                                        text: timeago.format(vid.uploadDate!),
                                        fontsize: 10,
                                        color: Spaces.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  const Textutil(
                                    text: '',
                                    fontsize: 10,
                                    color: Spaces.textColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  Spaces.kheight20,
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Textutil(
                              text: 'Bollywood ',
                              fontsize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                            Textutil(
                              text: ' Tadka',
                              fontsize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Spaces.kheight10,
                      CarouselSlider(
                        options: CarouselOptions(
                          pauseAutoPlayOnTouch: true,
                          height: 300.0,
                          viewportFraction: 1,
                          autoPlayInterval: const Duration(seconds: 10),
                          autoPlay: true,
                        ),
                        items: Spaces().getList(videos2.length, (index) {
                          Video vid = videos2[index];
                          return GestureDetector(
                            onTap: () {
                              Notifiers.showplayer.value = false;
                              BlocProvider.of<YtrelatedvideosBloc>(context).add(
                                YtrelatedvideosEvent.relatedvideos(
                                  videos2[index].id.toString(),
                                ),
                              );
                              BlocProvider.of<YoutubeplayerBloc>(context).add(
                                YoutubeplayerEvent.ytplayerevent(
                                  videos2,
                                  index,
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                                left: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 220,
                                    width: MediaQuery.sizeOf(context).width,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Cachednetimagewidget(
                                      thumbnailSet: vid.thumbnails,
                                    ),
                                  ),
                                  Spaces.kheight10,
                                  Textutil(
                                    text: vid.title,
                                    fontsize: 15,
                                    color: Spaces.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Row(
                                    children: [
                                      Textutil(
                                        text: "${vid.author}  •",
                                        fontsize: 10,
                                        color: Spaces.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(width: 10),
                                      Textutil(
                                        text: timeago.format(vid.uploadDate!),
                                        fontsize: 10,
                                        color: Spaces.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  const Textutil(
                                    text: '',
                                    fontsize: 10,
                                    color: Spaces.textColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  Spaces.kheight20,
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Textutil(
                              text: 'Kollywood ',
                              fontsize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                            Textutil(
                              text: ' hits',
                              fontsize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Spaces.kheight10,
                      CarouselSlider(
                        options: CarouselOptions(
                          pauseAutoPlayOnTouch: true,
                          height: 300.0,
                          viewportFraction: 1,
                          autoPlayInterval: const Duration(seconds: 10),
                          autoPlay: true,
                        ),
                        items: Spaces().getList(vidoes1.length, (index) {
                          Video vid = vidoes1[index];
                          return GestureDetector(
                            onTap: () {
                              Notifiers.showplayer.value = false;
                              BlocProvider.of<YtrelatedvideosBloc>(context).add(
                                YtrelatedvideosEvent.relatedvideos(
                                  vidoes1[index].id.toString(),
                                ),
                              );
                              BlocProvider.of<YoutubeplayerBloc>(context).add(
                                YoutubeplayerEvent.ytplayerevent(
                                  vidoes1,
                                  index,
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                                left: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 220,
                                    width: MediaQuery.sizeOf(context).width,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Cachednetimagewidget(
                                      thumbnailSet: vid.thumbnails,
                                    ),
                                  ),
                                  Spaces.kheight10,
                                  Textutil(
                                    text: vid.title,
                                    fontsize: 15,
                                    color: Spaces.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Row(
                                    children: [
                                      Textutil(
                                        text: "${vid.author}  •",
                                        fontsize: 10,
                                        color: Spaces.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(width: 10),
                                      Textutil(
                                        text: timeago.format(vid.uploadDate!),
                                        fontsize: 10,
                                        color: Spaces.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  const Textutil(
                                    text: '',
                                    fontsize: 10,
                                    color: Spaces.textColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  Spaces.kheight20,
                                ],
                              ),
                            ),
                          );
                        }) /* List.generate(vidoes1.length, (index) {
                            Video vid = vidoes1[index];
                            return  GestureDetector(
                                onTap: () {
                                  Notifiers.showplayer.value = false;
                                  BlocProvider.of<YoutubeplayerBloc>(context)
                                      .add(YoutubeplayerEvent.ytplayerevent(
                                          vidoes1, index));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 220,
                                        width:
                                            MediaQuery.sizeOf(context).width,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Cachednetimagewidget(
                                          thumbnailSet: vid.thumbnails,
                                        ),
                                      ),
                                      Spaces.kheight10,
                                      Textutil(
                                        text: vid.title,
                                        fontsize: 15,
                                        color: Spaces.textColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Row(
                                        children: [
                                          Textutil(
                                            text: "${vid.author}  •",
                                            fontsize: 10,
                                            color: Spaces.textColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(width: 10),
                                          Textutil(
                                            text: timeago
                                                .format(vid.uploadDate!),
                                            fontsize: 10,
                                            color: Spaces.textColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      const Textutil(
                                        text: '',
                                        fontsize: 10,
                                        color: Spaces.textColor,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      Spaces.kheight20,
                                    ],
                                  ),
                                ));
                          })
                          */,
                      ),
                      Spaces.kheight10,
                      CustomListViewBuilderwidget(
                        physics: const NeverScrollableScrollPhysics(),
                        length: videos3.length,
                        widget: (context, index) {
                          Video vid = videos3[index];
                          return GestureDetector(
                            onTap: () {
                              Notifiers.showplayer.value = false;
                              BlocProvider.of<YtrelatedvideosBloc>(context).add(
                                YtrelatedvideosEvent.relatedvideos(
                                  videos3[index].id.toString(),
                                ),
                              );
                              BlocProvider.of<YoutubeplayerBloc>(context).add(
                                YoutubeplayerEvent.ytplayerevent(
                                  videos3,
                                  index,
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 220,
                                  width: MediaQuery.sizeOf(context).width,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Cachednetimagewidget(
                                    thumbnailSet: vid.thumbnails,
                                  ),
                                ),
                                Spaces.kheight10,
                                Textutil(
                                  text: vid.title,
                                  fontsize: 15,
                                  color: Spaces.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                Row(
                                  children: [
                                    Textutil(
                                      text: "${vid.author}  •",
                                      fontsize: 10,
                                      color: Spaces.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(width: 10),
                                    Textutil(
                                      text: timeago.format(vid.uploadDate!),
                                      fontsize: 10,
                                      color: Spaces.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                const Textutil(
                                  text: '',
                                  fontsize: 10,
                                  color: Spaces.textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                Spaces.kheight20,
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
                loader: () => const Syncaudiolaoding(),
                orElse: () => const Syncaudiolaoding(),
              );
            },
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class Syncaudiolaoding extends StatelessWidget {
  const Syncaudiolaoding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(color: Colors.white),
          ),
          Spaces.kheight20,
          Textutil(
            text: 'Synchronizing audio stream',
            fontsize: 16,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
          Spaces.kheight10,
          Textutil(
            text: 'please wait ...',
            fontsize: 16,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}

class YtplaylistWidget extends StatelessWidget {
  final List<Video> video;
  final String title;
  final VoidCallback ontap;
  final String subtitle;
  const YtplaylistWidget({
    super.key,
    required this.video,
    required this.title,
    required this.ontap,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width / 1.1,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    errorListener: (value) async {},
                    errorWidget: (context, url, error) {
                      return Thumbnailfuturebuilder(video: video[0].thumbnails);
                    },
                    imageUrl: video[0].thumbnails.maxResUrl,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 150,
                      color: Colors.black.withOpacity(0.8),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Textutil(
                              text: "${video.length}",
                              fontsize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            const SizedBox(height: 3),
                            const Icon(
                              Icons.playlist_play,
                              color: Colors.white,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
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

class Thumbnailfuturebuilder extends StatelessWidget {
  const Thumbnailfuturebuilder({super.key, required this.video});

  final ThumbnailSet video;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: gethumbnail(video),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: Color(0xFFB0BEC5),
            highlightColor: Color(0xFFCFD8DC),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 33, 57),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error fetching thumbnail: ${snapshot.error}');
        } else {
          return CachedNetworkImage(imageUrl: snapshot.data as String);
        }
      },
    );
  }
}

gethumbnail(ThumbnailSet thumbnailSet) async {
  String url = await Spaces().Gethumbnail(thumbnailSet);
  return url;
}
