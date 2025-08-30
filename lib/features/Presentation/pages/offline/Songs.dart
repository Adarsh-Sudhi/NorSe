import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/LocalSongs_bloc/localsong_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/favorite_bloc/favoriteplaylist_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/playlist_Bloc/playlist_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/nullmusicWidget.dart';
import 'package:norse/features/Presentation/pages/offline/homepage.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsPageoffline extends StatefulWidget {
  const SongsPageoffline({super.key});

  @override
  State<SongsPageoffline> createState() => _SongsPageofflineState();
}

class _SongsPageofflineState extends State<SongsPageoffline>
    with SingleTickerProviderStateMixin {
  late Animation<double> fadeanimation;
  late AnimationController fadeanimationcontroller;

  @override
  void initState() {
    super.initState();
    fadeanimationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    fadeanimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: fadeanimationcontroller, curve: Curves.easeInOut),
    );

    fadeanimationcontroller.forward();
  }

  @override
  void dispose() {
    fadeanimationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<LocalsongBloc, LocalsongState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse:
                      () => const Center(
                        child: Textutil(
                          text: "Scan",
                          fontsize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  songs: (
                    localaudios,
                    albums,
                    artist,
                    genre,
                    isloading,
                    failed,
                  ) {
                    if (isloading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    local = localaudios;

                    return FadeTransition(
                      opacity: fadeanimation,
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Tracks ',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '(${localaudios.length})',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Tooltip(
                                    message: 'Refresh songs',
                                    child: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<LocalsongBloc>(
                                          context,
                                        ).add(
                                          const LocalsongEvent.getallsongs(),
                                        );
                                        BlocProvider.of<PlaylistBloc>(
                                          context,
                                        ).add(
                                          const PlaylistEvent.getallplaylist(),
                                        );
                                        BlocProvider.of<FavoriteplaylistBloc>(
                                          context,
                                        ).add(
                                          const FavoriteplaylistEvent.getallsongs(),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.refresh,
                                        color: Colors.redAccent,
                                      ),
                                      splashRadius: 24,
                                      tooltip: 'Refresh',
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Buttons(
                                    title: "Shuffle",
                                    onTap: () {
                                      BlocProvider.of<AudioBloc>(context).add(
                                        AudioEvent.localaudio(
                                          localaudios,
                                          [],
                                          0,
                                        ),
                                      );
                                      BlocProvider.of<AudioBloc>(
                                        context,
                                      ).add(const AudioEvent.shuffleon(true));
                                      Notifiers.isLoshufflednotifier.value =
                                          true;
                                    },
                                  ),
                                  Buttons(
                                    title: "Play",
                                    onTap: () {
                                      Notifiers.isLoshufflednotifier.value =
                                          false;
                                      BlocProvider.of<AudioBloc>(context).add(
                                        AudioEvent.localaudio(
                                          localaudios,
                                          [],
                                          0,
                                        ),
                                      );
                                      BlocProvider.of<AudioBloc>(
                                        context,
                                      ).add(const AudioEvent.shuffleon(false));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SliverToBoxAdapter(child: SizedBox(height: 15)),
                          SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final song = localaudios[index];

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 3,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<AudioBloc>(
                                      context,
                                    ).add(AudioEvent.started());
                                    Notifiers.showplayer.value = true;
                                    BlocProvider.of<
                                      YoutubePlayerBackgroundBloc
                                    >(context).add(
                                      YoutubePlayerBackgroundEvent.started(),
                                    );
                                    BlocProvider.of<AudioBloc>(
                                      context,
                                    ).add(const AudioEvent.shuffleon(false));
                                    BlocProvider.of<AudioBloc>(context).add(
                                      AudioEvent.localaudio(
                                        localaudios,
                                        [],
                                        index,
                                      ),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: 0.05,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          child: QueryArtworkWidget(
                                            id: song.id,
                                            type: ArtworkType.AUDIO,
                                            artworkFit: BoxFit.cover,
                                            artworkBorder:
                                                BorderRadius.circular(1),
                                            artworkWidth: 60,
                                            artworkHeight: 60,
                                            keepOldArtwork: true,

                                            nullArtworkWidget:
                                                const NullMusicAlbumWidget(),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Textutil(
                                                text: song.title,
                                                fontsize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              const SizedBox(height: 4),
                                              Textutil(
                                                text:
                                                    song.artist?.toString() ??
                                                    "Unknown",
                                                fontsize: 12,
                                                color: Colors.white.withValues(
                                                  alpha: 0.7,
                                                ),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }, childCount: localaudios.length),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const Buttons({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Textutil(
            text: title,
            fontsize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
