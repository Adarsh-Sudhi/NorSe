// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Data/Models/MusicModels/songmodel.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getalbumsongs_usecase.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/LocalSongs_bloc/localsong_bloc.dart'
    show LocalsongBloc, LocalsongEvent;
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/modelbottamsheet.dart';
import 'package:norse/features/Presentation/CustomWidgets/nullmusicWidget.dart';
import 'package:norse/features/Presentation/pages/saavn/subscreens/SongDetailsPage/SongDetailsPage.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:norse/injection_container.dart' as di;

class AlbumSongsPage extends StatelessWidget {
  final AlbumModel albumModel;
  AlbumSongsPage({super.key, required this.albumModel});

  final audioquery = di.di<Getalbumsongsusecase>();

  Future<List<SongModel>> getaudos(int id) async {
    Either<Failures, List<SongModel>> songs = await audioquery.repo
        .getalbumsongs(id);

    return await songs.fold(
      (e) async {
        return <SongModel>[];
      },
      (s) async {
        return s;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
      color: Spaces.backgroundColor,
      child: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                pinned: true,
                stretch: true,
                expandedHeight: 280,
                foregroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [StretchMode.zoomBackground],
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      QueryArtworkWidget(
                        nullArtworkWidget: const NullMusicAlbumWidget(),
                        id: albumModel.id,
                        type: ArtworkType.ALBUM,
                        keepOldArtwork: true,
                        artworkHeight: size.height,
                        artworkWidth: size.width,
                        artworkFit: BoxFit.cover,
                        size: 700,
                        artworkBorder: BorderRadius.circular(0),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.transparent],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textutil(
                                  text: albumModel.album,
                                  fontsize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                Row(
                                  children: [
                                    Textutil(
                                      text: "Album  •  ",
                                      fontsize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    Textutil(
                                      text: "songs ${albumModel.numOfSongs}",
                                      fontsize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                future: getaudos(albumModel.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    final songModel = snapshot.data;

                    return SliverPadding(
                      padding: const EdgeInsets.only(bottom: 20),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: songModel!.length,
                          (context, index) {
                            SongModel details = songModel[index];
                            return InkWell(
                              onTap: () {
                                Notifiers.showplayer.value = true;

                                BlocProvider.of<YoutubePlayerBackgroundBloc>(
                                  context,
                                ).add(YoutubePlayerBackgroundEvent.started());
                                
                                BlocProvider.of<AudioBloc>(context).add(
                                  AudioEvent.localaudio(songModel, [], index),
                                );
                              },
                              child: LocalAlbumsonglistWidget(
                                song: songModel[index],
                                audios: songModel,
                                id: details.id,
                                title: details.title,
                                artist: details.artist,
                                uri: details.uri!,
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: SizedBox(), // Or a loading indicator
                    );
                  }
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class LocalAlbumsonglistWidget extends StatelessWidget {
  final int id;
  final String title;
  final String? artist;
  final String uri;
  final int index;
  final List<SongModel> audios;
  final SongModel song;
  const LocalAlbumsonglistWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.artist,
    required this.uri,
    required this.audios,
    required this.song,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.black,
            context: context,
            builder: (context) {
              return IndividialSongMenu(
                index: index,
                audios: audios,
                song: song,
              );
            },
          );
        },
        icon: const Icon(Icons.more_vert),
      ),
      subtitle: Textutil(
        text: artist ?? 'null',
        fontsize: 10,
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.normal,
      ),
      title: Textutil(
        text: title,
        fontsize: 15,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      leading: QueryArtworkWidget(
        nullArtworkWidget: const NullMusicAlbumWidget(),
        keepOldArtwork: true,
        id: id,
        artworkBorder: BorderRadius.circular(10),
        type: ArtworkType.AUDIO,
      ),
    );
  }
}

class IndividialSongMenu extends StatelessWidget {
  const IndividialSongMenu({
    super.key,
    required this.song,
    required this.audios,
    required this.index,
  });
  final SongModel song;
  final List<SongModel> audios;
  final int index;

  _showmodelsheet(Songmodel songmodel, BuildContext context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Custombottomsheet(songModel: songmodel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                QueryArtworkWidget(
                  keepOldArtwork: true,
                  nullArtworkWidget: const NullMusicAlbumWidget(),
                  artworkBorder: BorderRadius.circular(5),
                  id: song.id,
                  type: ArtworkType.AUDIO,
                  artworkHeight: 50,
                  artworkWidth: 50,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textutil(
                          text: song.title,
                          fontsize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        Textutil(
                          text: song.artist ?? 'unkown',
                          fontsize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.share, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Divider(thickness: 1, color: Colors.white.withOpacity(0.2)),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IndividualItemwidgets(
                          iconcolor: Colors.white,
                          title: 'Play',
                          iconDatal: CupertinoIcons.play_arrow_solid,
                          voidCallback: () {
                            BlocProvider.of<AudioBloc>(
                              context,
                            ).add(AudioEvent.localaudio(audios, [], index));
                          },
                        ),
                        IndividualItemwidgets(
                          iconcolor: Colors.white,
                          title: 'Add to queue',
                          iconDatal: Icons.queue,
                          voidCallback: () {
                            Songmodel songmodel = Songmodel(
                              id: song.id,
                              title: song.title,
                              subtitle: song.artist ?? "unkown",
                              uri: song.uri!,
                            );
                            BlocProvider.of<AudioBloc>(context).add(
                              AudioEvent.addsongtoqueue('local', songmodel),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 1, color: Colors.white.withOpacity(0.2)),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IndividualItemwidgets(
                          iconcolor: Colors.white,
                          title: 'Add to playlist',
                          iconDatal: Icons.playlist_add,
                          voidCallback: () {
                            Songmodel songmodel = Songmodel(
                              id: song.id,
                              title: song.title,
                              subtitle: song.artist ?? 'unkown',
                              uri: song.uri!,
                            );
                            _showmodelsheet(songmodel, context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 1, color: Colors.white.withOpacity(0.2)),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /*  IndividualItemwidgets(
                            iconcolor: Colors.red,
                            title: 'Delete from device',
                            iconDatal: Icons.delete,
                            voidCallback: () {
                              Notifiers.showMenu.value = false;
                              showAlert(context, song.title);
                            }), */
                        IndividualItemwidgets(
                          iconcolor: Colors.red,
                          title: 'Close',
                          iconDatal: Icons.close_outlined,
                          voidCallback: () {
                            Notifiers.showMenu.value = false;
                            // Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> showAlert(BuildContext context, String title) {
    return showDialog(
      context: context,
      builder: (dialogcontext) {
        return Dialog(
          surfaceTintColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.black,
          child: SizedBox(
            height: 200,
            width: MediaQuery.sizeOf(dialogcontext).width / 1.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Textutil(
                    text: 'Delete Song?',
                    fontsize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  Text(
                    'Are you sure you want to Delete : $title',
                    style: Spaces.Getstyle(14, Colors.white, FontWeight.normal),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MenuCoinfirmIcon(
                        textcolor: Colors.black,
                        title: 'Cancel',
                        ontap: () {
                          Navigator.of(dialogcontext).pop();
                        },
                        backgroundColor: Colors.white,
                      ),
                      MenuCoinfirmIcon(
                        textcolor: Colors.white,
                        title: 'Delete',
                        ontap: () {
                          BlocProvider.of<AudioBloc>(dialogcontext).add(
                            AudioEvent.clearspecificaudio(song.data, song.id),
                          );
                          BlocProvider.of<LocalsongBloc>(dialogcontext).add(
                            LocalsongEvent.removesongsfromdevice(
                              index,
                              song.data,
                            ),
                          );

                          Navigator.of(dialogcontext).pop();
                        },
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MenuCoinfirmIcon extends StatelessWidget {
  const MenuCoinfirmIcon({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.ontap,
    required this.textcolor,
  }) : super(key: key);
  final String title;
  final Color backgroundColor;
  final VoidCallback ontap;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Center(
          child: Textutil(
            text: title,
            fontsize: 13,
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class IndividualItemwidgets extends StatelessWidget {
  const IndividualItemwidgets({
    super.key,
    required this.title,
    required this.iconDatal,
    required this.voidCallback,
    required this.iconcolor,
  });
  final String title;
  final IconData iconDatal;
  final VoidCallback voidCallback;
  final Color iconcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        onTap: voidCallback,
        child: Row(
          children: [
            Icon(iconDatal, color: iconcolor, size: 22),
            const SizedBox(width: 18),
            Textutil(
              text: title,
              fontsize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}