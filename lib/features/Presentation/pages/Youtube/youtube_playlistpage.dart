import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../configs/constants/Spaces.dart';
import '../../Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import '../MainHomePage/MainHomePage.dart';
import 'youtubescreen/ytpage.dart';

class Youtubeplaylistpage extends StatelessWidget {
  static const youtubeplaylistpage = './youtubeplaylistpage';
  const Youtubeplaylistpage({
    super.key,
    required this.songs,
    required this.title,
  });

  final List<Video> songs;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
        color: Colors.black,
        child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: CachedNetworkImage(
                        imageUrl: songs[0].thumbnails.highResUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  color: Colors.black,
                  height: size.height,
                  width: size.width,
                ),
                CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          )),
                      pinned: true,
                      stretch: true,
                      expandedHeight: 280,
                      foregroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: FlexibleSpaceBar(
                        stretchModes: const [StretchMode.zoomBackground],
                        collapseMode: CollapseMode.parallax,
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              errorWidget: (context, url, error) {
                                return Thumbnailfuturebuilder(
                                    video: songs[0].thumbnails);
                              },
                              imageUrl: songs[0].thumbnails.maxResUrl,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                    Colors.black,
                                    Colors.transparent
                                  ])),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Textutil(
                                        text: title,
                                        fontsize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                    Row(
                                      children: [
                                        const Textutil(
                                            text: "Playlist  •  ",
                                            fontsize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                        Textutil(
                                            text: "songs ${songs.length}",
                                            fontsize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 20),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                              childCount: songs.length, (context, index) {
                        return InkWell(
                            onTap: () {
                              BlocProvider.of<YoutubeplayerBloc>(context).add(
                                  YoutubeplayerEvent.ytplayerevent(
                                      songs, index));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 150,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) {
                                        return Image.asset(
                                          'assets/musical-note.png',
                                          color: Colors.white.withOpacity(0.5),
                                        );
                                      },
                                      imageUrl:
                                          songs[index].thumbnails.maxResUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Textutil(
                                            text: songs[index].title,
                                            fontsize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        Textutil(
                                            text: songs[index].author,
                                            fontsize: 12,
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontWeight: FontWeight.normal)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                      })),
                    )
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomMusicBar(),
                )
              ],
            )));
  }
}
