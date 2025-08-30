import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/favorite_bloc/favoriteplaylist_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/pages/MainHomePage/MainHomePage.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Localfavsongpage extends StatefulWidget {
  static const String localfavpage = "./favsongscreen";
  const Localfavsongpage({super.key});

  @override
  State<Localfavsongpage> createState() => _LocalfavsongpageState();
}

class _LocalfavsongpageState extends State<Localfavsongpage> {
  bool isSuffled = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteplaylistBloc>(
      context,
    ).add(const FavoriteplaylistEvent.getallsongs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  BlocBuilder<FavoriteplaylistBloc, FavoriteplaylistState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        favsongs: (allfavsongs) {
                          return Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    allfavsongs.isNotEmpty
                                        ? QueryArtworkWidget(
                                          artworkHeight: 70,
                                          artworkWidth: 70,
                                          id: int.parse(allfavsongs[0]['id']),
                                          type: ArtworkType.AUDIO,
                                          artworkBorder: BorderRadius.circular(
                                            10,
                                          ),
                                          nullArtworkWidget: const Icon(
                                            Icons.music_note,
                                            color: Colors.white,
                                          ),
                                        )
                                        : const Icon(
                                          Icons.music_note,
                                          color: Colors.white,
                                        ),
                              ),
                              const SizedBox(width: 16),
                              const Text(
                                'My Favorites',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                        orElse: () => const SizedBox(),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<FavoriteplaylistBloc, FavoriteplaylistState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        favsongs: (allfavsongs) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildControlButton(
                                context,
                                icon: Icons.shuffle,
                                label: 'Shuffle',
                                onPressed: () {
                                  BlocProvider.of<YoutubePlayerBackgroundBloc>(
                                    context,
                                  ).add(YoutubePlayerBackgroundEvent.started());
                                  BlocProvider.of<AudioBloc>(context).add(
                                    AudioEvent.localaudio(
                                      [],
                                      allfavsongs,
                                      Random().nextInt(allfavsongs.length),
                                    ),
                                  );
                                  BlocProvider.of<AudioBloc>(
                                    context,
                                  ).add(const AudioEvent.shuffleon(true));
                                  setState(() => isSuffled = true);
                                },
                              ),
                              _buildControlButton(
                                context,
                                icon: Icons.play_arrow,
                                label: 'Play',
                                onPressed: () {
                                  BlocProvider.of<YoutubePlayerBackgroundBloc>(
                                    context,
                                  ).add(YoutubePlayerBackgroundEvent.started());
                                  BlocProvider.of<AudioBloc>(context).add(
                                    AudioEvent.localaudio([], allfavsongs, 0),
                                  );
                                  BlocProvider.of<AudioBloc>(
                                    context,
                                  ).add(const AudioEvent.shuffleon(false));
                                },
                              ),
                            ],
                          );
                        },
                        orElse: () => const SizedBox(),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocBuilder<
                      FavoriteplaylistBloc,
                      FavoriteplaylistState
                    >(
                      builder: (context, state) {
                        return state.maybeWhen(
                          favsongs: (allfavsongs) {
                            if (allfavsongs.isEmpty) {
                              return const Center(
                                child: Text(
                                  'No favorite songs added.',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }
                            return ListView.builder(
                              itemCount: allfavsongs.length,
                              itemBuilder: (context, index) {
                                final song = allfavsongs[index];
                                return GestureDetector(
                                  onTap: () {
                                    Notifiers.showplayer.value = true;

                                    BlocProvider.of<
                                      YoutubePlayerBackgroundBloc
                                    >(context).add(
                                      YoutubePlayerBackgroundEvent.started(),
                                    );
                                    BlocProvider.of<AudioBloc>(context).add(
                                      AudioEvent.localaudio(
                                        [],
                                        allfavsongs,
                                        index,
                                      ),
                                    );
                                  },
                                  child: Localfavtiles(
                                    songdetails: song,
                                    index: index,
                                    songs: allfavsongs,
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
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(child: BottomMusicBar()),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Textutil(
        text: label,
        fontsize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(color: Colors.white),
        elevation: 3,
      ),
    );
  }
}

class Localfavtiles extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> songs;
  final Map<String, dynamic> songdetails;

  const Localfavtiles({
    super.key,
    required this.index,
    required this.songs,
    required this.songdetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: QueryArtworkWidget(
          id: int.parse(songdetails['id']),
          type: ArtworkType.AUDIO,
          artworkHeight: 60,
          artworkWidth: 60,
          artworkBorder: BorderRadius.circular(8),
          nullArtworkWidget: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.music_note, color: Colors.white),
          ),
        ),
        title: Text(
          (songdetails['title'] as String).split('.').first,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        subtitle: Text(
          songdetails['artist'] ?? 'Unknown Artist',
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'play') {
              BlocProvider.of<AudioBloc>(
                context,
              ).add(AudioEvent.localaudio([], songs, index));
            } else if (value == 'remove') {
              BlocProvider.of<FavoriteplaylistBloc>(
                context,
              ).add(FavoriteplaylistEvent.removesongs(songs[index]['id']));
            }
          },
          icon: const Icon(Icons.more_vert, color: Colors.white),
          itemBuilder:
              (context) => [
                const PopupMenuItem(value: 'play', child: Text('Play')),
                const PopupMenuItem(value: 'remove', child: Text('Remove')),
              ],
        ),
      ),
    );
  }
}
