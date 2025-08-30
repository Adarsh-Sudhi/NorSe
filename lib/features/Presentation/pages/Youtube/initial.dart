// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/features/Presentation/pages/Youtube/ytsearchpage/ytsearchpage.dart';

class YouTubeStyleHome extends StatefulWidget {
  const YouTubeStyleHome({super.key});

  @override
  State<YouTubeStyleHome> createState() => _YouTubeStyleHomeState();
}

class _YouTubeStyleHomeState extends State<YouTubeStyleHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Spaces.backgroundColor,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Ytsearchpage()),
              );
            },
            icon: Icon(Ionicons.search, color: Colors.white),
          ),
        ],
        title: const Textutil(
          text: 'NorSe Music',
          fontsize: 21,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SizedBox(),
    );
  }
}

/*

SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: BlocBuilder<YtmusicllaunchdataBloc, YtmusicllaunchdataState>(
            builder: (context, state) {
              return state.maybeWhen(
                initialLaunchdata: (initialdata, isloading, isfailed) {
                  final initial = initialdata['home'];
                  return isloading
                      ? Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                      : ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: size.height / 2.7,
                            width: size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                redTitleWidget(one: "Quick", two: " Picks"),
                                Expanded(
                                  child: QuickPicksyt(
                                    quickpicks: initialdata['songs'],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          initial[1].contents.isNotEmpty
                              ? YtmusicPlaylists(
                                size: size,
                                initial: initial,
                                index: 1,
                              )
                              : SizedBox(),

                          initial[3].contents.isNotEmpty
                              ? YtmusicPlaylists(
                                size: size,
                                initial: initial,
                                index: 3,
                              )
                              : SizedBox(),
                          initial[4].contents.isNotEmpty
                              ? YtmusicPlaylists(
                                size: size,
                                initial: initial,
                                index: 4,
                              )
                              : SizedBox(),
                          initial[10].contents.isNotEmpty
                              ? YtmusicPlaylists(
                                size: size,
                                initial: initial,
                                index: 10,
                              )
                              : SizedBox(),
                          initial[7].contents.isNotEmpty
                              ? YtmusicPlaylists(
                                size: size,
                                initial: initial,
                                index: 7,
                              )
                              : SizedBox(),
                          initial[1].contents.isNotEmpty
                              ? YtmusicPlaylists(
                                size: size,
                                initial: initial,
                                index: 1,
                              )
                              : SizedBox(),
                        ],
                      );
                },
                orElse: () {
                  return SizedBox();
                },
              );
            },
          ),
        ),
      ), *
    );
  }
}

class YtmusicPlaylists extends StatelessWidget {
  final List<HomeSection> initial;
  final int index;
  const YtmusicPlaylists({
    super.key,
    required this.initial,
    required this.index,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      width: size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*  redTitleWidget(one: '', two: initial[index].title),
            Spaces.kheight10,

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 17),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: initial[index].contents.length,
                  itemBuilder: (context, summerindex) {
                    List<dynamic> summer = initial[index].contents;
                    log(summer[0].runtimeType.toString());
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => YtmusicPlaylist(
                                  id: summer[summerindex].playlistId,
                                ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            Container(
                              height: size.height / 5,
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Colors.transparent,
                              ),
                              child: SizedBox(
                                width: size.width / 2.3,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      summer[summerindex].thumbnails[0].url,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                  placeholder:
                                      (context, url) => Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          'assets/musical-note.png',
                                          color: Colors.grey,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              child: Textutil(
                                text: summer[summerindex].name,
                                fontsize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}

class QuickPicksyt extends StatelessWidget {
  final List<SongDetailed> quickpicks;
  const QuickPicksyt({super.key, required this.quickpicks});

  @override
  Widget build(BuildContext context) {
    log(quickpicks.runtimeType.toString());
    Size size = MediaQuery.sizeOf(context);
    return PageView.builder(
      padEnds: false,
      controller: PageController(viewportFraction: 0.9, initialPage: 0),
      scrollDirection: Axis.horizontal,
      itemCount: (quickpicks.length / 4).ceil(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SizedBox(
            width: size.width,
            child: Column(
              children: List.generate(4, (innerIndex) {
                final itemIndex = index * 4 + innerIndex;
                if (itemIndex < quickpicks.length) {
                  return InkWell(
                    onTap: () {
                      log(quickpicks[itemIndex].videoId);
                      BlocProvider.of<AudioBloc>(context).add(
                        AudioEvent.onlineaudio(
                          quickpicks[itemIndex].videoId,
                          0,
                          quickpicks[itemIndex].type,
                          quickpicks[itemIndex].thumbnails.last.url,
                          quickpicks[itemIndex].name,
                          quickpicks[itemIndex].artist.name,
                          const [],
                          const [],
                          const [],
                          const [],
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: ListTile(
                          leading: Container(
                            height: 90,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  quickpicks[itemIndex].thumbnails.last.url,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            quickpicks[itemIndex].artist.name,
                            style: Spaces.Getstyle(
                              10,
                              const Color.fromARGB(255, 129, 129, 129),
                              FontWeight.normal,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          title: Text(
                            quickpicks[itemIndex].name,
                            style: Spaces.Getstyle(
                              15,
                              Colors.white,
                              FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
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
          ),
        );
      },
    );
  }
}
*/
