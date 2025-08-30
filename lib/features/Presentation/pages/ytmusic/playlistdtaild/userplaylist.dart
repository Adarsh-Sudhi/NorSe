// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_ytmusic_api/dart_ytmusic_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/features/Presentation/pages/saavn/Settings/ytmusiclogin.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/injection_container.dart' as di;

class UserYtPlayer extends StatefulWidget {
  const UserYtPlayer({
    Key? key,
    required this.title,
    required this.des,
    required this.playlistid,
    required this.imageurl,
  }) : super(key: key);
  final String title;
  final String des;
  final String playlistid;
  final String imageurl;

  @override
  State<UserYtPlayer> createState() => _UserYtPlayerState();
}

class _UserYtPlayerState extends State<UserYtPlayer> {
  final yt = di.di<YoutubeExplode>();
  bool isloading = false;

  _getSavedPlaylistsongs() async {
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

    final url = Uri.parse(
      "http://192.168.18.25:8000/getPlaylistsongs?id=${widget.playlistid}",
    );

    final response = await http.post(
      url,

      headers: {"Content-Type": "application/json"},
      body: jsonEncode(headers),
    );

    if (response.statusCode == 200) {
      developer.log(response.body);
      return jsonDecode(response.body);
    } else {
      developer.log('failed respos epo f jb');
    }
  }

  @override
  void initState() {
    super.initState();
    _getSavedPlaylistsongs();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Spaces.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: size.height / 2.5,
              width: size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imageurl,
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
                            text: widget.title,
                            fontsize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          Textutil(
                            text: widget.des,
                            fontsize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spaces.kheight20,
            FutureBuilder(
              future: _getSavedPlaylistsongs(),
              builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.hasData) {
                  final data = (snapshot.data! as Map)['tracks'] as List;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CachedNetworkImage(
                          imageUrl:
                              (data[index]['thumbnails'] as List).last['url'],
                          width: 76,
                          height: 46,
                          fit: BoxFit.fitWidth,
                        ),
                        title: Textutil(
                          text: data[index]['title'],
                          fontsize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: Textutil(
                          text: (data[index]['artists'] as List).first['name'],
                          fontsize: 10,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                        onTap: () async {
                          List<Video> videos = [];

                          for (var vido in data) {
                            Video video = Video(
                              VideoId(vido['videoId'].toString()),
                              vido['title'],
                              (vido['artists'] as List).first['name'],
                              ChannelId('UC2cDmOO_m6sbJhHYhJLeVLQ'),
                              DateTime(2000),
                              'null',
                              DateTime(2000),
                              'null',
                              Duration.zero,
                              ThumbnailSet(vido['videoId']),
                              'sf dsf sd '.characters,
                              Engagement(0, 0, 0),
                              false,
                            );
                            videos.add(video);
                          }

                          Notifiers.showplayer.value = true;

                          BlocProvider.of<AudioBloc>(
                            context,
                          ).add(AudioEvent.started());

                          BlocProvider.of<YoutubePlayerBackgroundBloc>(
                            context,
                          ).add(YoutubePlayerBackgroundEvent.started());

                          BlocProvider.of<AudioBloc>(
                            context,
                          ).add(AudioEvent.ytmusiclisten(videos, index, 'p'));
                        },
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.zero,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: SizedBox(
                            width: 76,
                            height: 36,
                            child: Shimmer.fromColors(
                              period: const Duration(seconds: 1),
                              baseColor: Color(0xFFB0BEC5), // blue gray
                              highlightColor: Color(0xFFCFD8DC),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 3, 33, 57),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                          title: SizedBox(
                            height: 10,
                            width: size.width / 3.4,
                            child: Shimmer.fromColors(
                              period: const Duration(seconds: 1),
                              baseColor: Color(0xFFB0BEC5), // blue gray
                              highlightColor: Color(0xFFCFD8DC),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 3, 33, 57),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          subtitle: SizedBox(
                            height: 8,
                            width: size.width / 3.4,
                            child: Shimmer.fromColors(
                              period: const Duration(seconds: 1),
                              baseColor: Color(0xFFB0BEC5), // blue gray
                              highlightColor: Color(0xFFCFD8DC),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 1, 1, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
