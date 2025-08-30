// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_ytmusic_api/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytrelatedvideos_bloc/ytrelatedvideos_bloc.dart';
import 'package:norse/features/Presentation/pages/saavn/HomePage.dart';
import 'package:norse/features/Presentation/pages/saavn/Settings/ytmusiclogin.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/albumpage.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/quickpicks.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class ArtispageYt extends StatefulWidget {
  final String id;
  const ArtispageYt({Key? key, required this.id}) : super(key: key);

  @override
  State<ArtispageYt> createState() => _ArtispageYtState();
}

class _ArtispageYtState extends State<ArtispageYt> {
  Map? artistdetails;

  _getartist(String id) async {
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

    final url = Uri.parse("http://192.168.18.253:8000/getartist?id=$id");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(headers),
    );

    if (response.statusCode == 200) {
      final overalldata = jsonDecode(response.body);
      artistdetails = overalldata['artist'];

      developer.log(jsonEncode(overalldata['artistalbums']).toString());
      
      setState(() {});
    } else {
      developer.log('failed respos epo f jb');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getartist(widget.id);
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
          artistdetails != null
              ? SizedBox(
                height: size.height,
                width: size.width,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: size.height / 3.9,
                      width: size.width,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                (artistdetails!['thumbnails'] as List)
                                    .last['url'],
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
                                    text: artistdetails!['name'],
                                    fontsize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Textutil(
                                    text:
                                        "Subscribers ${artistdetails!['subscribers']}",
                                    fontsize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  artistdetails!['description'] != null
                                      ? TextButton.icon(
                                        onPressed: () {
                                          showCustomBottomSheet(
                                            context,
                                            artistdetails!['description']
                                                .toString(),
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
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          elevation: 2,
                                          shadowColor: Colors.black26,
                                        ),
                                      )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 2.6,
                      width: size.width,
                      child: Column(
                        children: [
                          redTitleWidget(one: 'Popular ', two: "Songs"),
                          Spaces.kheight10,
                          Quickpicksyt(
                            allsongs:
                                (artistdetails!['songs']['results'] as List),
                          ),
                        ],
                      ),
                    ),
                    artistdetails!.containsKey("albums")
                        ? SizedBox(
                          height: size.height / 4,
                          width: size.width,
                          child: Column(
                            children: [
                              redTitleWidget(one: 'Popular ', two: "albums"),
                              Spaces.kheight10,
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.only(left: 20),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      (artistdetails!['albums']['results']
                                              as List)
                                          .length,
                                  itemBuilder: (context, index) {
                                    final data =
                                        (artistdetails!['albums']['results']
                                            as List)[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
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
                                                fit: BoxFit.cover,
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
                    Spaces.kheight10,
                    artistdetails!.containsKey("videos")
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            redTitleWidget(one: 'Popular ', two: "Videos"),
                            Spaces.kheight10,
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  pauseAutoPlayOnTouch: true,
                                  initialPage: 0,
                                  height: 250.0,
                                  viewportFraction: 1,
                                  autoPlayInterval: const Duration(seconds: 10),
                                  autoPlay: true,
                                ),
                                items: Spaces().getList(
                                  (artistdetails!['videos']['results'] as List)
                                      .length,
                                  (index) {
                                    final data =
                                        (artistdetails!['videos']['results']
                                            as List)[index];

                                    final artists = (data['artists'] as List)
                                        .map((e) => e['name'])
                                        .join(',');

                                    return GestureDetector(
                                      onTap: () {
                                        Video video = Video(
                                          VideoId(data['videoId'].toString()),
                                          data['title'],
                                          '',
                                          ChannelId('UC2cDmOO_m6sbJhHYhJLeVLQ'),
                                          DateTime(2000),
                                          'null',
                                          DateTime(2000),
                                          'null',
                                          Duration.zero,
                                          ThumbnailSet(data['videoId']),
                                          'sf dsf sd '.characters,
                                          Engagement(0, 0, 0),
                                          false,
                                        );

                                        Notifiers.showplayer.value = false;
                                        BlocProvider.of<YtrelatedvideosBloc>(
                                          context,
                                        ).add(
                                          YtrelatedvideosEvent.relatedvideos(
                                            video.id.toString(),
                                          ),
                                        );
                                        BlocProvider.of<YoutubeplayerBloc>(
                                          context,
                                        ).add(
                                          YoutubeplayerEvent.ytplayerevent([
                                            video,
                                          ], 0),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 200,
                                              width:
                                                  MediaQuery.sizeOf(
                                                    context,
                                                  ).width,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    (data['thumbnails'] as List)
                                                        .last['url'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Spaces.kheight10,
                                            Textutil(
                                              text: data['title'],
                                              fontsize: 15,
                                              color: Spaces.textColor,
                                              fontWeight: FontWeight.bold,
                                            ),

                                            Textutil(
                                              text: artists,
                                              fontsize: 10,
                                              color: Spaces.textColor,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                        : SizedBox(),
                    artistdetails!.containsKey("related")
                        ? SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              redTitleWidget(one: 'Similar ', two: 'Artists'),
                              Spaces.kheight10,
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        (artistdetails!['related']['results']
                                                as List)
                                            .length,
                                    itemBuilder: (context, index) {
                                      final artists =
                                          (artistdetails!['related']['results']
                                              as List)[index];
                                      return Column(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (_) => ArtispageYt(
                                                          id:
                                                              artists!['browseId'],
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: CircleAvatar(
                                                radius: 60,
                                                backgroundColor: Colors.black,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                      (artists!['thumbnails']
                                                              as List)
                                                          .last['url'],
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Textutil(
                                            text: artists['title'],
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
                    Spaces.kheight50,
                    Spaces.kheight50,
                    Spaces.kheight50,
                  ],
                ),
              )
              : Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
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

class CustomBottomSheetContent extends StatelessWidget {
  final String des;
  const CustomBottomSheetContent({Key? key, required this.des})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2,
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: ListView(
          children: [Text(des, style: TextStyle(color: Colors.white))],
        ),
      ),
    );
  }
}
