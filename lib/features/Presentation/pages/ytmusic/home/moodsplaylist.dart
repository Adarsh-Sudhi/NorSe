// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Presentation/pages/Youtube/youtubescreen/ytpage.dart';
import 'package:norse/features/Presentation/pages/saavn/Settings/ytmusiclogin.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/home.dart';
import 'package:norse/features/Presentation/pages/ytmusic/playlistdtaild/playlistdetails.dart';
import 'package:norse/features/Presentation/pages/ytmusic/playlistdtaild/userplaylist.dart';

class Moodsplaylist extends StatefulWidget {
  const Moodsplaylist({super.key, required this.param, required this.title});
  final String param;
  final String title;

  @override
  State<Moodsplaylist> createState() => _MoodsplaylistState();
}

class _MoodsplaylistState extends State<Moodsplaylist> {
  List? playlists;

  _getmoodplaylist() async {
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
      "http://192.168.18.25:8000/getmoodplaylists?id=${widget.param}",
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(headers),
    );

    if (response.statusCode == 200) {
      final overalldata = jsonDecode(response.body);

      playlists = overalldata;

      developer.log(playlists!.length.toString());

      setState(() {});
    } else {
      developer.log('failed respos epo f jb');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getmoodplaylist();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Spaces.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Textutil(
          text: widget.title,
          fontsize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            playlists != null && playlists!.isNotEmpty
                ? GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: playlists!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => UserYtPlayer(
                                  title: playlists![index]['title'],
                                  des: playlists![index]['description'],
                                  playlistid: playlists![index]['playlistId'],
                                  imageurl:
                                      (playlists![index]['thumbnails'] as List)
                                          .last['url'],
                                ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      (playlists![index]['thumbnails'] as List)
                                          .last['url'],
                                ),
                              ),
                              Textutil(
                                text: playlists![index]['title'],
                                fontsize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              Textutil(
                                text: playlists![index]['description'],
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
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
