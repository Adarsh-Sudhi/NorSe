// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import '../../../../Domain/Entity/MusicEntity/PlaylistEntity/PlaylistEntity.dart';
import '../../../../Domain/Entity/MusicEntity/SearchSongEntity/SearchEntity.dart';
import '../../../../Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import '../../../Blocs/Musicbloc/LocalData/localdata_bloc.dart';

class PlayIcons extends StatelessWidget {
  final IconData playicons;
  final Color iconscolors;
  final double iconsize;
  final VoidCallback ontap;
  const PlayIcons({
    super.key,
    required this.playicons,
    required this.iconscolors,
    required this.iconsize,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,

      onPressed: ontap,
      icon: Icon(playicons, size: iconsize, color: iconscolors),
    );
  }
}

/*   return Card(
        elevation: 5,
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: IconButton(
            onPressed: ontap,
            icon: Icon(playicons, size: iconsize, color: iconscolors)));*/

Recents(
  List<dynamic> song,
  int index,
  BuildContext context,
  String albumname,
) async {
  if (song is List<AlbumSongEntity>) {
    final data = song[index];
    AlbumElements albumElements = AlbumElements(
      id: data.id,
      name: data.name,
      year: data.year,
      type: albumname,
      language: 'null',
      Artist: data.primaryArtists,
      url: data.songs,
      image: data.image,
    );
    BlocProvider.of<LocaldataBloc>(
      context,
    ).add(LocaldataEvent.addtorecent(albumElements));
  } else if (song is List<SearchEntity>) {
    final data = song[index];
    AlbumElements albumElements = AlbumElements(
      id: data.id,
      name: data.name,
      year: data.year,
      type: albumname,
      language: 'null',
      Artist: data.primaryArtists,
      url: data.downloadUrl,
      image: data.image,
    );
    BlocProvider.of<LocaldataBloc>(
      context,
    ).add(LocaldataEvent.addtorecent(albumElements));
  } else if (song is List<playlistEntity>) {
    final data = song[index];
    AlbumElements albumElements = AlbumElements(
      id: data.id,
      name: data.name,
      year: 'null',
      type: albumname,
      language: 'null',
      Artist: data.primaryArtists,
      url: data.downloadUrl,
      image: data.images,
    );
    BlocProvider.of<LocaldataBloc>(
      context,
    ).add(LocaldataEvent.addtorecent(albumElements));
  }
}
