// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';

import 'package:norse/features/Presentation/pages/saavn/HomePage.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Quickpicksyt extends StatelessWidget {
  final List allsongs;
  const Quickpicksyt({super.key, required this.allsongs});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        height: size.height / 3,
        width: size.width,
        child: SizedBox(
          height:
              allsongs.length == 3
                  ? 260
                  : allsongs.length == 2
                  ? 190
                  : allsongs.length == 1
                  ? 115
                  : allsongs.isEmpty
                  ? 0
                  : 330,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child:
                    allsongs.isNotEmpty
                        ? PageView.builder(
                          padEnds: false,
                          controller: PageController(
                            viewportFraction: 0.9,
                            initialPage: 0,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: (allsongs.length / 4).ceil(),
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: size.width,
                              child: Column(
                                children: List.generate(4, (innerIndex) {
                                  final itemIndex = index * 4 + innerIndex;
                                  if (itemIndex < allsongs.length) {
                                    List artistlist =
                                        (allsongs[itemIndex]['artists']
                                            as List);
    
                                    String sub = artistlist
                                        .map((e) => e['name'])
                                        .join(',');
    
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        List<Video> videos = [];
    
                                        for (var vido in allsongs) {
                                          Video video = Video(
                                            VideoId(
                                              vido['videoId'].toString(),
                                            ),
                                            vido['title'],
                                            sub,
                                            ChannelId(
                                              'UC2cDmOO_m6sbJhHYhJLeVLQ',
                                            ),
                                            DateTime(2000),
                                            'null',
                                            DateTime(2000),
                                            'null',
                                            Duration.zero,
                                            ThumbnailSet(vido['videoId']),
                                            'sf dsf sd '.characters,
                                            Engagement(0, 0, 0),
                                            false,
                                          );
                                          videos.add(video);
                                        }
    
                                        Notifiers.showplayer.value = true;
    
                                        BlocProvider.of<AudioBloc>(
                                          context,
                                        ).add(AudioEvent.started());
    
                                        BlocProvider.of<
                                          YoutubePlayerBackgroundBloc
                                        >(context).add(
                                          YoutubePlayerBackgroundEvent.started(),
                                        );
    
                                        BlocProvider.of<AudioBloc>(
                                          context,
                                        ).add(
                                          AudioEvent.ytmusiclisten(
                                            videos,
                                            itemIndex,
                                            'p',
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        height: 70,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 7,
                                          ),
                                          child: ListTile(
                                            leading: Container(
                                              height: 90,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      6,
                                                    ),
                                                image: DecorationImage(
                                                  image: CachedNetworkImageProvider(
                                                    (allsongs[itemIndex]['thumbnails']
                                                            as List)
                                                        .last['url'],
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            subtitle: Text(
                                              sub,
                                              style: Spaces.Getstyle(
                                                10,
                                                const Color.fromARGB(
                                                  255,
                                                  129,
                                                  129,
                                                  129,
                                                ),
                                                FontWeight.normal,
                                              ),
                                              overflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                            title: Textutil(
                                              text:
                                                  allsongs[itemIndex]['title'],
                                              fontsize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                              ),
                            );
                          },
                        )
                        : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
