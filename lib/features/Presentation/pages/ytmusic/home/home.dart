import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_ytmusic_api/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytrelatedvideos_bloc/ytrelatedvideos_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytsearch_bloc/ytsearch_bloc.dart';
import 'package:norse/features/Presentation/Blocs/ytmusic/ytmusic_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/shimmer.dart';
import 'package:norse/features/Presentation/pages/Youtube/youtubeplayer/testytplayerscreen.dart';
import 'package:norse/features/Presentation/pages/saavn/HomePage.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/artispage.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/moodsandmoments.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/quickpicks.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/userinfo.dart';
import 'package:norse/features/Presentation/pages/ytmusic/playlistdtaild/playlistdetails.dart';
import 'package:norse/features/Presentation/pages/ytmusic/playlistdtaild/userplaylist.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

Map? userdetails;
List? userplaylist;
List? allsongs;
List? moods;
List? genres;
List? artists;
List? subscriptions;

class HomeSectionYT extends StatefulWidget {
  const HomeSectionYT({super.key});

  @override
  State<HomeSectionYT> createState() => _HomeSectionYTState();
}

class _HomeSectionYTState extends State<HomeSectionYT> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocBuilder<YtmusicBloc, YtmusicState>(
      builder: (context, state) {
        return state.maybeWhen(
          ytmusicdata: (homeSection) {
            return Column(
              children: [
                userdetails != null
                    ? Userinfoyt(userinfo: userdetails!)
                    : const SizedBox(),

                Lastsession(size: size),

                allsongs != null && allsongs!.isNotEmpty
                    ? Column(
                      children: [
                        const redTitleWidget(one: "Recently ", two: "Played"),
                        Quickpicksyt(allsongs: allsongs!),
                      ],
                    )
                    : const SizedBox(),

                userplaylist != null && userplaylist!.isNotEmpty
                    ? Column(
                      spacing: 5,
                      children: [
                        const redTitleWidget(one: "Library ", two: "Playlist"),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            height: size.height / 3.9,
                            width: size.width,
                            child: YtMusicPlaylistsWidget(
                              playlists: userplaylist!,
                            ),
                          ),
                        ),
                      ],
                    )
                    : SizedBox(),

                subscriptions != null && subscriptions!.isNotEmpty
                    ? SizedBox(
                      height: 150,
                      child: Column(
                        children: [
                          redTitleWidget(one: 'Library ', two: 'Subscriptions'),
                          Spaces.kheight10,
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: subscriptions!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (_) => ArtispageYt(
                                                      id:
                                                          subscriptions![index]['browseId'],
                                                    ),
                                              ),
                                            );
                                          },
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundColor: Colors.black,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                  (subscriptions![index]['thumbnails']
                                                          as List)
                                                      .last['url'],
                                                ),
                                          ),
                                        ),
                                      ),
                                      Textutil(
                                        text: subscriptions![index]['artist'],
                                        fontsize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Textutil(
                                        text:
                                            "${subscriptions![index]['subscribers']} Subscribers",
                                        fontsize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Spaces.kheight10,
                        ],
                      ),
                    )
                    : const SizedBox(),

                moods != null && moods!.isNotEmpty
                    ? MoodsAndMoments(moods: moods!, title: "Moods and Moments")
                    : const SizedBox(),


                artists != null && artists!.isNotEmpty
                    ? SizedBox(
                      height: 150,
                      child: Column(
                        children: [
                          const redTitleWidget(one: 'Library ', two: 'Artists'),
                          Spaces.kheight10,
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: artists!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (_) => ArtispageYt(
                                                      id:
                                                          artists![index]['browseId'],
                                                    ),
                                              ),
                                            );
                                          },
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundColor: Colors.black,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                  (artists![index]['thumbnails']
                                                          as List)
                                                      .last['url'],
                                                ),
                                          ),
                                        ),
                                      ),
                                      Textutil(
                                        text: artists![index]['artist'],
                                        fontsize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : SizedBox(),

                Spaces.kheight10,
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: homeSection.length,
                  itemBuilder: (context, index) {
                    return _buildListContents(
                      homeSection[index].contents,
                      homeSection[index].title,
                      size,
                      index,
                    );
                  },
                ),
                Spaces.kheigth5,
              ],
            );
          },
          orElse:
              () => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Customshimmer(
                            height: 15,
                            width: MediaQuery.sizeOf(context).width / 2,
                            radius: 10,
                          ),
                        ),
                        Songloadingwidget(size: size),
                      ],
                    );
                  },
                ),
              ),
        );
      },
    );
  }
}

_buildListContents(
  List<dynamic> content,
  String title,
  Size size,
  int listindex,
) {
  return content.isNotEmpty
      ? SizedBox(
        height: size.height / 3.3,
        width: size.width,
        child: Column(
          children: [
            redTitleWidget(one: title, two: ''),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    final data = content[index] as PlaylistDetailed;
                    return data.runtimeType == PlaylistDetailed
                        ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => Playlistdetailsyt(
                                      playlistDetailed: data,
                                    ),
                              ),
                            );
                          },
                          child: _Buildplaylist(data: data),
                        )
                        : _Buildalbum(data: data);
                  },
                ),
              ),
            ),
          ],
        ),
      )
      : BlocBuilder<YtsearchBloc, YtsearchState>(
        builder: (context, state) {
          return state.maybeWhen(
            loader: () => const LoadingHomeyt(),
            orElse: () => SizedBox(),
            fres: (videos, vidoes1, videos2, videos3, isloading, isfailed) {
              return Column(
                children: [
                  Spaces.kheight10,

                  CarouselSlider(
                    options: CarouselOptions(
                      pauseAutoPlayOnTouch: true,
                      initialPage:
                          listindex == 0
                              ? Random().nextInt(vidoes1.length)
                              : listindex == 1
                              ? Random().nextInt(videos2.length)
                              : listindex == 2
                              ? Random().nextInt(videos3.length)
                              : Random().nextInt(videos3.length),
                      height: 298.0,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 10),
                      autoPlay: true,
                    ),
                    items: Spaces().getList(videos2.length, (index) {
                      Video vid =
                          listindex == 0
                              ? vidoes1[index]
                              : listindex == 1
                              ? videos2[index]
                              : listindex == 2
                              ? videos3[index]
                              : videos[index];
                      return GestureDetector(
                        onTap: () {
                          Notifiers.showplayer.value = false;
                          BlocProvider.of<YtrelatedvideosBloc>(context).add(
                            YtrelatedvideosEvent.relatedvideos(
                              vid.id.toString(),
                            ),
                          );
                          BlocProvider.of<YoutubeplayerBloc>(context).add(
                            YoutubeplayerEvent.ytplayerevent(videos2, index),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
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
                ],
              );
            },
          );
        },
      );
}

class YtMusicPlaylistsWidget extends StatelessWidget {
  final List<dynamic> playlists;

  const YtMusicPlaylistsWidget({super.key, required this.playlists});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        final playlist = playlists[index];
        final title = playlist['title'] ?? '';
        final description = playlist['description'] ?? '';
        final playlistId = playlist['playlistId'];
        final thumbnailList = playlist['thumbnails'] as List<dynamic>;
        final thumbnailUrl =
            thumbnailList.isNotEmpty ? thumbnailList.last['url'] : null;

        Size size = MediaQuery.sizeOf(context);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => UserYtPlayer(
                      title: title,
                      des: description,
                      playlistid: playlistId,
                      imageurl: thumbnailUrl,
                    ),
              ),
            );
          },
          child: SizedBox(
            width: size.width / 2.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(imageUrl: thumbnailUrl),
                  Textutil(
                    text: title,
                    fontsize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  Textutil(
                    text: "$description",
                    fontsize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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

class _Buildalbum extends StatelessWidget {
  const _Buildalbum({required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: CachedNetworkImage(
          imageUrl: (data as AlbumDetailed).thumbnails.last.url,
        ),
      ),
    );
  }
}

class _Buildplaylist extends StatelessWidget {
  const _Buildplaylist({required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width / 2.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: (data as PlaylistDetailed).thumbnails.last.url,
            ),
            Textutil(
              text: data.name,
              fontsize: 17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            Textutil(
              text: data.artist.name,
              fontsize: 8,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            Textutil(
              text: data.type,
              fontsize: 10,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
