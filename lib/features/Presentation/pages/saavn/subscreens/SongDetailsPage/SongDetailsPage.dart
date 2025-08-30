import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Data/Models/MusicModels/onlinesongmodel.dart';
import 'package:norse/injection_container.dart' as di;
import '../../../../../Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import '../../../../../Domain/UseCases/Sql_UseCase/addtodownloads_Usecase.dart';
import '../../../../Blocs/Musicbloc/Albumsongs/albums_songs_bloc.dart';
import '../../../../Blocs/Musicbloc/Library/album/libraryalbum/libraryalbum_bloc.dart';
import '../../../../Blocs/Musicbloc/Library/album/libraryalbumlike/libraryalbumlike_bloc.dart';
import '../../../../Blocs/Musicbloc/Library/playlist/libraryplaylist/libraryplaylist_bloc.dart';
import '../../../../Blocs/Musicbloc/Library/playlist/libraryplaylistlike/libraryplaylistlike_bloc.dart';
import '../../../../Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import '../../musicplayerpage/testonlineplayerscreen.dart';

class SongDetailsPage extends StatefulWidget {
  static const String SongDetials = '/SongDetailPage';
  const SongDetailsPage({
    super.key,
    required this.imageurl,
    required this.albumurl,
    required this.name,
    required this.id,
    required this.type,
  });
  final String imageurl;
  final String albumurl;
  final String name;
  final String id;
  final String type;
  @override
  State<SongDetailsPage> createState() => _SongDetailsPageState();
}

class _SongDetailsPageState extends State<SongDetailsPage> {
  @override
  void initState() {
    super.initState();
    if (widget.type == 'album') {
      BlocProvider.of<AlbumsSongsBloc>(
        context,
      ).add(GetAlbumSongsEvent(albumurl: widget.albumurl));
      BlocProvider.of<LibraryalbumlikeBloc>(
        context,
      ).add(LibraryalbumlikeEvent.checkforalbum(widget.id));
    } else if (widget.type == 'playlist') {
      BlocProvider.of<AlbumsSongsBloc>(
        context,
      ).add(GetPlaylistsSongsEvent(id: widget.id));
      BlocProvider.of<LibraryplaylistlikeBloc>(
        context,
      ).add(LibraryplaylistlikeEvent.chechifplaylistavai(widget.id));
    }
  }

  _calllibrary() {
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      BlocProvider.of<LibraryalbumBloc>(
        context,
      ).add(const LibraryalbumEvent.getalbumsongs());
    });
  }

  _callplaylist() {
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      BlocProvider.of<LibraryplaylistBloc>(
        context,
      ).add(const LibraryplaylistEvent.getlibraryplaylist());
    });
  }

  _addetails(String name, String image, String id, String url, String type) {
    AlbumElements albumElements = AlbumElements(
      id: id,
      name: name,
      year: 'NULL',
      type: 'null',
      language: 'null',
      Artist: 'null',
      url: url,
      image: image.replaceAll('150x150', '500x500'),
    );

    type == "album"
        ? BlocProvider.of<LibraryalbumlikeBloc>(
          context,
        ).add(LibraryalbumlikeEvent.addtolibrary('album', albumElements))
        : BlocProvider.of<LibraryplaylistlikeBloc>(
          context,
        ).add(LibraryplaylistlikeEvent.addtolibrary('playlist', albumElements));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            BlocBuilder<AlbumsSongsBloc, AlbumsSongsState>(
              builder: (context, state) {
                if (state is AlbumsSongsloading) {
                  return SizedBox.expand(
                    child: Songslistloading(size: size, show: true),
                  );
                } else if (state is AlbumsSongsloaded) {
                  return Stack(
                    children: [
                      CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          SliverAppBar(
                            surfaceTintColor: Colors.transparent,
                            leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            pinned: true,
                            expandedHeight: size.height / 2.5,
                            stretch: true,
                            foregroundColor: Colors.transparent,
                            automaticallyImplyLeading: false,
                            backgroundColor: Colors.transparent,
                            flexibleSpace: FlexibleSpaceBar(
                              stretchModes: const [
                                StretchMode.zoomBackground,
                                StretchMode.fadeTitle,
                              ],
                              background: Stack(
                                fit: StackFit.expand,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: widget.imageurl.replaceAll(
                                      '150x150',
                                      '500x500',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black,
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Textutil(
                                              text: widget.name,
                                              fontsize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            Row(
                                              children: [
                                                Textutil(
                                                  text: "${widget.type}  •  ",
                                                  fontsize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                Textutil(
                                                  text:
                                                      "songs ${state.songs.length}",
                                                  fontsize: 10,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          BlocBuilder<
                                            LibraryalbumlikeBloc,
                                            LibraryalbumlikeState
                                          >(
                                            builder: (context, state) {
                                              return state.maybeWhen(
                                                ispresent: (ispresent) {
                                                  return ispresent
                                                      ? IconButton(
                                                        onPressed: () {
                                                          _addetails(
                                                            widget.name,
                                                            widget.imageurl,
                                                            widget.id,
                                                            widget.albumurl,
                                                            'album',
                                                          );
                                                          _calllibrary();
                                                        },
                                                        icon: const Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                          size: 27,
                                                        ),
                                                      )
                                                      : IconButton(
                                                        onPressed: () {
                                                          _addetails(
                                                            widget.name,
                                                            widget.imageurl,
                                                            widget.id,
                                                            widget.albumurl,
                                                            'album',
                                                          );
                                                          _calllibrary();
                                                        },
                                                        icon: const Icon(
                                                          Icons.favorite,
                                                          color: Colors.white,
                                                          size: 27,
                                                        ),
                                                      );
                                                },
                                                removed: () {
                                                  return IconButton(
                                                    onPressed: () {
                                                      _addetails(
                                                        widget.name,
                                                        widget.imageurl,
                                                        widget.id,
                                                        widget.albumurl,
                                                        'album',
                                                      );
                                                      _calllibrary();
                                                    },
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 27,
                                                    ),
                                                  );
                                                },
                                                added: () {
                                                  return IconButton(
                                                    onPressed: () {
                                                      _addetails(
                                                        widget.name,
                                                        widget.imageurl,
                                                        widget.id,
                                                        widget.albumurl,
                                                        'album',
                                                      );
                                                      _calllibrary();
                                                    },
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 27,
                                                    ),
                                                  );
                                                },
                                                orElse:
                                                    () => IconButton(
                                                      onPressed: () {
                                                        _addetails(
                                                          widget.name,
                                                          widget.imageurl,
                                                          widget.id,
                                                          widget.albumurl,
                                                          'album',
                                                        );
                                                        _calllibrary();
                                                      },
                                                      icon: const Icon(
                                                        Icons.favorite,
                                                        color: Colors.white,
                                                        size: 27,
                                                      ),
                                                    ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.only(bottom: 20),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: state.songs.length,
                                (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Notifiers.showplayer.value = true;

                                      BlocProvider.of<AudioBloc>(
                                        context,
                                      ).add(AudioEvent.started());
                                      Recents(
                                        state.songs,
                                        index,
                                        context,
                                        widget.name,
                                      );

                                      BlocProvider.of<
                                        YoutubePlayerBackgroundBloc
                                      >(context).add(
                                        YoutubePlayerBackgroundEvent.started(),
                                      );

                                      //BlocProvider.of<YoutubeplayerBloc>(context)
                                      //    .add(const YoutubeplayerEvent
                                      //s       .switchevent());

                                      BlocProvider.of<AudioBloc>(context).add(
                                        AudioEvent.onlineaudio(
                                          state.songs[index].id,
                                          0,
                                          state.songs[index].songs,
                                          state.songs[index].image,
                                          widget.name,
                                          state.songs[index].primaryArtists,
                                          const [],
                                          [state.songs[index]],
                                          const [],
                                          const [],
                                        ),
                                      );
                                    },
                                    child: Songtiles(
                                      name: state.songs[index].name,
                                      image: state.songs[index].image,
                                      artist: state.songs[index].primaryArtists,
                                      icons1: Ionicons.add_circle_outline,
                                      icons2: Ionicons.download,
                                      visible1: true,
                                      visible2: true,
                                      ontapqueue: () {
                                        OnlineSongModel
                                        onlineSongModel = OnlineSongModel(
                                          album: widget.name,
                                          id: state.songs[index].id,
                                          title: state.songs[index].name,
                                          imageurl: state.songs[index].image,
                                          downloadurl: state.songs[index].songs,
                                          artist:
                                              state.songs[index].primaryArtists,
                                        );
                                        BlocProvider.of<AudioBloc>(context).add(
                                          AudioEvent.addtonlinequeue(
                                            'online',
                                            onlineSongModel,
                                          ),
                                        );
                                      },
                                      ontap: () async {
                                        final data = state.songs[index];
                                        AlbumElements albumElements =
                                            AlbumElements(
                                              id: data.id,
                                              name: data.name,
                                              year: data.year,
                                              type: widget.name,
                                              language: 'null',
                                              Artist: data.primaryArtists,
                                              url: data.songs,
                                              image: data.image,
                                            );
                                        await di
                                            .di<addtodownloadsUsecase>()
                                            .call(albumElements);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (state is playlistsongs) {
                  return Stack(
                    children: [
                      CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          SliverAppBar(
                            surfaceTintColor: Colors.transparent,
                            leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            stretch: true,
                            pinned: true,
                            expandedHeight: size.height / 2.5,
                            foregroundColor: Colors.transparent,
                            automaticallyImplyLeading: false,
                            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                            flexibleSpace: FlexibleSpaceBar(
                              stretchModes: const [StretchMode.zoomBackground],
                              collapseMode: CollapseMode.parallax,
                              background: Stack(
                                fit: StackFit.expand,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: widget.imageurl.replaceAll(
                                      '150x150',
                                      '500x500',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black,
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Textutil(
                                              text: widget.name,
                                              fontsize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            Row(
                                              children: [
                                                Textutil(
                                                  text: "${widget.type}  •  ",
                                                  fontsize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                Textutil(
                                                  text:
                                                      "songs ${state.songs.length}",
                                                  fontsize: 10,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          BlocBuilder<
                                            LibraryplaylistlikeBloc,
                                            LibraryplaylistlikeState
                                          >(
                                            builder: (context, state) {
                                              return state.maybeWhen(
                                                ifpresent: (ispresent) {
                                                  if (ispresent) {
                                                    return IconButton(
                                                      onPressed: () {
                                                        _addetails(
                                                          widget.name,
                                                          widget.imageurl,
                                                          widget.id,
                                                          widget.albumurl,
                                                          'playlist',
                                                        );
                                                        _callplaylist();
                                                      },
                                                      icon: const Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                        size: 27,
                                                      ),
                                                    );
                                                  } else {
                                                    return IconButton(
                                                      onPressed: () {
                                                        _addetails(
                                                          widget.name,
                                                          widget.imageurl,
                                                          widget.id,
                                                          widget.albumurl,
                                                          'playlist',
                                                        );
                                                        _callplaylist();
                                                      },
                                                      icon: const Icon(
                                                        Icons.favorite,
                                                        color: Colors.white,
                                                        size: 27,
                                                      ),
                                                    );
                                                  }
                                                },
                                                removed: () {
                                                  return IconButton(
                                                    onPressed: () {
                                                      _addetails(
                                                        widget.name,
                                                        widget.imageurl,
                                                        widget.id,
                                                        widget.albumurl,
                                                        'playlist',
                                                      );
                                                      _callplaylist();
                                                    },
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 27,
                                                    ),
                                                  );
                                                },
                                                added: () {
                                                  return IconButton(
                                                    onPressed: () {
                                                      _addetails(
                                                        widget.name,
                                                        widget.imageurl,
                                                        widget.id,
                                                        widget.albumurl,
                                                        'playlist',
                                                      );
                                                      _callplaylist();
                                                    },
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 27,
                                                    ),
                                                  );
                                                },
                                                orElse: () {
                                                  return IconButton(
                                                    onPressed: () {
                                                      _addetails(
                                                        widget.name,
                                                        widget.imageurl,
                                                        widget.id,
                                                        widget.albumurl,
                                                        'playlist',
                                                      );
                                                      _callplaylist();
                                                    },
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 27,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.only(bottom: 20),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: state.songs.length,
                                (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Notifiers.showplayer.value = true;

                                      List<Map> moreinfo = [];
                                      moreinfo.isNotEmpty
                                          ? moreinfo.clear()
                                          : null;

                                      for (var itemss in state.songs) {
                                        moreinfo.add(itemss.more_info);
                                      }

                                      Recents(
                                        state.songs,
                                        index,
                                        context,
                                        widget.name,
                                      );

                                      BlocProvider.of<YoutubeplayerBloc>(
                                        context,
                                      ).add(
                                        const YoutubeplayerEvent.switchevent(),
                                      );

                                      BlocProvider.of<
                                        YoutubePlayerBackgroundBloc
                                      >(context).add(
                                        YoutubePlayerBackgroundEvent.started(),
                                      );

                                      BlocProvider.of<AudioBloc>(context).add(
                                        AudioEvent.onlineaudio(
                                          state.songs[index].id,
                                          index,
                                          state.songs[index].downloadUrl,
                                          state.songs[index].images,
                                          widget.name,
                                          state.songs[index].primaryArtists,
                                          moreinfo,
                                          const [],
                                          const [],
                                          state.songs,
                                        ),
                                      );
                                    },
                                    child: Songtiles(
                                      name: state.songs[index].name,
                                      image: state.songs[index].images,
                                      artist: state.songs[index].primaryArtists,
                                      icons1: Ionicons.add_circle_outline,
                                      icons2: Ionicons.download,
                                      visible1: true,
                                      visible2: true,
                                      ontapqueue: () {
                                        OnlineSongModel
                                        onlineSongModel = OnlineSongModel(
                                          album:
                                              state
                                                  .songs[index]
                                                  .more_info['more_info']['music'],
                                          id: state.songs[index].id,
                                          title: state.songs[index].name,
                                          imageurl: state.songs[index].images,
                                          downloadurl:
                                              state.songs[index].downloadUrl,
                                          artist:
                                              state.songs[index].primaryArtists,
                                        );
                                        BlocProvider.of<AudioBloc>(context).add(
                                          AudioEvent.addtonlinequeue(
                                            'online',
                                            onlineSongModel,
                                          ),
                                        );
                                      },
                                      ontap: () async {
                                        final data = state.songs[index];
                                        AlbumElements
                                        albumElements = AlbumElements(
                                          id: data.id,
                                          name: data.name,
                                          year: 'null',
                                          type:
                                              data.more_info['more_info']['music'],
                                          language: 'null',
                                          Artist: data.primaryArtists,
                                          url: data.downloadUrl,
                                          image: data.images,
                                        );
                                        await di
                                            .di<addtodownloadsUsecase>()
                                            .call(albumElements);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Songslistloading extends StatelessWidget {
  const Songslistloading({super.key, required this.size, required this.show});
  final Size size;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              surfaceTintColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              stretch: true,
              pinned: true,
              expandedHeight: size.height / 2.5,
              foregroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.zoomBackground],
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Shimmer.fromColors(
                      period: const Duration(seconds: 1),
                      baseColor: Color(0xFFB0BEC5), // blue gray
                      highlightColor: Color(0xFFCFD8DC),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 67, 67, 67),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                                width: size.width / 2,
                                child: Shimmer.fromColors(
                                  period: const Duration(seconds: 1),
                                  baseColor: Color(0xFFB0BEC5), // blue gray
                                  highlightColor: Color(0xFFCFD8DC),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        3,
                                        33,
                                        57,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Spaces.kheight10,
                              SizedBox(
                                height: 10,
                                width: size.width / 3.4,
                                child: Shimmer.fromColors(
                                  period: const Duration(seconds: 1),
                                  baseColor: Color(0xFFB0BEC5), // blue gray
                                  highlightColor: Color(0xFFCFD8DC),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        3,
                                        33,
                                        57,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show
                              ? Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 27,
                                    ),
                                  ),
                                ],
                              )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 20, (
                  context,
                  index,
                ) {
                  return Songtileloadingwidget(size: size);
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Songtileloadingwidget extends StatelessWidget {
  const Songtileloadingwidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
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
      trailing: SizedBox(
        width: 100,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Ionicons.download, color: Colors.white),
                Icon(Ionicons.add_circle_outline, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlaylistsDetailsWidget extends StatelessWidget {
  const PlaylistsDetailsWidget({
    super.key,
    required this.widget,
    required this.size,
  });

  final SongDetailsPage widget;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: size.height / 2,
          child: CachedNetworkImage(
            imageUrl: widget.imageurl.replaceAll('150x150', '500x500'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.8),
                  Colors.black,
                  Colors.black,
                  Colors.black,
                ],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class Songtiles extends StatelessWidget {
  const Songtiles({
    super.key,
    required this.name,
    required this.image,
    required this.artist,
    required this.icons1,
    required this.icons2,
    required this.ontap,
    required this.ontapqueue,
    required this.visible1,
    required this.visible2,
  });
  final String name;
  final String image;
  final String artist;
  final IconData icons1;
  final IconData icons2;
  final VoidCallback ontap;
  final VoidCallback ontapqueue;
  final bool visible1;
  final bool visible2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: CachedNetworkImageProvider(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textutil(
                  text: name,
                  fontsize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                Textutil(
                  text: artist,
                  fontsize: 10,
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      visible2 != true
                          ? const SizedBox()
                          : IconButton(
                            onPressed: ontap,
                            icon: Icon(icons2, size: 20, color: Colors.white),
                          ),
                      visible1 != true
                          ? const SizedBox()
                          : IconButton(
                            onPressed: ontapqueue,
                            icon: Icon(icons1, size: 20, color: Colors.white),
                          ),
                    ],
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
