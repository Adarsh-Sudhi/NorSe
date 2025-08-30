// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/recents_bloc/recents_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/searchlibrary_bloc/searchlibrary_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/testonlineplayerscreen.dart';
import '../../../Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import '../../Blocs/Musicbloc/Library/album/libraryalbum/libraryalbum_bloc.dart';
import '../../Blocs/Musicbloc/Library/playlist/libraryplaylist/libraryplaylist_bloc.dart';
import '../../Blocs/Musicbloc/Library/song/library_bloc/library_bloc.dart';
import '../../Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import '../../Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import '../saavn/subscreens/SongDetailsPage/SongDetailsPage.dart';

class Onlinefavscreen extends StatefulWidget {
  static const String onlinefavscreen = './onlinefavscreen';
  const Onlinefavscreen({super.key});

  @override
  State<Onlinefavscreen> createState() => _OnlinefavscreenState();
}

class _OnlinefavscreenState extends State<Onlinefavscreen>
    with SingleTickerProviderStateMixin {
  int currentpage = 0;

  List<String> pages = ['songs', 'albums', 'playlists', 'recently played'];

  PageController controller = PageController();

  final TextEditingController _textEditingController = TextEditingController();

  bool valueisempty = false;

  List<Widget> screen = [
    const OnlineSongs(),
    const OnlineAlbum(),
    const OnlinePlaylist(),
    const RecentlyPlayed(),
  ];

  @override
  void initState() {
    BlocProvider.of<LibraryBloc>(
      context,
    ).add(const LibraryEvent.getlibrarysong());
    BlocProvider.of<LibraryalbumBloc>(
      context,
    ).add(const LibraryalbumEvent.getalbumsongs());
    BlocProvider.of<LibraryplaylistBloc>(
      context,
    ).add(const LibraryplaylistEvent.getlibraryplaylist());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Spaces.backgroundColor,

          title: const Textutil(
            text: 'Library',
            fontsize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          actions: [
            PlayIcons(
              playicons: Icons.search,
              iconscolors: Colors.white,
              iconsize: 23,
              ontap: () {
                Notifiers.isSongSearchonVisible.value =
                    !Notifiers.isSongSearchonVisible.value;
              },
            ),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              const BackgroundLibrary(),
              SafeArea(
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: Notifiers.isSongSearchonVisible,
                      builder: (context, value, child) {
                        return SizedBox(
                          height: value ? 50 : 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 1,
                                ),
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() => valueisempty = true);
                                    } else {
                                      setState(() => valueisempty = false);
                                      BlocProvider.of<SearchlibraryBloc>(
                                        context,
                                      ).add(
                                        SearchlibraryEvent.querylibrarysongs(
                                          value,
                                        ),
                                      );
                                    }
                                  },
                                  style: Spaces.Getstyle(
                                    15,
                                    Colors.black,
                                    FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 14),
                                    hintText: "Search song",
                                    prefixIcon: PlayIcons(
                                      playicons: Icons.search,
                                      iconscolors: Colors.black,
                                      iconsize: 25,
                                      ontap: () {},
                                    ),
                                    hintStyle: Spaces.Getstyle(
                                      15,
                                      Colors.grey.withValues(alpha: 0.7),
                                      FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Spaces.kheight10,
                    Expanded(
                      child: BlocBuilder<SearchlibraryBloc, SearchlibraryState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            onRearch: (stream) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: double.infinity,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      itemCount: pages.length,
                                      itemBuilder: (context, index) {
                                        final isSelected = currentpage == index;

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            right: 12,
                                          ),
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.easeOutQuint,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color:
                                                  isSelected
                                                      ? const Color(0xFF222831)
                                                      : const Color(0xFF121417),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                      isSelected
                                                          ? Colors.redAccent
                                                              .withValues(
                                                                alpha: 0.35,
                                                              )
                                                          : Colors.black
                                                              .withValues(
                                                                alpha: 0.3,
                                                              ),
                                                  blurRadius:
                                                      isSelected ? 10 : 6,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                              border:
                                                  isSelected
                                                      ? Border.all(
                                                        color: Colors.redAccent,
                                                        width: 1.2,
                                                      )
                                                      : null,
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              onTap: () {
                                                setState(() {
                                                  currentpage = index;
                                                });
                                                controller.animateToPage(
                                                  index,
                                                  duration: const Duration(
                                                    milliseconds: 400,
                                                  ),
                                                  curve: Curves.easeInOutCubic,
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 10,
                                                    ),
                                                child: Row(
                                                  children: [
                                                    AnimatedOpacity(
                                                      duration: const Duration(
                                                        milliseconds: 300,
                                                      ),
                                                      opacity:
                                                          isSelected ? 1 : 0.6,
                                                      child: Icon(
                                                        index == 0
                                                            ? Icons.music_note
                                                            : index == 1
                                                            ? Icons.album
                                                            : Icons.queue_music,
                                                        size: 16,
                                                        color:
                                                            isSelected
                                                                ? Colors
                                                                    .redAccent
                                                                : Colors
                                                                    .white70,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Textutil(
                                                      text: pages[index],
                                                      fontsize: 13,
                                                      color:
                                                          isSelected
                                                              ? Colors.white
                                                              : Colors.white70,
                                                      fontWeight:
                                                          isSelected
                                                              ? FontWeight.w600
                                                              : FontWeight.w400,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: StreamBuilder(
                                      stream: stream,
                                      builder: (context, snapshot) {
                                        if (snapshot.data != null &&
                                            snapshot.hasData) {
                                          return valueisempty
                                              ? Stack(
                                                fit: StackFit.expand,
                                                alignment: Alignment.center,
                                                children: [
                                                  const BackgroundLibrary(),
                                                  PageView(
                                                    controller: controller,
                                                    onPageChanged: (value) {
                                                      setState(
                                                        () =>
                                                            currentpage = value,
                                                      );
                                                    },
                                                    children: screen,
                                                  ),
                                                ],
                                              )
                                              : Stack(
                                                fit: StackFit.expand,
                                                alignment: Alignment.center,
                                                children: [
                                                  const BackgroundLibrary(),
                                                  PageView(
                                                    controller: controller,
                                                    onPageChanged: (value) {
                                                      setState(
                                                        () =>
                                                            currentpage = value,
                                                      );
                                                    },
                                                    children: [
                                                      Search0(
                                                        snapshot: snapshot,
                                                      ),
                                                      Search1(
                                                        albums:
                                                            snapshot.data![1],
                                                      ),
                                                      Search2(
                                                        playlist:
                                                            snapshot.data![2],
                                                      ),
                                                      Seach3(
                                                        recents:
                                                            snapshot.data![3],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                        } else {
                                          return Stack(
                                            fit: StackFit.expand,
                                            alignment: Alignment.center,
                                            children: [
                                              const BackgroundLibrary(),
                                              PageView(
                                                controller: controller,
                                                onPageChanged: (value) {
                                                  setState(() {
                                                    currentpage = value;
                                                  });
                                                },
                                                children: screen,
                                              ),
                                            ],
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                            orElse: () {
                              return libraryNormalState();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column libraryNormalState() {
    return Column(
      children: [
        SizedBox(
          height: 40,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: pages.length,
            itemBuilder: (context, index) {
              final isSelected = currentpage == index;

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutQuint,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:
                        isSelected
                            ? const Color(0xFF222831)
                            : const Color(0xFF121417),
                    boxShadow: [
                      BoxShadow(
                        color:
                            isSelected
                                ? Colors.redAccent.withValues(alpha: .35)
                                : Colors.black.withValues(alpha: 0.3),
                        blurRadius: isSelected ? 10 : 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border:
                        isSelected
                            ? Border.all(color: Colors.redAccent, width: 1.2)
                            : null,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(() {
                        currentpage = index;
                      });
                      controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: isSelected ? 1 : 0.6,
                            child: Icon(
                              index == 0
                                  ? Icons.music_note
                                  : index == 1
                                  ? Icons.album
                                  : Icons.queue_music,
                              size: 16,
                              color:
                                  isSelected
                                      ? Colors.redAccent
                                      : Colors.white70,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Textutil(
                            text: pages[index],
                            fontsize: 13,
                            color: isSelected ? Colors.white : Colors.white70,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              const BackgroundLibrary(),
              PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentpage = value;
                  });
                },
                children: screen,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BackgroundLibrary extends StatelessWidget {
  const BackgroundLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black);
  }
}

class Search0 extends StatelessWidget {
  const Search0({super.key, required this.snapshot});

  final AsyncSnapshot<List<List<Map<String, dynamic>>>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data![0].length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final data = snapshot.data![0][index];
        return InkWell(
          onTap: () {
            List<AlbumSongEntity> songs = [];
            for (var song in snapshot.data![0]) {
              AlbumSongEntity songEntity = AlbumSongEntity(
                type: data['type'],
                id: song['id'],
                name: song['name'],
                year: 'null',
                primaryArtists: song['artist'],
                image: song['image'],
                songs: song['uri'],
                albumurl: song['uri'],
              );
              songs.add(songEntity);
            }
            BlocProvider.of<AudioBloc>(context).add(
              AudioEvent.onlineaudio(
                songs[index].id,
                index,
                songs[index].songs,
                songs[index].image,
                songs[index].name,
                songs[index].primaryArtists,
                const [],
                songs,
                const [],
                const [],
              ),
            );
          },
          child: OnlineFevSongTiles(
            remove: () {
              BlocProvider.of<LibraryBloc>(
                context,
              ).add(LibraryEvent.removesongfromlib(data['id']));
            },
            show: true,
            title: data['name'],
            uri: data['uri'],
            image: data['image'],
            artist: data['artist'],
            play: () {
              List<AlbumSongEntity> songs = [];

              for (var song in snapshot.data![0]) {
                AlbumSongEntity songEntity = AlbumSongEntity(
                  type: data['type'],
                  id: song['id'],
                  name: song['name'],
                  year: 'null',
                  primaryArtists: song['artist'],
                  image: song['image'],
                  songs: song['uri'],
                  albumurl: song['uri'],
                );
                songs.add(songEntity);
              }
              BlocProvider.of<AudioBloc>(context).add(
                AudioEvent.onlineaudio(
                  songs[index].id,
                  index,
                  songs[index].songs,
                  songs[index].image,
                  songs[index].name,
                  songs[index].primaryArtists,
                  const [],
                  songs,
                  const [],
                  const [],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class Search1 extends StatelessWidget {
  const Search1({super.key, required this.albums});

  final List<Map<String, dynamic>> albums;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              SongDetailsPage.SongDetials,
              arguments: SongDetailsPage(
                type: 'album',
                imageurl: albums[index]['image'],
                albumurl: albums[index]['url'],
                name: albums[index]['name'],
                id: albums[index]['id'],
              ),
            );
          },
          child: PlaylistandAlbumtiles(
            name: albums[index]['name'],
            imageurl: albums[index]['image'],
            type: 'Album',
          ),
        );
      },
    );
  }
}

class Search2 extends StatelessWidget {
  const Search2({super.key, required this.playlist});
  final List<Map<String, dynamic>> playlist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: playlist.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              SongDetailsPage.SongDetials,
              arguments: SongDetailsPage(
                type: 'playlist',
                imageurl: playlist[index]['image'],
                albumurl: playlist[index]['url'],
                name: playlist[index]['name'],
                id: playlist[index]['id'],
              ),
            );
          },
          child: PlaylistandAlbumtiles(
            name: playlist[index]['name'],
            imageurl: playlist[index]['image'],
            type: 'Playlist',
          ),
        );
      },
    );
  }
}

class Seach3 extends StatelessWidget {
  const Seach3({super.key, required this.recents});

  final List<Map<String, dynamic>> recents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recents.length,
      itemBuilder: (context, index) {
        final data = recents[index];
        return InkWell(
          onTap: () {
            List<AlbumSongEntity> songs = [];
            songs.clear();
            for (var song in recents) {
              AlbumSongEntity songEntity = AlbumSongEntity(
                type: data['type'],
                id: song['id'],
                name: song['title'],
                year: 'null',
                primaryArtists: song['artist'],
                image: song['imageurl'],
                songs: song['downloadurl'],
                albumurl: song['downloadurl'],
              );
              songs.add(songEntity);
            }

            BlocProvider.of<AudioBloc>(context).add(
              AudioEvent.onlineaudio(
                songs[index].id,
                index,
                songs[index].songs,
                songs[index].image,
                songs[index].name,
                songs[index].primaryArtists,
                const [],
                songs,
                const [],
                const [],
              ),
            );
          },
          child: OnlineFevSongTiles(
            remove: () {
              log('caaa');
              BlocProvider.of<RecentsBloc>(
                context,
              ).add(RecentsEvent.removesong(data['id']));
            },
            show: true,
            title: data['title'],
            image: data['imageurl'],
            artist: data['artist'],
            uri: data['downloadurl'],
            play: () {
              List<AlbumSongEntity> songs = [];
              songs.clear();
              for (var song in recents) {
                AlbumSongEntity songEntity = AlbumSongEntity(
                  type: data['type'],
                  id: song['id'],
                  name: song['title'],
                  year: 'null',
                  primaryArtists: song['artist'],
                  image: song['imageurl'],
                  songs: song['downloadurl'],
                  albumurl: song['downloadurl'],
                );
                songs.add(songEntity);
              }

              BlocProvider.of<AudioBloc>(context).add(
                AudioEvent.onlineaudio(
                  songs[index].id,
                  index,
                  songs[index].songs,
                  songs[index].image,
                  songs[index].name,
                  songs[index].primaryArtists,
                  const [],
                  songs,
                  const [],
                  const [],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class OnlinePlaylist extends StatelessWidget {
  const OnlinePlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryplaylistBloc, LibraryplaylistState>(
      builder: (context, state) {
        return state.maybeWhen(
          playlists: (playlist) {
            return playlist.isNotEmpty
                ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: playlist.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return SongDetailsPage(
                                      type: 'playlist',
                                      imageurl: playlist[index]['image'],
                                      albumurl: playlist[index]['url'],
                                      name: playlist[index]['name'],
                                      id: playlist[index]['id'],
                                    );
                                  },
                                ),
                              );
                            },
                            child: PlaylistandAlbumtiles(
                              name: playlist[index]['name'],
                              imageurl: playlist[index]['image'],
                              type: 'Playlist',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
                : const Nullstate();
          },
          orElse: () => const Nullstate(),
        );
      },
    );
  }
}

class OnlineAlbum extends StatelessWidget {
  const OnlineAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryalbumBloc, LibraryalbumState>(
      builder: (context, state) {
        return state.maybeWhen(
          libraryalbums: (albums) {
            return albums.isNotEmpty
                ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: albums.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return SongDetailsPage(
                                      type: 'album',
                                      imageurl: albums[index]['image'],
                                      albumurl: albums[index]['url'],
                                      name: albums[index]['name'],
                                      id: albums[index]['id'],
                                    );
                                  },
                                ),
                              );
                            },
                            child: PlaylistandAlbumtiles(
                              name: albums[index]['name'],
                              imageurl: albums[index]['image'],
                              type: 'Album',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
                : const Nullstate();
          },
          orElse: () {
            return const Nullstate();
          },
        );
      },
    );
  }
}

class PlaylistandAlbumtiles extends StatelessWidget {
  const PlaylistandAlbumtiles({
    super.key,
    required this.name,
    required this.imageurl,
    required this.type,
  });
  final String name;
  final String imageurl;
  final String type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
        child: Row(
          children: [
            Container(
              height: 64,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: imageurl,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textutil(
                    text: name,
                    fontsize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  Textutil(
                    text: type,
                    fontsize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NullstateLocal extends StatelessWidget {
  const NullstateLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Downloads Empty',
            style: GoogleFonts.aldrich(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class Nullstate extends StatelessWidget {
  const Nullstate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nothing Liked Yet',
            style: GoogleFonts.aldrich(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 15,
            ),
          ),
          Text(
            'Start liking to build your list',
            style: GoogleFonts.aldrich(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class OnlineSongs extends StatelessWidget {
  const OnlineSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          return state.maybeWhen(
            librarysong: (librarysong) {
              return librarysong.isEmpty
                  ? const Nullstate()
                  : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: librarysong.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final data = librarysong[index];
                            return InkWell(
                              onTap: () {
                                BlocProvider.of<YoutubePlayerBackgroundBloc>(
                                  context,
                                ).add(YoutubePlayerBackgroundEvent.started());
                                List<AlbumSongEntity> songs = [];
                                for (var song in librarysong) {
                                  log(song['type']);
                                  AlbumSongEntity songEntity = AlbumSongEntity(
                                    type: song['type'],
                                    id: song['id'],
                                    name: song['name'],
                                    year: 'null',
                                    primaryArtists: song['artist'],
                                    image: song['image'],
                                    songs: song['uri'],
                                    albumurl: 'empty',
                                  );
                                  songs.add(songEntity);
                                }

                                log(songs.length.toString());

                                BlocProvider.of<YoutubeplayerBloc>(
                                  context,
                                ).add(const YoutubeplayerEvent.switchevent());
                                BlocProvider.of<AudioBloc>(context).add(
                                  AudioEvent.onlineaudio(
                                    songs[index].id,
                                    0,
                                    songs[index].songs,
                                    songs[index].image,
                                    songs[index].name,
                                    songs[index].primaryArtists,
                                    const [],
                                    [songs[index]],
                                    const [],
                                    const [],
                                  ),
                                );
                              },
                              child: OnlineFevSongTiles(
                                remove: () {
                                  BlocProvider.of<LibraryBloc>(context).add(
                                    LibraryEvent.removesongfromlib(data['id']),
                                  );
                                },
                                show: true,
                                title: data['name'],
                                uri: data['uri'],
                                image: data['image'],
                                artist: data['artist'],
                                play: () {
                                  List<AlbumSongEntity> songs = [];

                                  for (var song in librarysong) {
                                    AlbumSongEntity songEntity =
                                        AlbumSongEntity(
                                          type: data['type'],
                                          id: song['id'],
                                          name: song['name'],
                                          year: 'null',
                                          primaryArtists: song['artist'],
                                          image: song['image'],
                                          songs: song['uri'],
                                          albumurl: song['uri'],
                                        );
                                    songs.add(songEntity);
                                  }
                                  BlocProvider.of<AudioBloc>(context).add(
                                    AudioEvent.onlineaudio(
                                      songs[index].id,
                                      index,
                                      songs[index].songs,
                                      songs[index].image,
                                      songs[index].name,
                                      songs[index].primaryArtists,
                                      const [],
                                      songs,
                                      const [],
                                      const [],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
            },
            orElse: () => const Nullstate(),
          );
        },
      ),
    );
  }
}

class RecentlyPlayed extends StatefulWidget {
  const RecentlyPlayed({super.key});

  @override
  State<RecentlyPlayed> createState() => _RecentlyPlayedState();
}

class _RecentlyPlayedState extends State<RecentlyPlayed> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecentsBloc>(
      context,
    ).add(const RecentsEvent.getallrecent());
    return BlocBuilder<RecentsBloc, RecentsState>(
      builder: (context, state) {
        return state.maybeWhen(
          recents: (recents) {
            return recents.isEmpty
                ? const Nullstate()
                : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: recents.length,
                        itemBuilder: (context, itemIndex) {
                          final data = recents[itemIndex];
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<
                                  YoutubePlayerBackgroundBloc
                              >(context).add(
                                YoutubePlayerBackgroundEvent.started(),
                              );
                              Notifiers.showplayer.value = true;
                              List<AlbumSongEntity> allsongs = [];
                              for (var element in recents) {
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
                            child: OnlineFevSongTiles(
                              remove: () {
                                log('caaa');
                                BlocProvider.of<RecentsBloc>(
                                  context,
                                ).add(RecentsEvent.removesong(data['id']));
                              },
                              show: true,
                              title: data['title'],
                              image: data['imageurl'],
                              artist: data['artist'],
                              uri: data['downloadurl'],
                              play: () {
                                BlocProvider.of<
                                    YoutubePlayerBackgroundBloc
                                >(context).add(
                                 const YoutubePlayerBackgroundEvent.started(),
                                );
                                Notifiers.showplayer.value = true;
                                List<AlbumSongEntity> allsongs = [];
                                for (var element in recents) {
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
          },
          orElse: () => const Nullstate(),
        );
      },
    );
  }
}

class OnlineFevSongTiles extends StatelessWidget {
  const OnlineFevSongTiles({
    super.key,
    required this.title,
    required this.uri,
    required this.image,
    required this.artist,
    required this.play,
    required this.show,
    required this.remove,
  });

  final String title;
  final String uri;
  final String image;
  final String artist;
  final VoidCallback play;
  final bool show;
  final VoidCallback remove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10, right: 10),
      title: Text(
        title,
        style: Spaces.Getstyle(15, Colors.white, FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle:
          show
              ? Text(
                artist,
                style: Spaces.Getstyle(10, Colors.white, FontWeight.normal),
                overflow: TextOverflow.ellipsis,
              )
              : const Textutil(
                text: '',
                fontsize: 5,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
      trailing:
          show
              ? PopupMenuButton(
                itemBuilder: (BuildContext contex) {
                  return [
                    PopupMenuItem(onTap: play, child: const Text('play')),
                    PopupMenuItem(onTap: remove, child: const Text('remove')),
                  ];
                },
              )
              : null,
      leading: Container(
        padding: EdgeInsets.zero,
        height: 70,
        width: 60,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: CachedNetworkImage(imageUrl: image, fit: BoxFit.cover),
      ),
    );
  }
}
