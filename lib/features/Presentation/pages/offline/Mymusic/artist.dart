// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:norse/features/Presentation/CustomWidgets/nullmusicWidget.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:norse/configs/constants/Spaces.dart';

class ArtistWiseSongWidget extends StatelessWidget {
  const ArtistWiseSongWidget({super.key, required this.folders});
  final Map<String, dynamic> folders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spaces.kheight10,
        GestureDetector(
          onTap: () {
            /*   (folders['Download'] as List<SongModel>).isEmpty
                ? null
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Albumsong(
                            audios: (folders['Download'] as List<SongModel>)))); */
          },
          child: ListTile(
            subtitle: Textutil(
              text:
                  "${(folders['Download'] as List<SongModel>).isEmpty ? 0 : (folders['Download'] as List<SongModel>).length} Audios",
              fontsize: 10,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            title: const Textutil(
              text: "Downloads",
              fontsize: 15,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            leading: SizedBox(
              height: 50,
              width: 50,
              child:
                  (folders['Download'] as List<SongModel>).isEmpty
                      ? const NullMusicAlbumWidget()
                      : QueryArtworkWidget(
                        nullArtworkWidget: const NullMusicAlbumWidget(),
                        artworkBorder: BorderRadius.circular(5),
                        id: (folders['Download'] as List<SongModel>)[0].id,
                        type: ArtworkType.AUDIO,
                      ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            /*  (folders['Music'] as List<SongModel>).isEmpty
                ? null
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Albumsong(
                            audios: (folders['Music'] as List<SongModel>)))); */
          },
          child: ListTile(
            subtitle: Textutil(
              text:
                  "${(folders['Music'] as List<SongModel>).isEmpty ? 0 : (folders['Music'] as List<SongModel>).length} Audios",
              fontsize: 10,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            title: const Textutil(
              text: "Music",
              fontsize: 15,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            leading: SizedBox(
              height: 50,
              width: 50,
              child:
                  (folders['Music'] as List<SongModel>).isEmpty
                      ? const NullMusicAlbumWidget()
                      : QueryArtworkWidget(
                        nullArtworkWidget: const NullMusicAlbumWidget(),
                        artworkBorder: BorderRadius.circular(5),
                        id: (folders['Music'] as List<SongModel>)[0].id,
                        type: ArtworkType.AUDIO,
                      ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            /*  (folders['Recordings'] as List<SongModel>).isEmpty
                ? null
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Albumsong(
                            audios:
                                (folders['Recordings'] as List<SongModel>))));*/
          },
          child: ListTile(
            subtitle: Textutil(
              text:
                  "${(folders['Recordings'] as List<SongModel>).isEmpty ? 0 : (folders['Recordings'] as List<SongModel>).length} Audios",
              fontsize: 10,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            title: const Textutil(
              text: "Recordings",
              fontsize: 15,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            leading: SizedBox(
              height: 50,
              width: 50,
              child:
                  (folders['Recordings'] as List<SongModel>).isEmpty
                      ? const NullMusicAlbumWidget()
                      : QueryArtworkWidget(
                        nullArtworkWidget: const NullMusicAlbumWidget(),
                        artworkBorder: BorderRadius.circular(5),
                        id: (folders['Recordings'] as List<SongModel>)[0].id,
                        type: ArtworkType.AUDIO,
                      ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            /*   (folders['RingTones'] as List<SongModel>).isEmpty
                ? null
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Albumsong(
                            audios:
                                (folders['RingTones'] as List<SongModel>))));*/
          },
          child: ListTile(
            subtitle: Textutil(
              text:
                  "${(folders['RingTones'] as List<SongModel>).isEmpty ? 0 : (folders['RingTones'] as List<SongModel>).length} Audios",
              fontsize: 10,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            title: const Textutil(
              text: "RingTone",
              fontsize: 15,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            leading: SizedBox(
              height: 50,
              width: 50,
              child:
                  (folders['RingTones'] as List<SongModel>).isEmpty
                      ? const NullMusicAlbumWidget()
                      : QueryArtworkWidget(
                        nullArtworkWidget: const NullMusicAlbumWidget(),
                        artworkBorder: BorderRadius.circular(5),
                        id: (folders['RingTones'] as List<SongModel>)[0].id,
                        type: ArtworkType.AUDIO,
                      ),
            ),
          ),
        ),
      ],
    );
  }
}
