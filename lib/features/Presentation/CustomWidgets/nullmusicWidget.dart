import 'package:flutter/material.dart';

class NullMusicAlbumWidget extends StatelessWidget {
  const NullMusicAlbumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Icon(Icons.music_note, color: Colors.white),
    );
  }
}
