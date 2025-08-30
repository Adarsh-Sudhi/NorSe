// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/LocalSongs_bloc/localsong_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/playlist_Bloc/playlist_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/nullmusicWidget.dart';

class Addsongstoplaylistpage extends StatefulWidget {
  final String tbnam;
  const Addsongstoplaylistpage({super.key, required this.tbnam});

  @override
  State<Addsongstoplaylistpage> createState() => _AddsongstoplaylistpageState();
}

class _AddsongstoplaylistpageState extends State<Addsongstoplaylistpage> {
  @override
  void initState() {
    super.initState();
  }

  final List<SongModel> customlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Spaces.backgroundColor,
      appBar: AppBar(
        backgroundColor: Spaces.backgroundColor,
        title: Textutil(
          text: 'Add songs',
          fontsize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Ionicons.arrow_back, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                for (var songs in customlist) {
                  AlbumElements item = AlbumElements(
                    id: songs.id.toString(),
                    name: "${songs.title}.${songs.data}",
                    year: 'null',
                    type: 'null',
                    language: 'null',
                    Artist: songs.artist!,
                    url: songs.uri!,
                    image: 'null',
                  );
                  BlocProvider.of<PlaylistBloc>(
                    context,
                  ).add(PlaylistEvent.addtoplaylist(widget.tbnam, item));
                  // BlocProvider.of<PlaylistBloc>(context).add(PlaylistEvent.addtoplaylist(tbname, song))
                }
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 80,
                decoration: BoxDecoration(
                  color: customlist.isNotEmpty ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Textutil(
                    text: 'Add',
                    fontsize: 15,
                    color: customlist.isNotEmpty ? Colors.black : Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          /* Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.zero,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  onChanged: (value) {},
                  style: GoogleFonts.aBeeZee(color: Colors.black),
                  controller: _seachSongs,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.black),
                    ),
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIconColor: Colors.black,
                    hintText: 'Search songs',
                    hintStyle: GoogleFonts.aldrich(
                      fontSize: 14,
                      color: Colors.black.withValues(alpha: 0.4),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ), */
          Spaces.kheight10,
          Expanded(
            child: BlocBuilder<LocalsongBloc, LocalsongState>(
              builder: (context, state) {
                return state.maybeWhen(
                  songs: (songlist, albums, artist, genre, isloading, failed) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: songlist.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 9),
                            child: InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    !customlist.contains(songlist[index])
                                        ? IconButton(
                                          onPressed: () {
                                            customlist.add(songlist[index]);
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Ionicons.radio_button_off_outline,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        )
                                        : IconButton(
                                          onPressed: () {
                                            customlist.remove(songlist[index]);
                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Ionicons.radio_button_on_outline,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                        ),

                                    QueryArtworkWidget(
                                      artworkFit: BoxFit.fitHeight,
                                      artworkWidth: 50,
                                      keepOldArtwork: true,
                                      artworkHeight: 50,
                                      nullArtworkWidget:
                                          const NullMusicAlbumWidget(),
                                      artworkBorder: BorderRadius.circular(40),
                                      id: songlist[index].id,
                                      type: ArtworkType.AUDIO,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Textutil(
                                            text:
                                                songlist[index].title.split(
                                                  ".",
                                                )[0],
                                            fontsize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Textutil(
                                            text:
                                                songlist[index].artist != null
                                                    ? songlist[index].artist!
                                                    : "unknown",
                                            fontsize: 10,
                                            color: Colors.white.withOpacity(
                                              0.7,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    /*  IconButton(
                                                    onPressed: () {
                                                      /*   setState(() {
                                                            currentindex = index;
                                                            songModel =
                                                                localaudios[index];
                                                          });
                                                          Notifiers.showMenu.value =
                                                              !Notifiers
                                                                  .showMenu.value; */
                                                    },
                                                    icon: Icon(
                                                      Icons.more_vert,
                                                      color: Colors.grey
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),*/
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  orElse: () => SizedBox(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
