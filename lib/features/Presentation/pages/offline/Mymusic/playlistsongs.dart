import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/playlistsongs_bloc/playlistsongs_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/pages/MainHomePage/MainHomePage.dart';
import 'package:norse/features/Presentation/pages/offline/addsongs/addsongstoplaylistpage.dart';
import 'package:norse/features/Presentation/pages/saavn/subscreens/SongDetailsPage/SongDetailsPage.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Playlistsongspage extends StatefulWidget {
  static const String playlistsongpage = "./playlistsongpage";
  const Playlistsongspage({Key? key, required this.playlistid})
    : super(key: key);
  final String playlistid;

  @override
  State<Playlistsongspage> createState() => _PlaylistsongspageState();
}

class _PlaylistsongspageState extends State<Playlistsongspage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PlaylistsongsBloc>(
      context,
    ).add(PlaylistsongsEvent.getplaylistsongs(widget.playlistid));
  }

  @override
  void didUpdateWidget(covariant Playlistsongspage oldWidget) {
    super.didUpdateWidget(oldWidget);
    BlocProvider.of<PlaylistsongsBloc>(
      context,
    ).add(PlaylistsongsEvent.getplaylistsongs(widget.playlistid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              icon: const Icon(
                Ionicons.add_circle_outline,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => Addsongstoplaylistpage(tbnam: widget.playlistid),
                  ),
                );
              },
              label: const Text(
                'Add Songs',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlocBuilder<PlaylistsongsBloc, PlaylistsongsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        songs: (songs) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  color: Colors.white.withOpacity(0.2),
                                  child:
                                      songs.isNotEmpty
                                          ? QueryArtworkWidget(
                                            artworkHeight: 70,
                                            artworkWidth: 70,
                                            keepOldArtwork: true,
                                            artworkBorder:
                                                BorderRadius.circular(12),
                                            id: int.parse(songs[0]['id']),
                                            type: ArtworkType.AUDIO,
                                          )
                                          : const Icon(
                                            Icons.music_note,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  widget.playlistid,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          );
                        },
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BlocBuilder<PlaylistsongsBloc, PlaylistsongsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        songs: (songs) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildControlButton(
                                icon: Icons.shuffle,
                                label: 'Shuffle',
                                onPressed: () {
                                  Notifiers.isLoshufflednotifier.value = true;
                                  BlocProvider.of<AudioBloc>(
                                    context,
                                  ).add(const AudioEvent.shuffleon(true));
                                  BlocProvider.of<AudioBloc>(
                                    context,
                                  ).add(AudioEvent.localaudio([], songs, 0));
                                },
                              ),
                              _buildControlButton(
                                icon: Icons.play_arrow,
                                label: 'Play',
                                onPressed: () {
                                  Notifiers.showplayer.value = true;

                                  BlocProvider.of<YoutubePlayerBackgroundBloc>(
                                    context,
                                  ).add(YoutubePlayerBackgroundEvent.started());

                                  Notifiers.isLoshufflednotifier.value = false;
                                  BlocProvider.of<AudioBloc>(
                                    context,
                                  ).add(const AudioEvent.shuffleon(false));
                                  BlocProvider.of<AudioBloc>(
                                    context,
                                  ).add(AudioEvent.localaudio([], songs, 0));
                                },
                              ),
                            ],
                          );
                        },
                        orElse:
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildControlButton(
                                  icon: Icons.shuffle,
                                  label: 'Shuffle',
                                ),
                                _buildControlButton(
                                  icon: Icons.play_arrow,
                                  label: 'Play',
                                ),
                              ],
                            ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<PlaylistsongsBloc, PlaylistsongsState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        songs: (songs) {
                          if (songs.isEmpty) {
                            return const Center(
                              child: Text(
                                'No songs in this playlist.',
                                style: TextStyle(color: Colors.white54),
                              ),
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    'Songs (${songs.length})',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    itemCount: songs.length,
                                    itemBuilder: (context, index) {
                                      final song = songs[index];
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.06),
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                          ),
                                          onTap: () {
                                            Notifiers.showplayer.value = true;

                                            BlocProvider.of<
                                              YoutubePlayerBackgroundBloc
                                            >(context).add(
                                              YoutubePlayerBackgroundEvent.started(),
                                            );
                                            BlocProvider.of<AudioBloc>(
                                              context,
                                            ).add(
                                              AudioEvent.localaudio(
                                                [],
                                                songs,
                                                index,
                                              ),
                                            );
                                          },
                                          leading: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: QueryArtworkWidget(
                                              artworkHeight: 50,
                                              artworkWidth: 50,
                                              id: int.parse(song['id']),
                                              type: ArtworkType.AUDIO,
                                            ),
                                          ),
                                          title: Text(
                                            (song['title'] as String).split(
                                              ".",
                                            )[0],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Text(
                                            song['artist'],
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(
                                                0.6,
                                              ),
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          trailing: PopupMenuButton(
                                            color: Colors.white,
                                            icon: const Icon(
                                              Icons.more_vert,
                                              color: Colors.white,
                                            ),
                                            itemBuilder:
                                                (context) => [
                                                  PopupMenuItem(
                                                    onTap: () {
                                                      BlocProvider.of<
                                                        AudioBloc
                                                      >(context).add(
                                                        AudioEvent.localaudio(
                                                          [],
                                                          songs,
                                                          index,
                                                        ),
                                                      );
                                                    },
                                                    child: const Text('Play'),
                                                  ),
                                                  PopupMenuItem(
                                                    onTap: () {
                                                      BlocProvider.of<
                                                        PlaylistsongsBloc
                                                      >(context).add(
                                                        PlaylistsongsEvent.deletesong(
                                                          widget.playlistid,
                                                          song['id'],
                                                        ),
                                                      );
                                                      BlocProvider.of<
                                                        PlaylistsongsBloc
                                                      >(context).add(
                                                        PlaylistsongsEvent.getplaylistsongs(
                                                          widget.playlistid,
                                                        ),
                                                      );
                                                    },
                                                    child: const Text('Remove'),
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
                          }
                        },
                        orElse:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                      );
                    },
                  ),
                ),
              ],
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

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 140,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
