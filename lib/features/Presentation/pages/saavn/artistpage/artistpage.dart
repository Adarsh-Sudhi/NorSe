import 'dart:developer';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:norse/features/Data/Models/MusicModels/onlinesongmodel.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/addtodownloads_Usecase.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/SearchSong_bloc/search_song_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/testonlineplayerscreen.dart';
import 'package:norse/features/Presentation/pages/saavn/subscreens/SongDetailsPage/SongDetailsPage.dart';

class SpotifyArtistPage extends StatefulWidget {
  final Map<String, dynamic> artist;
  const SpotifyArtistPage({Key? key, required this.artist}) : super(key: key);

  @override
  State<SpotifyArtistPage> createState() => _SpotifyArtistPageState();
}

class _SpotifyArtistPageState extends State<SpotifyArtistPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchSongBloc>(
      context,
    ).add(GetSearchSong(Querydata: widget.artist['name']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                shadowColor: Colors.black,
                expandedHeight: 350,
                pinned: true,
                centerTitle: false,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Artist image
                      Image.asset(
                        widget
                            .artist["profileUrl"], // e.g., 'assets/artist/Arijit_Singh.jpg'
                        fit: BoxFit.cover,
                      ),

                      // Gradient overlay
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black87, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.black.withValues(alpha: 0.1),
                            ],
                          ),
                        ),
                      ),

                      // Artist name and genre overlay at bottom left
                      Positioned(
                        bottom: 20,
                        left: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.artist["name"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.artist["genre"],
                              style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Song list
              BlocBuilder<SearchSongBloc, SearchSongState>(
                builder: (context, state) {
                  if (state is SearchSongLoaded) {
                    log(state.Seachsong.length.toString());
                    return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return InkWell(
                          onTap: () {
                            Notifiers.showplayer.value = true;
                            Recents(
                              state.Seachsong,
                              index,
                              context,
                              widget.artist['name'],
                            );

                            BlocProvider.of<YoutubePlayerBackgroundBloc>(
                              context,
                            ).add(YoutubePlayerBackgroundEvent.started());

                            //BlocProvider.of<YoutubeplayerBloc>(context)
                            //    .add(const YoutubeplayerEvent
                            //s       .switchevent());

                            BlocProvider.of<AudioBloc>(context).add(
                              AudioEvent.onlineaudio(
                                state.Seachsong[index].id,
                                0,
                                state.Seachsong[index].downloadUrl,
                                state.Seachsong[index].image,
                                widget.artist['name'],
                                state.Seachsong[index].primaryArtists,
                                const [],
                                const [],
                                [state.Seachsong[index]],
                                [],
                              ),
                            );
                          },
                          child: Songtiles(
                            name: state.Seachsong[index].name,
                            image: state.Seachsong[index].image,
                            artist: state.Seachsong[index].primaryArtists,
                            icons1: Ionicons.add_circle_outline,
                            icons2: Ionicons.download,
                            visible1: true,
                            visible2: true,
                            ontapqueue: () {
                              OnlineSongModel onlineSongModel = OnlineSongModel(
                                album: widget.artist['name'],
                                id: state.Seachsong[index].id,
                                title: state.Seachsong[index].name,
                                imageurl: state.Seachsong[index].image,
                                downloadurl: state.Seachsong[index].downloadUrl,
                                artist: state.Seachsong[index].primaryArtists,
                              );
                              BlocProvider.of<AudioBloc>(context).add(
                                AudioEvent.addtonlinequeue(
                                  'online',
                                  onlineSongModel,
                                ),
                              );
                            },
                            ontap: () async {
                              final data = state.Seachsong[index];
                              AlbumElements albumElements = AlbumElements(
                                id: data.id,
                                name: data.name,
                                year: data.year,
                                type: widget.artist['name'],
                                language: 'null',
                                Artist: data.primaryArtists,
                                url: data.downloadUrl,
                                image: data.image,
                              );
                              await di.di<addtodownloadsUsecase>().call(
                                albumElements,
                              );
                            },
                          ),
                        );
                      }, childCount: state.Seachsong.length),
                    );
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Songtileloadingwidget(
                          size: MediaQuery.sizeOf(context),
                        );
                      }, childCount: 10),
                    );
                  }
                },
              ),

              /*  SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: Text(
                      'Song ${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Album • 3:45',
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                    ),
                    trailing: const Icon(Icons.more_vert, color: Colors.white),
                    onTap: () {},
                  );
                }, childCount: 10),
              ), */
            ],
          ),
        ],
      ),
    );
  }
}
