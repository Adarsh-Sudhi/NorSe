import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:norse/features/Data/Models/MusicModels/songmodel.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/nullmusicWidget.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../../configs/constants/Spaces.dart';

class Reorder extends StatefulWidget {
  final List<Songmodel> audios;
  final AudioPlayer audioPlayer;
  const Reorder({super.key, required this.audios, required this.audioPlayer});

  @override
  State<Reorder> createState() => _ReorderState();
}

class _ReorderState extends State<Reorder> {
  int songindex = 0;

  late StreamSubscription<int?> _streamSubscription;

  late List<Songmodel> audios;

  @override
  void initState() {
    if (mounted) {
      setState(() {
        audios = List.from(widget.audios);
      });
    }
    _streamSubscription = widget.audioPlayer.currentIndexStream.listen((event) {
      if (mounted) {
        setState(() {
          songindex = event!;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  _clear() async {
    for (int i = audios.length - 1; i >= 0; i--) {
      if (i == songindex) {
        continue;
      } else {
        audios.removeAt(i);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.8)),
      child: Column(
        children: [
          AppBar(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textutil(
                  text: '${songindex + 1}/${audios.length}',
                  fontsize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                  onPressed: () async {
                    BlocProvider.of<AudioBloc>(context).add(
                      AudioEvent.clearqueueexceptplaying('local', songindex),
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
          Expanded(
            child: ReorderableListView(
              scrollController: ScrollController(),
              proxyDecorator: (child, index, animation) {
                return SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                          Spaces.kheigth5,
                          Container(
                            height: 2,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      QueryArtworkWidget(
                        id: audios[index].id,
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: const NullMusicAlbumWidget(),
                        keepOldArtwork: true,
                        artworkBorder: BorderRadius.circular(10),
                        artworkHeight: 60,
                        artworkWidth: 60,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Textutil(
                                text: audios[index].title.split(".")[0],
                                fontsize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                              Textutil(
                                text: audios[index].subtitle,
                                fontsize: 10,
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                );
              },
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }

                BlocProvider.of<AudioBloc>(
                  context,
                ).add(AudioEvent.updatequeue('local', newIndex, oldIndex));
                Songmodel item = audios.removeAt(oldIndex);
                audios.insert(newIndex, item);
                setState(() {});
              },
              children: List.generate(
                audios.length,
                (index) => Padding(
                  key: Key(audios[index].id.toString()),
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    key: Key(audios[index].id.toString()),
                    onTap: () async {},
                    child:
                        songindex == index
                            ? Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 2,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spaces.kheigth5,
                                      Container(
                                        height: 2,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  QueryArtworkWidget(
                                    keepOldArtwork: true,
                                    size: 550,
                                    id: audios[index].id,
                                    nullArtworkWidget:
                                        const NullMusicAlbumWidget(),
                                    artworkBorder: BorderRadius.circular(10),
                                    artworkWidth: 60,
                                    artworkHeight: 60,
                                    type: ArtworkType.AUDIO,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Textutil(
                                            text:
                                                audios[index].title.split(
                                                  ".",
                                                )[0],
                                            fontsize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          Textutil(
                                            text: audios[index].subtitle,
                                            fontsize: 10,
                                            color: Colors.white.withOpacity(
                                              0.5,
                                            ),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Row(
                                    children: [
                                      MiniMusicVisualizer(
                                        animate: widget.audioPlayer.playing,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 14),
                                    ],
                                  ),
                                ],
                              ),
                            )
                            : GestureDetector(
                              onTap: () async {
                                await widget.audioPlayer.seek(
                                  Duration.zero,
                                  index: index,
                                );
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 2,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Spaces.kheigth5,
                                        Container(
                                          height: 2,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    QueryArtworkWidget(
                                      keepOldArtwork: true,
                                      size: 550,
                                      artworkWidth: 60,
                                      artworkHeight: 60,
                                      nullArtworkWidget:
                                          const NullMusicAlbumWidget(),
                                      id: audios[index].id,
                                      artworkBorder: BorderRadius.circular(10),
                                      type: ArtworkType.AUDIO,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 10,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Textutil(
                                              text:
                                                  audios[index].title.split(
                                                    ".",
                                                  )[0],
                                              fontsize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            Textutil(
                                              text: audios[index].subtitle,
                                              fontsize: 10,
                                              color: Colors.white.withOpacity(
                                                0.5,
                                              ),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<AudioBloc>(context).add(
                                          AudioEvent.removeitemfromqueue(
                                            'local',
                                            index,
                                          ),
                                        );
                                        setState(() {
                                          audios.remove(audios[index]);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
