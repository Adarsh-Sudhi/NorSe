import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SearchSongPage extends StatefulWidget {
  final List<SongModel> audios;
  const SearchSongPage({super.key, required this.audios});

  @override
  _SearchSongPageState createState() => _SearchSongPageState();
}

class _SearchSongPageState extends State<SearchSongPage> {
  final TextEditingController _searchController = TextEditingController();
  List<SongModel> filteredSongs = [];

  @override
  void initState() {
    super.initState();
    filteredSongs = widget.audios;
  }

  void _onSearchChanged(String query) {
    setState(() {
      filteredSongs =
          widget.audios
              .where(
                (song) =>
                    song.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Textutil(
          text: "search Songs",
          fontsize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for a song...',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child:
                filteredSongs.isEmpty
                    ? Center(
                      child: Textutil(
                        text: "No Songs Found",
                        fontsize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    : ListView.builder(
                      itemCount: filteredSongs.length,
                      itemBuilder: (context, index) {
                        final song = filteredSongs[index];
                        return ListTile(
                          tileColor: Colors.transparent,
                          title: Textutil(
                            text: song.title,
                            fontsize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: Textutil(
                            text: song.artist ?? 'Unknown Artist',
                            fontsize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          leading: QueryArtworkWidget(
                            keepOldArtwork: true,
                            id: song.id,
                            artworkBorder: BorderRadius.circular(5),
                            type: ArtworkType.AUDIO,
                            nullArtworkWidget: Icon(
                              Icons.music_note,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            final song = filteredSongs[index];
                            final originalIndex = widget.audios.indexOf(song);
                            Notifiers.showplayer.value = true;

                            BlocProvider.of<AudioBloc>(
                              context,
                            ).add(const AudioEvent.shuffleon(false));

                            BlocProvider.of<YoutubePlayerBackgroundBloc>(
                              context,
                            ).add(YoutubePlayerBackgroundEvent.started());

                            BlocProvider.of<AudioBloc>(context).add(
                              AudioEvent.localaudio(
                                widget.audios,
                                [],
                                originalIndex,
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
