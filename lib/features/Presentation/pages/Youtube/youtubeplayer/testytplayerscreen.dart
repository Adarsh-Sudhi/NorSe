import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/pages/Youtube/Channelvids/yoututbechannelvids.dart';
import 'package:norse/features/Presentation/pages/Youtube/youtubescreen/ytdownloadoptionspage.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytrelatedvideos_bloc/ytrelatedvideos_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/custumlistviewbuilder.dart';
import '../../../../../configs/constants/Spaces.dart';
import '../youtubescreen/ytpage.dart';
import 'package:media_kit_video/media_kit_video.dart' as media;

bool isfloating = false;
bool isready = false;

class Testytplayer extends StatefulWidget {
  static const String testytplayer = "./testytplayer";

  const Testytplayer({
    super.key,
    required this.video,
    required this.index,
    required this.height,
    required this.persentage,
    required this.context,
  });

  final List<Video> video;

  final int index;

  final double height;

  final double persentage;

  final BuildContext context;

  @override
  State<Testytplayer> createState() => _TestytplayerState();
}

class _TestytplayerState extends State<Testytplayer> {
  String channelid = '';
  String channeltitle = '';
  String logourl = '';
  String bannerurl = '';

  @override
  void initState() {
    loadInitialvid(widget.index);

    super.initState();
    
    BlocProvider.of<AudioBloc>(context).add(AudioEvent.dispose());
  }

  loadInitialvid(int index) async {
    BlocProvider.of<YtrelatedvideosBloc>(context).add(
      YtrelatedvideosEvent.relatedvideos(
        widget.video[widget.index].id.toString(),
      ),
    );
  }

  String formatdatetime(DateTime dateTime) {
    String date = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    return date;
  }

  String formatLikeCount(int count) {
    if (count >= 1000000000) {
      return '${(count / 1000000000).toStringAsFixed(1)}B';
    } else if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }

  String formatViewCount(int count) {
    if (count >= 1000000000) {
      return '${(count / 1000000000).toStringAsFixed(1)}B'; // Billions
    } else if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M'; // Millions
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K'; // Thousands
    } else {
      return count.toString();
    }
  }

  @override
  void dispose() {
    super.dispose();
    Notifiers.isytvisible.value = false;
    enablePip(context,autoEnable: false);
  }

  final floating = Floating();

  Future<void> enablePip(
    BuildContext context, {
    bool autoEnable = false,
  }) async {

  await floating.cancelOnLeavePiP();
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Material(
        color: Spaces.backgroundColor,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: BlocBuilder<YoutubeplayerBloc, YoutubeplayerState>(
            builder: (context, state) {
              return state.maybeWhen(
                switchstate: () {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          color: Colors.black,
                          height: 70,
                          width: 100,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Spaces.baseColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Textutil(
                        text: 'Player Busy try Again later',
                        fontsize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(),
                    ],
                  );
                },
                youtubeplayerstate: (
                  info,
                  index,
                  vid,
                  isloading,
                  failed,
                  controller,
                  streams,
                ) {
                  return PiPSwitcher(
                    childWhenEnabled: media.Video(
                      controller: controller,
                      fit: BoxFit.cover,
                    ),
                    childWhenDisabled: SafeArea(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height / 4,
                            child: media.Video(
                              controller: controller,
                              fit: BoxFit.cover,
                            ),
                          ),
                          isloading
                              ? VideoMetaLoading()
                              : Container(
                                height: 45,
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            (info['video'] as Video).title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Textutil(
                                                text:
                                                    "${(info['video'] as Video).author}  •  ",
                                                fontsize: 10,
                                                color: Spaces.textColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Textutil(
                                                text:
                                                    "${formatLikeCount(((info['video'] as Video).engagement.viewCount).toInt())} views  • ",
                                                fontsize: 10,
                                                color: Spaces.textColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              Textutil(
                                                text: timeago.format(
                                                  (info['video'] as Video)
                                                      .uploadDate!,
                                                ),
                                                fontsize: 10,
                                                color: Spaces.textColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.zero,
                                                        ),
                                                    backgroundColor:
                                                        Spaces.backgroundColor,
                                                    context: context,
                                                    builder: (context) {
                                                      return SingleChildScrollView(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        child: SafeArea(
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.all(
                                                                      20,
                                                                    ),
                                                                child: Text(
                                                                  (info['video']
                                                                          as Video)
                                                                      .description,
                                                                  style: Spaces.Getstyle(
                                                                    12,
                                                                    Spaces
                                                                        .textColor,
                                                                    FontWeight
                                                                        .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: const Textutil(
                                                  text: "  ...more",
                                                  fontsize: 10,
                                                  color: Spaces.textColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                          Spaces.kheigth5,

                          isloading
                              ? ChannelInfoLoading()
                              : Container(
                                height: 45,
                                padding: const EdgeInsets.all(6),

                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // Channel Image
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            (info['channel'] as Channel)
                                                .logoUrl,
                                          ),
                                        ),
                                        const SizedBox(width: 12),

                                        // Channel Name
                                        Textutil(
                                          text:
                                              (info['channel'] as Channel)
                                                  .title,
                                          fontsize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),

                                    // View Channel Button
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (_) => YoutubeChannelVideos(
                                                  title:
                                                      (info['channel']
                                                              as Channel)
                                                          .title,
                                                  logo:
                                                      (info['channel']
                                                              as Channel)
                                                          .logoUrl,
                                                  banner:
                                                      (info['channel']
                                                              as Channel)
                                                          .bannerUrl,
                                                  channelid:
                                                      (info['channel']
                                                              as Channel)
                                                          .id,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(
                                            alpha: 0.1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: Colors.white24,
                                          ),
                                        ),
                                        child: const Text(
                                          'View Channel',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                          Spaces.kheigth5,
                          isloading
                              ? const MetaDataLoading()
                              : MetaDataSection(video: info),

                          Spaces.kheight10,
                          Expanded(
                            child: BlocBuilder<
                              YtrelatedvideosBloc,
                              YtrelatedvideosState
                            >(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  suggestion: (relatedvideo) {
                                    return RepaintBoundary(
                                      child: CustomListViewBuilderwidget(
                                        physics: const BouncingScrollPhysics(),
                                        length: relatedvideo.length,
                                        widget: (p0, index) {
                                          Video vid = relatedvideo[index];
                                          return InkWell(
                                            onTap: () {
                                              BlocProvider.of<
                                                YtrelatedvideosBloc
                                              >(context).add(
                                                YtrelatedvideosEvent.relatedvideos(
                                                  relatedvideo[index].id
                                                      .toString(),
                                                ),
                                              );
                                              BlocProvider.of<
                                                YoutubeplayerBloc
                                              >(context).add(
                                                YoutubeplayerEvent.ytplayerevent(
                                                  relatedvideo,
                                                  index,
                                                ),
                                              );
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 220,
                                                  width:
                                                      MediaQuery.sizeOf(
                                                        context,
                                                      ).width,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                  ),
                                                  child: Cachednetimagewidget(
                                                    thumbnailSet:
                                                        vid.thumbnails,
                                                  ),
                                                ),
                                                Spaces.kheight10,
                                                Textutil(
                                                  text: vid.title,
                                                  fontsize: 15,
                                                  color: Spaces.textColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                Row(
                                                  children: [
                                                    Textutil(
                                                      text: "${vid.author}  •",
                                                      fontsize: 10,
                                                      color: Spaces.textColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Textutil(
                                                      text:
                                                          "${formatViewCount(vid.engagement.viewCount)} views  •",
                                                      fontsize: 10,
                                                      color: Spaces.textColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Textutil(
                                                      text: timeago.format(
                                                        vid.uploadDate!,
                                                      ),
                                                      fontsize: 10,
                                                      color: Spaces.textColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                                const Textutil(
                                                  text: '',
                                                  fontsize: 10,
                                                  color: Spaces.textColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                Spaces.kheight20,
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  laoding:
                                      () => CustomListViewBuilderwidget(
                                        length: 3,
                                        widget:
                                            (p0, p1) => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Customshimmer(
                                                  height: size.height / 4,
                                                  width: size.width,
                                                  radius: 5,
                                                ),
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Spaces.kheight10,
                                                    Customshimmer(
                                                      height: 16,
                                                      width: 250,
                                                      radius: 30,
                                                    ),
                                                    Spaces.kheight10,
                                                    Customshimmer(
                                                      height: 10,
                                                      width: 170,
                                                      radius: 30,
                                                    ),
                                                    Spaces.kheight10,
                                                  ],
                                                ),
                                              ],
                                            ),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                      ),
                                  orElse:
                                      () => RepaintBoundary(
                                        child: ListTobe(video: widget.video),
                                      ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class VideoMetaLoading extends StatelessWidget {
  const VideoMetaLoading({super.key});

  Widget _shimmerBar(double width, double height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.only(top: 5),

      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerBar(160, 14),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _shimmerBar(60, 10),
                      const SizedBox(width: 6),
                      _shimmerBar(50, 10),
                      const SizedBox(width: 6),
                      _shimmerBar(40, 10),
                      const SizedBox(width: 6),
                      _shimmerBar(30, 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChannelInfoLoading extends StatelessWidget {
  const ChannelInfoLoading({super.key});

  Widget _shimmerBox({
    double width = 60,
    double height = 12,
    double radius = 6,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  Widget _shimmerCircle({double size = 40}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.all(6),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _shimmerCircle(),
              const SizedBox(width: 12),
              _shimmerBox(width: 100, height: 14),
            ],
          ),
          _shimmerBox(width: 90, height: 28, radius: 20),
        ],
      ),
    );
  }
}

class LoadingMetadataContaiiners extends StatelessWidget {
  const LoadingMetadataContaiiners({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Customshimmer(height: 30, width: 90, radius: 20),
        SizedBox(width: 5),
        Customshimmer(height: 30, width: 90, radius: 20),
        SizedBox(width: 5),
        Customshimmer(height: 30, width: 90, radius: 20),
      ],
    );
  }
}

class Loadingg extends StatelessWidget {
  const Loadingg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Spaces.baseColor,
      ),
    );
  }
}

class ListTobe extends StatelessWidget {
  const ListTobe({super.key, required this.video});

  final List<Video> video;

  String formatViewCount(int count) {
    if (count >= 1000000000) {
      return '${(count / 1000000000).toStringAsFixed(1)}B'; // Billions
    } else if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M'; // Millions
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K'; // Thousands
    } else {
      return count.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomListViewBuilderwidget(
      physics: const BouncingScrollPhysics(),
      length: video.length,
      widget: (p0, index) {
        Video vid = video[index];
        return InkWell(
          onTap: () {
            BlocProvider.of<YtrelatedvideosBloc>(context).add(
              YtrelatedvideosEvent.relatedvideos(video[index].id.toString()),
            );
            BlocProvider.of<YoutubeplayerBloc>(
              context,
            ).add(YoutubeplayerEvent.ytplayerevent(video, index));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: MediaQuery.sizeOf(context).width,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Cachednetimagewidget(thumbnailSet: vid.thumbnails),
              ),
              Spaces.kheight10,
              Textutil(
                text: vid.title,
                fontsize: 15,
                color: Spaces.textColor,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Textutil(
                    text: "${vid.author}  •",
                    fontsize: 10,
                    color: Spaces.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(width: 10),
                  Textutil(
                    text:
                        "${formatViewCount(vid.engagement.viewCount)} views  •",
                    fontsize: 10,
                    color: Spaces.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(width: 10),
                  Textutil(
                    text: timeago.format(vid.uploadDate!),
                    fontsize: 10,
                    color: Spaces.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const Textutil(
                text: '',
                fontsize: 10,
                color: Spaces.textColor,
                fontWeight: FontWeight.normal,
              ),
              Spaces.kheight20,
            ],
          ),
        );
      },
    );
    /* ListView.builder(
        itemCount: video.length,
        itemBuilder: (context, index) {
          Video vid = video[index];
          return InkWell(
            onTap: () {
              BlocProvider.of<YtrelatedvideosBloc>(context).add(
                  YtrelatedvideosEvent.relatedvideos(
                      video[index].id.toString()));
              BlocProvider.of<YoutubeplayerBloc>(context)
                  .add(YoutubeplayerEvent.ytplayerevent(video, index));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 220,
                  width: MediaQuery.sizeOf(context).width,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Cachednetimagewidget(
                    thumbnailSet: vid.thumbnails,
                  ),
                ),
                Spaces.kheight10,
                Textutil(
                  text: vid.title,
                  fontsize: 15,
                  color: Spaces.textColor,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    Textutil(
                      text: "${vid.author}  •",
                      fontsize: 10,
                      color: Spaces.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 10),
                    Textutil(
                      text:
                          "${formatViewCount(vid.engagement.viewCount)} views  •",
                      fontsize: 10,
                      color: Spaces.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 10),
                    Textutil(
                      text: timeago.format(vid.uploadDate!),
                      fontsize: 10,
                      color: Spaces.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const Textutil(
                  text: '',
                  fontsize: 10,
                  color: Spaces.textColor,
                  fontWeight: FontWeight.normal,
                ),
                Spaces.kheight20,
              ],
            ),
          );
        }); */

    /* CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              Video vid = video[index];

              return InkWell(
                onTap: () {
                  BlocProvider.of<YtrelatedvideosBloc>(context).add(
                      YtrelatedvideosEvent.relatedvideos(
                          video[index].id.toString()));
                  BlocProvider.of<YoutubeplayerBloc>(context)
                      .add(YoutubeplayerEvent.ytplayerevent(video, index));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      width: MediaQuery.sizeOf(context).width,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Cachednetimagewidget(
                        thumbnailSet: vid.thumbnails,
                      ),
                    ),
                    Spaces.kheight10,
                    Textutil(
                      text: vid.title,
                      fontsize: 15,
                      color: Spaces.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        Textutil(
                          text: "${vid.author}  •",
                          fontsize: 10,
                          color: Spaces.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(width: 10),
                        Textutil(
                          text:
                              "${formatViewCount(vid.engagement.viewCount)} views  •",
                          fontsize: 10,
                          color: Spaces.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(width: 10),
                        Textutil(
                          text: timeago.format(vid.uploadDate!),
                          fontsize: 10,
                          color: Spaces.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    const Textutil(
                      text: '',
                      fontsize: 10,
                      color: Spaces.textColor,
                      fontWeight: FontWeight.normal,
                    ),
                    Spaces.kheight20,
                  ],
                ),
              );
            },
            childCount: video.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
          ),
        )
      ],
    ); */
  }
}

bool _ispipenabled = false;

class MetaDataLoading extends StatelessWidget {
  const MetaDataLoading({super.key});

  Widget _shimmerBox({double width = 40, double height = 10}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  Widget _shimmerIcon() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(vertical: 1),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _shimmerIcon(),
              const SizedBox(height: 4),
              _shimmerBox(),
            ],
          );
        }),
      ),
    );
  }
}

class MetaDataSection extends StatefulWidget {
  const MetaDataSection({super.key, required this.video});
  final Map video;

  @override
  State<MetaDataSection> createState() => _MetaDataSectionState();
}

class _MetaDataSectionState extends State<MetaDataSection> {
  final floating = Floating();
  String formatLikeCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }

  Future<void> enablePip(
    BuildContext context, {
    bool autoEnable = false,
  }) async {
    final rational = Rational.landscape();
    final screenSize =
        MediaQuery.of(context).size * MediaQuery.of(context).devicePixelRatio;
    final height = screenSize.width ~/ rational.aspectRatio;

    final arguments = OnLeavePiP(
      aspectRatio: rational,
      sourceRectHint: Rectangle<int>(
        0,
        (screenSize.height ~/ 2) - (height ~/ 2),
        screenSize.width.toInt(),
        height,
      ),
    );

    autoEnable ? await floating.enable(arguments) : floating.cancelOnLeavePiP();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 1),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Like Button
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
              SizedBox(height: 4),
              Text(
                "${formatLikeCount((widget.video['video'] as Video).engagement.likeCount!.toInt())} likes",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.thumb_down_alt_outlined, color: Colors.white),
              SizedBox(height: 4),
              Text(
                formatLikeCount(widget.video['dislike']),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),

          // Download Button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => YtDownloadPagesOptions(info: widget.video),
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.download_outlined, color: Colors.white),
                SizedBox(height: 4),
                Text(
                  'Download',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),

          // Share Button
          GestureDetector(
            onTap: () async {
              setState(() => _ispipenabled = !_ispipenabled);
              await enablePip(context, autoEnable: _ispipenabled);
            },

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.picture_in_picture,
                  color: _ispipenabled ? Colors.red : Colors.white,
                ),
                SizedBox(height: 4),
                Text(
                  'PIP',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingContainers extends StatelessWidget {
  const LoadingContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Customshimmer(height: 30, width: 90, radius: 30),
            SizedBox(width: 5),
            Customshimmer(height: 30, width: 90, radius: 30),
            SizedBox(width: 5),
            Customshimmer(height: 30, width: 90, radius: 30),
          ],
        ),
      ],
    );
  }
}

class Likeicons extends StatelessWidget {
  final String text;
  final IconData icon;
  final MainAxisAlignment mainAxisAlignment;
  const Likeicons({
    super.key,
    required this.text,
    required this.icon,
    required this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Spaces.iconColor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 30,
      width: 90,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Icon(icon, size: 11, color: Colors.white),
          const SizedBox(width: 6),
          Textutil(
            text: text,
            fontsize: 8,
            color: Spaces.textColor,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

class Customshimmer extends StatelessWidget {
  const Customshimmer({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
  });
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: Color(0xFFB0BEC5),
      highlightColor: Color(0xFFCFD8DC),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 3, 33, 57),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class Cachednetimagewidget extends StatelessWidget {
  const Cachednetimagewidget({super.key, required this.thumbnailSet});

  final ThumbnailSet thumbnailSet;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, url, error) {
        return Thumbnailfuturebuilder(video: thumbnailSet);
      },
      imageUrl: thumbnailSet.maxResUrl,
      fit: BoxFit.cover,
    );
  }
}

class Ytloadingshimmer extends StatelessWidget {
  const Ytloadingshimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spaces.kheight10,
        Expanded(
          child: CustomListViewBuilderwidget(
            physics: const BouncingScrollPhysics(),
            length: 7,
            widget: (p0, p1) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Customshimmer(
                    height: MediaQuery.sizeOf(context).height / 4,
                    width: MediaQuery.sizeOf(context).width,
                    radius: 5,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spaces.kheight10,
                      Customshimmer(height: 16, width: 200, radius: 30),
                      Spaces.kheight10,
                      Customshimmer(height: 10, width: 150, radius: 30),
                      Spaces.kheight10,
                    ],
                  ),
                ],
              );
            },
          ) /* ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customshimmer(
                height: MediaQuery.sizeOf(context).height / 4,
                width: MediaQuery.sizeOf(context).width,
                radius: 5,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spaces.kheight10,
                  Customshimmer(
                    height: 16,
                    width: 200,
                    radius: 30,
                  ),
                  Spaces.kheight10,
                  Customshimmer(
                    height: 10,
                    width: 150,
                    radius: 30,
                  ),
                  Spaces.kheight10,
                ],
              )
            ],
          );
        },
      )*/,
        ),
      ],
    );
  }
}
