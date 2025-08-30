import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytchannel_bloc/youtubechannel_bloc.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../../configs/constants/Spaces.dart';
import '../../../Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import '../youtubeplayer/testytplayerscreen.dart';

class YoutubeChannelVideos extends StatefulWidget {
  final dynamic channelid;
  final String title;
  final String logo;
  final String banner;
  const YoutubeChannelVideos({
    super.key,
    this.channelid,
    required this.title,
    required this.logo,
    required this.banner,
  });

  @override
  State<YoutubeChannelVideos> createState() => _YoutubeChannelVideosState();
}

class _YoutubeChannelVideosState extends State<YoutubeChannelVideos> {
  @override
  void initState() {
    log(widget.logo);
    super.initState();
    BlocProvider.of<YoutubechannelBloc>(context)
        .add(YoutubechannelEvent.getuploadsevent(widget.channelid));
  }

  String formatdatetime(DateTime dateTime) {
    String date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    return date;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Spaces.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 15,
            )),
        backgroundColor: Spaces.backgroundColor,
        title: Textutil(
            text: widget.title,
            fontsize: 20,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      ),
      body: SafeArea(
        child: BlocBuilder<YoutubechannelBloc, YoutubechannelState>(
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => const Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                uploads: (list, isloading) {
                  return ListView(
                    children: [
                      Spaces.kheigth5,
                      Container(
                        height: 200,
                        width: size.width,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                                fit: BoxFit.cover, imageUrl: widget.logo),
                            Container(
                              color: Colors.transparent.withOpacity(0.6),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Textutil(
                                  text: widget.title,
                                  fontsize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spaces.kheight10,
                      CustomScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        slivers: [
                          SliverList.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    List<Video> vids = [];
                                    for (var i = 0; i < list.length; i++) {
                                      vids.add(list[i]);
                                    }

                                    BlocProvider.of<YoutubeplayerBloc>(context)
                                        .add(YoutubeplayerEvent.ytplayerevent(
                                            vids, index));
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 90,
                                            width: 150,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Cachednetimagewidget(
                                                thumbnailSet:
                                                    list[index].thumbnails)),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Textutil(
                                                  text: list[index].title,
                                                  fontsize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              Textutil(
                                                  text: list[index].author,
                                                  fontsize: 12,
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.normal)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                          )
                        ],
                      ),
                    ],
                  );
                },
                orElse: () => const SizedBox());
          },
        ),
      ),
    );
  }
}
