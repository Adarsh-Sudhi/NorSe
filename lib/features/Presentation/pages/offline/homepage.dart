import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/GetPermissions_UseCase.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/LocalSongs_bloc/localsong_bloc.dart';
import 'package:norse/features/Presentation/pages/offline/Mymusic/album.dart';
import 'package:norse/features/Presentation/pages/offline/Mymusic/playlist.dart';
import 'package:norse/features/Presentation/pages/offline/Mymusic/searchsongs.dart';
import 'package:norse/features/Presentation/pages/offline/Songs.dart';
import 'package:norse/injection_container.dart' as di;
import 'package:on_audio_query/on_audio_query.dart';

List<SongModel> local = [];

getPer(BuildContext context) async {
  final permissionusecase = di.di<GetpermissionUseCase>();
  bool isgranted = await permissionusecase.call().then((e) {
    local.isEmpty
        ? BlocProvider.of<LocalsongBloc>(
          context,
        ).add(const LocalsongEvent.getallsongs())
        : null;

    return e;
  });
  if (!isgranted) {
    Spaces.showtoast('Need Permission to access audios');
  }
}

class OfflineMusic extends StatefulWidget {
  const OfflineMusic({super.key});

  @override
  State<OfflineMusic> createState() => _OfflineMusicState();
}

class _OfflineMusicState extends State<OfflineMusic> {
  List<String> pages = ['Songs', "Album", 'Playlists'];

  late PageController pageController;

  int pageindex = 0;

  @override
  void initState() {
    super.initState();
    getPer(context);
    pageController = PageController(
      initialPage: pageindex,
      viewportFraction: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Spaces.backgroundColor,

        title: const Textutil(
          text: 'NorSe Music',
          fontsize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          BlocBuilder<LocalsongBloc, LocalsongState>(
            builder: (context, state) {
              return state.maybeWhen(
                songs: (songlist, albums, artist, genre, isloading, failed) {
                  return IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SearchSongPage(audios: songlist),
                        ),
                      );
                    },
                    icon: Icon(Ionicons.search, color: Colors.white),
                  );
                },
                orElse: () => SizedBox(),
              );
            },
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final isSelected = pageindex == index;

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
                          if (isSelected)
                            BoxShadow(
                              color: Colors.red.withValues(alpha: 0.35),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            )
                          else
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.4),
                              blurRadius: 6,
                              offset: const Offset(2, 2),
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
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          setState(() {
                            pageindex = index;
                          });
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOutCubic,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: isSelected ? 1 : 0.7,
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
                              Text(
                                pages[index],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight:
                                      isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : Colors.white70,
                                  letterSpacing: 0.3,
                                ),
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
              child: BlocBuilder<LocalsongBloc, LocalsongState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    songs: (
                      songlist,
                      albums,
                      artist,
                      genre,
                      isloading,
                      failed,
                    ) {
                      return PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          SongsPageoffline(),
                          AlbumWidget(count: albums.length),
                          PlaylistWidget(),
                        ],
                      );
                    },
                    orElse: () => SizedBox(),
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
