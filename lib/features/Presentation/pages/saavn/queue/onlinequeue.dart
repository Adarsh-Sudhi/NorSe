import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Data/Models/MusicModels/onlinesongmodel.dart';
import '../../../Blocs/Musicbloc/audio_bloc/audio_bloc.dart';

class Onlinequeue extends StatefulWidget {
  static const onlinequeuescreen = './onlinequeue';
  final List<OnlineSongModel> audios;
  final AudioPlayer audioPlayer;
  const Onlinequeue({Key? key, required this.audios, required this.audioPlayer})
    : super(key: key);

  @override
  State<Onlinequeue> createState() => _OnlinequeueState();
}

class _OnlinequeueState extends State<Onlinequeue> {
  late List<OnlineSongModel> audios;

  int currentindex = 0;
  bool isplaying = false;

  late StreamSubscription subscription;
  late StreamSubscription playerSubsciption;

  @override
  void initState() {
    audios = List.from(widget.audios);
    super.initState();
    subscription = widget.audioPlayer.currentIndexStream.listen((event) {
      if (mounted) {
        setState(() {
          currentindex = event!;
        });
      }
    });

    playerSubsciption = widget.audioPlayer.playingStream.listen((event) {
      if (mounted) {
        setState(() {
          isplaying = event;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
    playerSubsciption.cancel();
  }

  _clear() async {
    for (int i = audios.length - 1; i >= 0; i--) {
      if (i == currentindex) {
        continue;
      } else {
        audios.removeAt(i);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Spaces.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.black,
        backgroundColor: Spaces.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
        title: Textutil(
          text: 'Queue',
          fontsize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textutil(
                    text: '${currentindex + 1}/${audios.length}',
                    fontsize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  IconButton(
                    onPressed: () async {
                      BlocProvider.of<AudioBloc>(context).add(
                        AudioEvent.clearqueueexceptplaying(
                          'online',
                          currentindex,
                        ),
                      );
                      await _clear();
                    },
                    icon: const Icon(
                      Icons.clear_all_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Spaces.kheight10,
            Expanded(
              child: ReorderableListView(
                scrollController: ScrollController(),
                proxyDecorator: (child, index, animation) {
                  return Row(
                    children: [
                      const SizedBox(width: 9),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: 14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                          Spaces.kheigth5,
                          Container(
                            height: 2,
                            width: 14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 10),
                            Container(
                              height: 50,
                              width: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Image.network(audios[index].imageurl),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Textutil(
                                    text: audios[index].title,
                                    fontsize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Textutil(
                                    text: audios[index].artist,
                                    fontsize: 10,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                children: List.generate(audios.length, (index) {
                  final songs = audios[index];
                  return InkWell(
                    splashFactory: NoSplash.splashFactory,
                    key: Key(songs.id),
                    onTap: () async {
                      await widget.audioPlayer.seek(
                        Duration.zero,
                        index: index,
                      );
                    },
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 2,
                                  width: 14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                ),
                                Spaces.kheigth5,
                                Container(
                                  height: 2,
                                  width: 14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: CachedNetworkImage(
                                      errorWidget: (context, url, error) {
                                        return Image.asset(
                                          'assets/musical-note.png',
                                          color: Colors.white.withOpacity(0.5),
                                        );
                                      },
                                      imageUrl: songs.imageurl,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Textutil(
                                            text: songs.title,
                                            fontsize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Textutil(
                                            text: songs.artist,
                                            fontsize: 10,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  currentindex == index
                                      ? Padding(
                                        padding: const EdgeInsets.only(
                                          right: 15,
                                        ),
                                        child: MiniMusicVisualizer(
                                          animate: isplaying,
                                          color: Colors.white,
                                        ),
                                      )
                                      : IconButton(
                                        onPressed: () {
                                          BlocProvider.of<AudioBloc>(
                                            context,
                                          ).add(
                                            AudioEvent.removeitemfromqueue(
                                              'online',
                                              index,
                                            ),
                                          );
                                          audios.removeAt(index);
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                      ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                onReorder: (oldIndex, newIndex) {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }

                  BlocProvider.of<AudioBloc>(
                    context,
                  ).add(AudioEvent.updatequeue('online', newIndex, oldIndex));
                  OnlineSongModel item = audios.removeAt(oldIndex);
                  setState(() {});
                  audios.insert(newIndex, item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
