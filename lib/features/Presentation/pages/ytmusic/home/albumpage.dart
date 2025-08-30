// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/pages/saavn/HomePage.dart';
import 'package:norse/features/Presentation/pages/saavn/Settings/ytmusiclogin.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/artispage.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class AlbumPageYt extends StatefulWidget {
  final String id;
  const AlbumPageYt({super.key, required this.id});

  @override
  State<AlbumPageYt> createState() => _AlbumPageYtState();
}

class _AlbumPageYtState extends State<AlbumPageYt> {

  Map? albumdata;

  _getalbums(String id) async {

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

    final url = Uri.parse("http://demoip:8000/getalbum?id=$id");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(headers),
    );

    if (response.statusCode == 200) {
      final overalldata = jsonDecode(response.body);

      albumdata = overalldata;
      developer.log(albumdata!['other_versions'].toString());
      developer.log(albumdata!['tracks'].toString());
      setState(() {});
    } else {
      developer.log('failed respos epo f jb');
    }
  }

  @override
  void initState() {
    super.initState();
    _getalbums(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Spaces.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body:
          albumdata != null
              ? SizedBox(
                height: size.height,
                width: size.width,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: size.height / 3,
                      width: size.width,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                (albumdata!['thumbnails'] as List).last['url'],
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black, Colors.transparent],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Textutil(
                                    text: albumdata!['title'],
                                    fontsize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),

                                  TextButton.icon(
                                    onPressed: () {
                                      showCustomBottomSheet(
                                        context,
                                        albumdata!['description'].toString(),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    label: const Text(
                                      'View Description',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 2,
                                      shadowColor: Colors.black26,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    (albumdata!['tracks']) != null
                        ? SizedBox(
                          height: size.height / 2.6,
                          width: size.width,
                          child: Column(
                            children: [
                              redTitleWidget(one: 'Album', two: "Tracks"),
                              Spaces.kheight10,
                              SizedBox(
                                height: size.height / 3,
                                width: size.width,
                                child: SizedBox(
                                  height:
                                      (albumdata!['tracks'] as List).length == 3
                                          ? 260
                                          : (albumdata!['tracks'] as List)
                                                  .length ==
                                              2
                                          ? 190
                                          : (albumdata!['tracks'] as List)
                                                  .length ==
                                              1
                                          ? 115
                                          : (albumdata!['tracks'] as List)
                                              .isEmpty
                                          ? 0
                                          : 330,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child:
                                            (albumdata!['tracks'] as List)
                                                    .isNotEmpty
                                                ? PageView.builder(
                                                  padEnds: false,
                                                  controller: PageController(
                                                    viewportFraction: 0.9,
                                                    initialPage: 0,
                                                  ),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      ((albumdata!['tracks']
                                                                      as List)
                                                                  .length /
                                                              4)
                                                          .ceil(),
                                                  itemBuilder: (
                                                    BuildContext context,
                                                    int index,
                                                  ) {
                                                    return SizedBox(
                                                      width: size.width,
                                                      child: Column(
                                                        children: List.generate(4, (
                                                          innerIndex,
                                                        ) {
                                                          final itemIndex =
                                                              index * 4 +
                                                              innerIndex;
                                                          if (itemIndex <
                                                              (albumdata!['tracks']
                                                                      as List)
                                                                  .length) {
                                                            List artistlist =
                                                                ((albumdata!['tracks']
                                                                        as List)[itemIndex]['artists']
                                                                    as List);

                                                            String
                                                            sub = artistlist
                                                                .map(
                                                                  (e) =>
                                                                      e['name'],
                                                                )
                                                                .join(',');

                                                            return InkWell(
                                                              splashColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () {
                                                                List<Video>
                                                                videos = [];

                                                                for (var vido
                                                                    in (albumdata!['tracks']
                                                                        as List)) {
                                                                  Video
                                                                  video = Video(
                                                                    VideoId(
                                                                      vido['videoId']
                                                                          .toString(),
                                                                    ),
                                                                    vido['title'],
                                                                    sub,
                                                                    ChannelId(
                                                                      'UC2cDmOO_m6sbJhHYhJLeVLQ',
                                                                    ),
                                                                    DateTime(
                                                                      2000,
                                                                    ),
                                                                    'null',
                                                                    DateTime(
                                                                      2000,
                                                                    ),
                                                                    'null',
                                                                    Duration
                                                                        .zero,
                                                                    ThumbnailSet(
                                                                      vido['videoId'],
                                                                    ),
                                                                    'sf dsf sd '
                                                                        .characters,
                                                                    Engagement(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                    ),
                                                                    false,
                                                                  );
                                                                  videos.add(
                                                                    video,
                                                                  );
                                                                }

                                                                Notifiers
                                                                    .showplayer
                                                                    .value = true;

                                                                BlocProvider.of<
                                                                  AudioBloc
                                                                >(context).add(
                                                                  AudioEvent.started(),
                                                                );

                                                                BlocProvider.of<
                                                                  YoutubePlayerBackgroundBloc
                                                                >(context).add(
                                                                  YoutubePlayerBackgroundEvent.started(),
                                                                );

                                                                BlocProvider.of<
                                                                  AudioBloc
                                                                >(context).add(
                                                                  AudioEvent.ytmusiclisten(
                                                                    videos,
                                                                    itemIndex,
                                                                    'p',
                                                                  ),
                                                                );
                                                              },
                                                              child: SizedBox(
                                                                height: 70,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets.only(
                                                                        bottom:
                                                                            7,
                                                                      ),
                                                                  child: ListTile(
                                                                    leading: SizedBox(
                                                                      height:
                                                                          50,
                                                                      width: 50,
                                                                      child: CachedNetworkImage(
                                                                        imageUrl:
                                                                            (albumdata!['thumbnails']
                                                                                    as List)
                                                                                .last['url'],
                                                                      ),
                                                                    ),
                                                                    subtitle: Text(
                                                                      sub,
                                                                      style: Spaces.Getstyle(
                                                                        10,
                                                                        const Color.fromARGB(
                                                                          255,
                                                                          129,
                                                                          129,
                                                                          129,
                                                                        ),
                                                                        FontWeight
                                                                            .normal,
                                                                      ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                    title: Textutil(
                                                                      text:
                                                                          (albumdata!['tracks']
                                                                              as List)[itemIndex]['title'],
                                                                      fontsize:
                                                                          15,
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                ),
                              ),
                            ],
                          ),
                        )
                        : SizedBox(),
                    (albumdata!['other_versions']) != null
                        ? SizedBox(
                          height: size.height / 4,
                          width: size.width,
                          child: Column(
                            children: [
                              redTitleWidget(one: 'Similar ', two: "Albums"),
                              Spaces.kheight10,
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.only(left: 10),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      (albumdata!['other_versions'] as List)
                                          .length,
                                  itemBuilder: (context, index) {
                                    final data =
                                        (albumdata!['other_versions']
                                            as List)[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (_) => AlbumPageYt(
                                                  id: data['browseId'],
                                                ),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        width: size.width / 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    (data['thumbnails'] as List)
                                                        .last['url'],
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width / 3,
                                              child: Textutil(
                                                text: data['title'],
                                                fontsize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                        : SizedBox(),
                    Spaces.kheight50,
                    Spaces.kheight50,
                    Spaces.kheight50,
                  ],
                ),
              )
              : Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
    );
  }

  void showCustomBottomSheet(BuildContext context, String des) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Dark theme
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => CustomBottomSheetContent(des: des),
    );
  }
}
