// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_ytmusic_api/dart_ytmusic_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/injection_container.dart' as di;
import 'package:shimmer/shimmer.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Playlistdetailsyt extends StatefulWidget {
  const Playlistdetailsyt({super.key, required this.playlistDetailed});
  final PlaylistDetailed playlistDetailed;

  @override
  State<Playlistdetailsyt> createState() => _PlaylistdetailsytState();
}

class _PlaylistdetailsytState extends State<Playlistdetailsyt> {
  final yt = di.di<YoutubeExplode>();
  bool isloading = false;
  List<Video> videos = [];

  _get() async {
    setState(() {
      isloading = true;
    });
    await for (var video in yt.playlists.getVideos(
      widget.playlistDetailed.playlistId,
    )) {
      videos.add(video);
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _get();
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
                    imageUrl: widget.playlistDetailed.thumbnails.last.url,
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
                            text: widget.playlistDetailed.name,
                            fontsize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          Textutil(
                            text: widget.playlistDetailed.artist.name,
                            fontsize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          Textutil(
                            text: widget.playlistDetailed.type,
                            fontsize: 14,
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: isloading ? 6 : videos.length,
              itemBuilder: (context, index) {
                if (isloading) {
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
                } else {
                  final data = videos[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CachedNetworkImage(
                      imageUrl: data.thumbnails.mediumResUrl,
                      width: 76,
                      height: 46,
                      fit: BoxFit.fitWidth,
                    ),
                    title: Textutil(
                      text: data.title,
                      fontsize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: Textutil(
                      text: data.author,
                      fontsize: 10,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                    onTap: () {
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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
