import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/CustomTextFormField.dart';
import '../../../configs/constants/Spaces.dart';
import '../../Data/Models/MusicModels/songmodel.dart';
import '../Blocs/Musicbloc/playlist_Bloc/playlist_bloc.dart';

class Custombottomsheet extends StatelessWidget {
  final Songmodel songModel;
  Custombottomsheet({Key? key, required this.songModel}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
              height: size.height / 1.5,
              width: size.width,
              child: Column(
                children: [
                  Spaces.kheight10,
                  Spaces.kheight10,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Add to playlist",
                        style: Spaces.Getstyle(
                          20,
                          const Color.fromARGB(255, 255, 255, 255),
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  surfaceTintColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    height: size.height / 3.5,
                                    width: size.width / 1.1,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomTextFormField(
                                          controller: _controller,
                                          ContentType: "Playlist Name",
                                          obscureText: false,
                                          prefixicon: Icons.playlist_add,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Cancel',
                                                    style: Spaces.Getstyle(
                                                      12,
                                                      Colors.black,
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                //   BlocProvider.of<
                                                //               PlaylistBloc>(
                                                //           context)
                                                //       .add(PlaylistEvent
                                                //           .createplaylist(
                                                //              _controller.text
                                                //                  .trim()));
                                                BlocProvider.of<PlaylistBloc>(
                                                  context,
                                                ).add(
                                                  const PlaylistEvent.getallplaylist(),
                                                );
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Create',
                                                    style: Spaces.Getstyle(
                                                      12,
                                                      Colors.black,
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create playlist',
                            style: Spaces.Getstyle(
                              14,
                              Colors.white,
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //
                  /* Expanded(
                    child: BlocBuilder<PlaylistBloc, PlaylistState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => const SizedBox(),
                          allplaylists: (playlists) {
                            if (playlists.isNotEmpty) {
                              return ListView.builder(
                                itemCount: playlists.length,
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                    key: Key(playlists[index]['id']),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (direction) {
                                      BlocProvider.of<PlaylistBloc>(
                                        context,
                                      ).add(
                                        PlaylistEvent.removePlaylist(
                                          playlists[index]['id'],
                                          playlists[index]['title'],
                                        ),
                                      );
                                      BlocProvider.of<PlaylistBloc>(
                                        context,
                                      ).add(
                                        const PlaylistEvent.getallplaylist(),
                                      );
                                    },
                                    child: InkWell(
                                      onTap: () {
                                        AlbumElements song = AlbumElements(
                                          id: songModel.id.toString(),
                                          name: songModel.title,
                                          year: 'null',
                                          type: 'null',
                                          language: 'null',
                                          Artist: songModel.subtitle,
                                          url: songModel.uri,
                                          image: 'null',
                                        );
                                        BlocProvider.of<PlaylistBloc>(
                                          context,
                                        ).add(
                                          PlaylistEvent.addtoplaylist(
                                            playlists[index]['title'],
                                            song,
                                          ),
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(
                                                      8.0,
                                                    ),
                                                child: state.maybeWhen(
                                                  orElse:
                                                      () => Container(
                                                        width: 60,
                                                        height: 80,
                                                        decoration: BoxDecoration(
                                                          color:
                                                              Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10,
                                                              ),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/musical-note.png',
                                                          color:
                                                              Color.fromARGB(
                                                                255,
                                                                197,
                                                                221,
                                                                255,
                                                              ),
                                                          scale: 20,
                                                        ),
                                                      ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Text(
                                                    playlists[index]['title'],
                                                    style: Spaces.Getstyle(
                                                      14,
                                                      Colors.white,
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spaces.kheight10,
                                                  Text(
                                                    'playlist',
                                                    style: Spaces.Getstyle(
                                                      10,
                                                      Colors.white,
                                                      FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        );
                      },
                    ),
                  ), */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
