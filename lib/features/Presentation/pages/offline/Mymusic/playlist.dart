// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/features/Presentation/pages/offline/Mymusic/localfavpage.dart';
import 'package:norse/features/Presentation/pages/offline/Mymusic/playlistsongs.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:norse/features/Presentation/Blocs/Musicbloc/favorite_bloc/favoriteplaylist_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/playlist_Bloc/playlist_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/CustomTextFormField.dart';

import '../../../../../../configs/constants/Spaces.dart';

class PlaylistWidget extends StatefulWidget {
  const PlaylistWidget({Key? key});

  @override
  State<PlaylistWidget> createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  final TextEditingController _namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Spaces.kheight10,

        /// Create Playlist Button
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  child: Container(
                    height: size.height / 3.5,
                    width: size.width / 1.1,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextFormField(
                          controller: _namecontroller,
                          ContentType: "Playlist Name",
                          obscureText: false,
                          prefixicon: Icons.playlist_add,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _dialogButton(
                              label: 'Cancel',
                              onTap: () => Navigator.pop(context),
                              color: Colors.grey[800]!,
                            ),
                            _dialogButton(
                              label: 'Create',
                              onTap: () {
                                BlocProvider.of<PlaylistBloc>(context).add(
                                  PlaylistEvent.createplaylist(
                                    _namecontroller.text.trim(),
                                  ),
                                );
                                BlocProvider.of<PlaylistBloc>(
                                  context,
                                ).add(const PlaylistEvent.getallplaylist());
                                Navigator.pop(context);
                              },
                              color: Colors.greenAccent.shade400,
                              textColor: Colors.black,
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
          child: _blackCardButton(
            icon: Icons.add,
            label: 'Create Playlist',
            color: Colors.white,
          ),
        ),

        Spaces.kheight20,

        /// My Favorites Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap:
                () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Localfavsongpage()),
                ),
            child: BlocBuilder<FavoriteplaylistBloc, FavoriteplaylistState>(
              builder: (context, state) {
                return state.maybeWhen(
                  favsongs: (songs) {
                    final hasSongs = songs.isNotEmpty;
                    return _playlistTile(
                      artwork:
                          hasSongs
                              ? QueryArtworkWidget(
                                keepOldArtwork: true,
                                artworkHeight: 50,
                                artworkWidth: 50,
                                artworkBorder: BorderRadius.circular(5),
                                id: int.parse(songs[0]['id']),
                                type: ArtworkType.AUDIO,
                              )
                              : const Icon(
                                Icons.favorite_border,
                                color: Colors.white70,
                                size: 24,
                              ),
                      label: 'My Favorites',
                      isBold: hasSongs,
                    );
                  },
                  orElse:
                      () => _playlistTile(
                        artwork: const Icon(
                          Icons.favorite_border,
                          color: Colors.white70,
                          size: 24,
                        ),
                        label: 'My Favorites',
                      ),
                );
              },
            ),
          ),
        ),

        /// Playlist List
        Expanded(
          child: BlocBuilder<PlaylistBloc, PlaylistState>(
            builder: (context, state) {
              return state.maybeWhen(
                allplaylists: (playlists) {
                  if (playlists.isEmpty) return const SizedBox();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => Playlistsongspage(
                                        playlistid: playlists[index]['title'],
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1A1A),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey.shade800,
                                    ),
                                    child: const Icon(
                                      Icons.music_note,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Textutil(
                                      text: playlists[index]['title'],
                                      fontsize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  PopupMenuButton(
                                    color: Colors.black,
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    ),
                                    itemBuilder:
                                        (BuildContext context) => [
                                          PopupMenuItem(
                                            onTap: () {
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
                                            child: const Text(
                                              "Delete Playlist",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                },
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Black-styled card button
  Widget _blackCardButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 27),
            const SizedBox(width: 20),
            Textutil(
              text: label,
              fontsize: 16,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  /// Playlist Tile
  Widget _playlistTile({
    required Widget artwork,
    required String label,
    bool isBold = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(child: artwork),
          ),
          const SizedBox(width: 20),
          Textutil(
            text: label,
            fontsize: 15,
            color: Colors.white,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ],
      ),
    );
  }

  /// Dialog Button
  Widget _dialogButton({
    required String label,
    required VoidCallback onTap,
    required Color color,
    Color textColor = Colors.white,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Textutil(
            text: label,
            fontsize: 14,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
