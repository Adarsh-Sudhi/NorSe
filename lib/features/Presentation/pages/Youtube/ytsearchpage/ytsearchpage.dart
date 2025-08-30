// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_ytmusic_api/dart_ytmusic_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:norse/features/Presentation/pages/ytmusic/home/albumpage.dart';
import 'package:norse/features/Presentation/pages/ytmusic/playlistdtaild/playlistdetails.dart';
import 'package:norse/features/Presentation/pages/ytmusic/playlistdtaild/userplaylist.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/custumlistviewbuilder.dart';
import 'package:norse/features/Presentation/pages/Youtube/youtubeplayer/testytplayerscreen.dart';

import '../../../../../configs/notifier/notifiers.dart';
import '../../../Blocs/youtubeBloc/searchyt_bloc/searchyt_bloc_bloc.dart';
import '../../../Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import '../../../Blocs/youtubeBloc/ytrelatedvideos_bloc/ytrelatedvideos_bloc.dart';
import '../../saavn/musicplayerpage/testonlineplayerscreen.dart';

class _TabButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TabButton({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 10),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 9))),
      ],
    );
  }
}

class Ytsearchpage extends StatelessWidget {
  static const String ytsearchpage = "./searchpagescreen";
  Ytsearchpage({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                PlayIcons(
                  playicons: Icons.arrow_back_ios,
                  iconscolors: Colors.white,
                  iconsize: 17,
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Hero(
                    tag: "ytsearch",
                    child: Ytsearchtextformfield(
                      enableFocusMode: true,
                      textEditingController: _textEditingController,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<SearchytBlocBloc, SearchytBlocState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loader:
                        () => const Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    searchedvideo: (
                      videos,
                      songs,
                      playlists,
                      albums,
                      isloading,
                      isfailed,
                    ) {
                      return isloading != true
                          ? DefaultTabController(
                            length: 5,
                            child: Column(
                              children: [
                                Spaces.kheight10,
                                SizedBox(
                                  height: 45,
                                  child: TabBar(
                                    indicator: BoxDecoration(
                                      color: const Color(0xFF222831),
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: Colors.redAccent,
                                        width: 1.2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.redAccent.withValues(
                                            alpha: 0.35,
                                          ),
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    labelColor: Colors.white,
                                    dividerColor: Colors.transparent,
                                    unselectedLabelColor: Colors.white70,
                                    labelStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    unselectedLabelStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                    tabs: const [
                                      _TabButton(
                                        icon: Icons.videocam,
                                        text: " YT Video",
                                      ),

                                      _TabButton(
                                        icon: Icons.audiotrack_outlined,
                                        text: " YT Audio",
                                      ),
                                      _TabButton(
                                        icon: Icons.music_note,
                                        text: "Audio",
                                      ),
                                      // _TabButton(
                                      //   icon: Icons.album,
                                      //   text: "Album",
                                      // ),
                                      _TabButton(
                                        icon: Icons.playlist_play,
                                        text: "Playlist",
                                      ),
                                    ],
                                  ),
                                ),
                                Spaces.kheight10,
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: TabBarView(
                                      children: [
                                        SearchedVideo(videos: videos),
                                        YoutubeAudios(videos: videos),
                                        const SearchAudioWidget(),
                                        /* SearchedAlbums(
                                          albums: albums,
                                          isloading: isloading,
                                        ), */
                                        SearchedPlaylist(
                                          playlists: playlists,
                                          isloading: isloading,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          : const SizedBox();
                    },
                    orElse: () {
                      return SizedBox.expand(
                        child: Center(
                          child: Icon(
                            Ionicons.logo_youtube,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchedPlaylist extends StatelessWidget {
  final bool isloading;
  final List<PlaylistDetailed> playlists;
  const SearchedPlaylist({
    Key? key,
    required this.isloading,
    required this.playlists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isloading && playlists.isNotEmpty) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.2, // Adjust for good layout
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        shrinkWrap: true,
        itemCount: isloading ? 6 : playlists.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          if (isloading) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: const Color(0xFFB0BEC5),
                  highlightColor: const Color(0xFFCFD8DC),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 33, 57),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Shimmer.fromColors(
                  baseColor: const Color(0xFFB0BEC5),
                  highlightColor: const Color(0xFFCFD8DC),
                  child: Container(
                    width: 100,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 33, 57),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Shimmer.fromColors(
                  baseColor: const Color(0xFFB0BEC5),
                  highlightColor: const Color(0xFFCFD8DC),
                  child: Container(
                    width: 80,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 33, 57),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            );
          } else {
            final data = playlists[index];
            return GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Playlistdetailsyt(playlistDetailed: data),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: data.thumbnails.last.url,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Textutil(
                    text: data.name,
                    fontsize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 4),
                  Textutil(
                    text: data.artist.name,
                    fontsize: 10,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            );
          }
        },
      );
    }
    return SizedBox();
  }
}

class SearchedAlbums extends StatelessWidget {
  final List<AlbumDetailed> albums;
  final bool isloading;
  const SearchedAlbums({
    super.key,
    required this.albums,
    required this.isloading,
  });

  @override
  Widget build(BuildContext context) {
    if (!isloading && albums.isNotEmpty) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2 / 2.2, // Adjust based on UI feel
        ),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: isloading ? 6 : albums.length,
        itemBuilder: (context, index) {
          if (isloading) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: const Color(0xFFB0BEC5),
                  highlightColor: const Color(0xFFCFD8DC),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 33, 57),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Shimmer.fromColors(
                  baseColor: const Color(0xFFB0BEC5),
                  highlightColor: const Color(0xFFCFD8DC),
                  child: Container(
                    width: 100,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 33, 57),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Shimmer.fromColors(
                  baseColor: const Color(0xFFB0BEC5),
                  highlightColor: const Color(0xFFCFD8DC),
                  child: Container(
                    width: 80,
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 33, 57),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            );
          } else {
            final data = albums[index];
            return GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlbumPageYt(id: data.albumId),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: data.thumbnails.last.url,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Textutil(
                    text: data.name,
                    fontsize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 4),
                  Textutil(
                    text: data.artist.name,
                    fontsize: 10,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            );
          }
        },
      );
    }
    return const SizedBox();
  }
}

class YoutubeAudios extends StatelessWidget {
  final List<Video> videos;
  const YoutubeAudios({super.key, required this.videos});

  String formatdatetime(DateTime dateTime) {
    String date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListViewBuilderwidget(
      length: videos.length,
      widget: (context, index) {
        return InkWell(
          onTap: () {
            Notifiers.showplayer.value = true;

            BlocProvider.of<AudioBloc>(context).add(AudioEvent.started());

            BlocProvider.of<YoutubePlayerBackgroundBloc>(
              context,
            ).add(YoutubePlayerBackgroundEvent.started());

            BlocProvider.of<AudioBloc>(
              context,
            ).add(AudioEvent.ytmusiclisten(videos, index, 'p'));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 270,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Cachednetimagewidget(
                        thumbnailSet: videos[index].thumbnails,
                      ),
                    ),
                  ),
                  Spaces.kheight20,
                  Textutil(
                    text: videos[index].title,
                    fontsize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  Textutil(
                    text: videos[index].author,
                    fontsize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  Textutil(
                    text:
                        videos[index].uploadDate != null
                            ? formatdatetime(videos[index].uploadDate!)
                            : 'unknown',
                    fontsize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}

class SearchedVideo extends StatelessWidget {
  final List<Video> videos;
  const SearchedVideo({super.key, required this.videos});

  String formatdatetime(DateTime dateTime) {
    String date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListViewBuilderwidget(
      length: videos.length,
      widget: (context, index) {
        return InkWell(
          onTap: () {
            BlocProvider.of<YoutubePlayerBackgroundBloc>(
              context,
            ).add(YoutubePlayerBackgroundEvent.started());
            Notifiers.showplayer.value = false;
            BlocProvider.of<YtrelatedvideosBloc>(context).add(
              YtrelatedvideosEvent.relatedvideos(videos[index].id.toString()),
            );
            BlocProvider.of<YoutubeplayerBloc>(
              context,
            ).add(YoutubeplayerEvent.ytplayerevent(videos, index));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 270,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Cachednetimagewidget(
                        thumbnailSet: videos[index].thumbnails,
                      ),
                    ),
                  ),
                  Spaces.kheight20,
                  Textutil(
                    text: videos[index].title,
                    fontsize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  Textutil(
                    text: videos[index].author,
                    fontsize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  Textutil(
                    text:
                        videos[index].uploadDate != null
                            ? formatdatetime(videos[index].uploadDate!)
                            : 'unknown',
                    fontsize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}

class SearchAudioWidget extends StatelessWidget {
  const SearchAudioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchytBlocBloc, SearchytBlocState>(
      builder: (context, state) {
        Size size = MediaQuery.sizeOf(context);
        return state.maybeWhen(
          searchedvideo: (
            videos,
            songs,
            playlists,
            albums,
            isloading,
            isfailed,
          ) {
            if (!isloading && songs.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,

                itemCount: isloading ? 6 : songs.length,
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
                    final data = songs[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CachedNetworkImage(
                        imageUrl: data.thumbnails.last.url,
                        width: 76,
                        height: 46,
                        fit: BoxFit.fitWidth,
                      ),
                      title: Textutil(
                        text: data.name,
                        fontsize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      subtitle: Textutil(
                        text: data.artist.name,
                        fontsize: 10,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () async {
                        List<Video> videoslist = [];
                        for (var vid in songs) {
                          Video video = Video(
                            VideoId(vid.videoId),
                            vid.name,
                            '',
                            ChannelId('UC2cDmOO_m6sbJhHYhJLeVLQ'),
                            DateTime(2000),
                            'null',
                            DateTime(2000),
                            'null',
                            Duration.zero,
                            ThumbnailSet(vid.videoId),
                            'sf dsf sd '.characters,
                            Engagement(0, 0, 0),
                            false,
                          );
                          videoslist.add(video);
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
                        ).add(AudioEvent.ytmusiclisten(videoslist, index, 's'));
                      },
                    );
                  }
                },
              );
            }
            return SizedBox();
          },
          orElse: () {
            return SizedBox.expand(
              child: Center(child: Image.asset('assets/yt.png', scale: 4)),
            );
          },
        );
      },
    );
  }
}

class Ytsearchtextformfield extends StatefulWidget {
  const Ytsearchtextformfield({
    super.key,
    required TextEditingController textEditingController,
    required this.enableFocusMode,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;
  final bool enableFocusMode;

  @override
  State<Ytsearchtextformfield> createState() => _YtsearchtextformfieldState();
}

class _YtsearchtextformfieldState extends State<Ytsearchtextformfield> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.enableFocusMode ? focusNode.requestFocus() : null;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: TextField(
          controller: widget._textEditingController,

          onSubmitted: (value) {
            BlocProvider.of<SearchytBlocBloc>(
              context,
            ).add(SearchytBlocEvent.getsearchdetails(value));
          },
          style: const TextStyle(color: Colors.white),

          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14),
            hintText: 'Search songs, artists ...',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            border: InputBorder.none,
          ),
          cursorColor: Colors.white,
        ),
      ),
    );
  }
}
