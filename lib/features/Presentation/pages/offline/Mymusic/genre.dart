import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/LocalSongs_bloc/localsong_bloc.dart';
import 'package:norse/features/Presentation/pages/saavn/subscreens/SongDetailsPage/SongDetailsPage.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../../../configs/constants/Spaces.dart';


class GenrePage extends StatelessWidget {
  const GenrePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Expanded(child: BlocBuilder<LocalsongBloc, LocalsongState>(
          builder: (context, state) {
            return state.maybeWhen(
                songs: (songlist, albums, artist, genre, isloading, failed) {
                  return Column(
                    children: [
                      Spaces.kheight10,
                      Expanded(
                          child: ListView.builder(
                        itemCount: genre.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                           /*   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Albumsongspage(
                                          type: 'genre',
                                          id: genre[index].id,
                                          albumname: genre[index].genre))); */
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: size.width,
                                    child: QueryArtworkWidget(
                                        size: 600,
                                        artworkBorder: BorderRadius.circular(6),
                                        id: genre[index].id,
                                        type: ArtworkType.GENRE),
                                  ),
                                  Container(
                                    height: 150,
                                    width: size.width,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  Column(
                                    children: [
                                      Textutil(
                                          text: genre[index].genre,
                                          fontsize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      Textutil(
                                          text:
                                              "${genre[index].numOfSongs} Tracks",
                                          fontsize: 10,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                    ],
                  );
                },
                orElse: () => const SizedBox());
          },
        ))
      ],
    );
  }
}
/**
 *this page contained the code to be written the most of of the page
 */