import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/LocalSongs_bloc/localsong_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/nullmusicWidget.dart';
import 'package:norse/features/Presentation/pages/offline/Mymusic/albumpage.dart';
import 'package:norse/features/Presentation/pages/saavn/subscreens/SongDetailsPage/SongDetailsPage.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../../../configs/constants/Spaces.dart';

class AlbumWidget extends StatefulWidget {
  final int count;
  const AlbumWidget({super.key, required this.count});

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<LocalsongBloc, LocalsongState>(
            builder: (context, state) {
              return state.maybeWhen(
                songs: (songlist, albums, genre, artist, isloading, failed) {
                  return Column(
                    children: [
                      Spaces.kheight10,
                      Expanded(
                        child: ListView.builder(
                          itemCount: albums.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => AlbumSongsPage(
                                          albumModel: albums[index],
                                        ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 9),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 65,
                                      height: 65,
                                      child: QueryArtworkWidget(
                                        nullArtworkWidget:
                                            const NullMusicAlbumWidget(),
                                        id: albums[index].id,
                                        type: ArtworkType.ALBUM,
                                        keepOldArtwork: true,
                                        artworkWidth: 65,
                                        artworkHeight: 65,
                                        artworkBorder: BorderRadius.circular(9),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Textutil(
                                            text: albums[index].album,
                                            fontsize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          Textutil(
                                            text:
                                                "${albums[index].numOfSongs} Tracks",
                                            fontsize: 9,
                                            color: Colors.white.withValues(
                                              alpha: 0.5,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
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
                  );
                },
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ],
    );
  }
}
