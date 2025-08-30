// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:norse/features/Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/Library/song/library_bloc/library_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/Library/song/songlike_bloc/songlike_bloc.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/testonlineplayerscreen.dart';

class FavButton extends StatelessWidget {
  final dynamic astate;
  final int songindex;
  final String type;
  const FavButton({
    super.key,
    required this.astate,
    required this.songindex,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SonglikeBloc, SonglikeState>(
      builder: (context, state0) {
        return /*type == 'yt'
            ? state0.maybeWhen(
              removed: () {
                return PlayIcons(
                  playicons: CupertinoIcons.heart,
                  iconscolors: const Color.fromARGB(255, 255, 255, 255),
                  iconsize: 28,
                  ontap: () {
                    AlbumElements song = AlbumElements(
                      id: astate.songs[songindex].id,
                      name: astate.songs[songindex].title,
                      year: '',
                      type: 'yt',
                      language: 'null',
                      Artist: astate.songs[songindex].artist,
                      url: astate.songs[songindex].downloadurl,
                      image: astate.songs[songindex].imageurl,
                    );
                    BlocProvider.of<SonglikeBloc>(
                      context,
                    ).add(SonglikeEvent.addtolibray('song', song));
                    _callallsongs(context);
                  },
                );
              },
              added: () {
                return PlayIcons(
                  playicons: CupertinoIcons.heart_fill,
                  iconscolors: Colors.red,
                  iconsize: 28,
                  ontap: () {
                    AlbumElements song = AlbumElements(
                      id: astate.songs[songindex].id,
                      name: astate.songs[songindex].title,
                      year: '',
                      type: 'yt',
                      language: 'null',
                      Artist: astate.songs[songindex].artist,
                      url: astate.songs[songindex].downloadurl,
                      image: astate.songs[songindex].imageurl,
                    );
                    BlocProvider.of<SonglikeBloc>(
                      context,
                    ).add(SonglikeEvent.addtolibray('song', song));
                    _callallsongs(context);
                  },
                );
              },
              ispresent: (ispresent) {
                return PlayIcons(
                  playicons:
                      ispresent
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                  iconscolors:
                      ispresent
                          ? Colors.red
                          : const Color.fromARGB(255, 255, 255, 255),
                  iconsize: 28,
                  ontap: () {
                    AlbumElements song = AlbumElements(
                      id: astate.songs[songindex].id,
                      name: astate.songs[songindex].title,
                      year: '',
                      type: 'yt',
                      language: 'null',
                      Artist: astate.songs[songindex].artist,
                      url: astate.songs[songindex].downloadurl,
                      image: astate.songs[songindex].imageurl,
                    );
                    BlocProvider.of<SonglikeBloc>(
                      context,
                    ).add(SonglikeEvent.addtolibray('song', song));
                    _callallsongs(context);
                  },
                );
              },
              orElse: () {
                return PlayIcons(
                  playicons: CupertinoIcons.heart,
                  iconscolors: const Color.fromARGB(255, 255, 255, 255),
                  iconsize: 28,
                  ontap: () {
                    AlbumElements song = AlbumElements(
                      id: astate.songs[songindex].id,
                      name: astate.songs[songindex].title,
                      year: '',
                      type: 'yt',
                      language: 'null',
                      Artist: astate.songs[songindex].artist,
                      url: astate.songs[songindex].downloadurl,
                      image: astate.songs[songindex].imageurl,
                    );
                    BlocProvider.of<SonglikeBloc>(
                      context,
                    ).add(SonglikeEvent.addtolibray('song', song));
                    _callallsongs(context);
                  },
                );
              },
            )
            :*/ state0.maybeWhen(
              removed: () {
                return PlayIcons(
                  playicons: CupertinoIcons.heart,
                  iconscolors: const Color.fromARGB(255, 255, 255, 255),
                  iconsize: 28,
                  ontap: () {
                    AlbumElements song = AlbumElements(
                      id: astate.audios[songindex].id,
                      name: astate.audios[songindex].title,
                      year: 'null',
                      type: 'saavn',
                      language: 'null',
                      Artist: astate.audios[songindex].artist,
                      url: astate.audios[songindex].downloadurl,
                      image: astate.audios[songindex].imageurl,
                    );
                    BlocProvider.of<SonglikeBloc>(
                      context,
                    ).add(SonglikeEvent.addtolibray('song', song));
                    _callallsongs(context);
                  },
                );
              },
              added: () {
                return PlayIcons(
                  playicons: CupertinoIcons.heart_fill,
                  iconscolors: Colors.red,
                  iconsize: 28,
                  ontap: () {
                    AlbumElements song = AlbumElements(
                      id: astate.audios[songindex].id,
                      name: astate.audios[songindex].title,
                      year: '',
                      type: 'saavn',
                      language: 'null',
                      Artist: astate.audios[songindex].artist,
                      url: astate.audios[songindex].downloadurl,
                      image: astate.audios[songindex].imageurl,
                    );
                    BlocProvider.of<SonglikeBloc>(
                      context,
                    ).add(SonglikeEvent.addtolibray('song', song));
                    _callallsongs(context);
                  },
                );
              },
              ispresent: (ispresent) {
                return PlayIcons(
                  playicons:
                      ispresent
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                  iconscolors:
                      ispresent
                          ? Colors.red
                          : const Color.fromARGB(255, 255, 255, 255),
                  iconsize: 28,
                  ontap: () {
                    AlbumElements song = AlbumElements(
                      id: astate.audios[songindex].id,
                      name: astate.audios[songindex].title,
                      year: '',
                      type: 'saavn',
                      language: 'null',
                      Artist: astate.audios[songindex].artist,
                      url: astate.audios[songindex].downloadurl,
                      image: astate.audios[songindex].imageurl,
                    );
                    BlocProvider.of<SonglikeBloc>(
                      context,
                    ).add(SonglikeEvent.addtolibray('song', song));
                    _callallsongs(context);
                  },
                );
              },
              orElse: () {
                return PlayIcons(
                  playicons: CupertinoIcons.heart,
                  iconscolors: const Color.fromARGB(255, 255, 255, 255),
                  iconsize: 28,
                  ontap: () {
                    AlbumElements song = AlbumElements(
                      id: astate.audios[songindex].id,
                      name: astate.audios[songindex].title,
                      year: '',
                      type: 'saavn',
                      language: 'null',
                      Artist: astate.audios[songindex].artist,
                      url: astate.audios[songindex].downloadurl,
                      image: astate.audios[songindex].imageurl,
                    );
                    BlocProvider.of<SonglikeBloc>(
                      context,
                    ).add(SonglikeEvent.addtolibray('song', song));
                    _callallsongs(context);
                  },
                );
              },
            );
      },
    );
  }

  _callallsongs(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      BlocProvider.of<LibraryBloc>(
        context,
      ).add(const LibraryEvent.getlibrarysong());
    });
  }
}
