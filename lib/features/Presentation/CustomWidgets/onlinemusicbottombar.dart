import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:rxdart/rxdart.dart';
import 'package:norse/features/Data/Models/MusicModels/onlinesongmodel.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:norse/features/Presentation/CustomWidgets/muscibottombarwidget.dart';
import 'package:norse/features/Presentation/pages/saavn/musicplayerpage/models/mode1.dart';

class Onlinemusicbottombar extends StatefulWidget {
  final ValueStream<AudioState> valueStream;
  final AudioPlayer audioPlayer;
  final bool isloading;
  final int index;
  final List<OnlineSongModel> audios;
  const Onlinemusicbottombar({
    super.key,
    required this.valueStream,
    required this.audioPlayer,
    required this.isloading,
    required this.index,
    required this.audios,
  });

  @override
  State<Onlinemusicbottombar> createState() => _OnlinemusicbottombarState();
}

class _OnlinemusicbottombarState extends State<Onlinemusicbottombar>
    with TickerProviderStateMixin {
  void changeduration(int sceconds, AudioPlayer player) {
    Duration duration = Duration(seconds: sceconds);
    player.seek(duration);
  }

  late Animation<double> fadeanimation;
  late AnimationController fadeanimationcontroller;
  late Animation<Offset> offsetanimation;
  late AnimationController slidetransition;

  @override
  void initState() {
    super.initState();
    slidetransition = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    offsetanimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: slidetransition, curve: Curves.easeInToLinear),
    );

    fadeanimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    fadeanimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: fadeanimationcontroller,
        curve: Curves.easeInToLinear,
      ),
    );
    slidetransition.forward();
    fadeanimationcontroller.forward();
  }

  @override
  void didUpdateWidget(covariant Onlinemusicbottombar oldWidget) {
    super.didUpdateWidget(oldWidget);
    fadeanimationcontroller.reset();
    fadeanimationcontroller.forward();
  }

  @override
  void dispose() {
    fadeanimationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.valueStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          double postion =
              snapshot.data!
                  .maybeMap(
                    orElse: () => 0,
                    onlinestreams: (value) => value.pos.inSeconds,
                  )
                  .toDouble();

          double duration =
              snapshot.data!
                  .maybeMap(
                    orElse: () => 0,
                    onlinestreams: (value) => value.dur.inSeconds,
                  )
                  .toDouble();
          int songindex = snapshot.data!.maybeMap(
            orElse: () => 0,
            onlinestreams: (val) => val.index,
          );

          PlayerState dupplayerstate = PlayerState(
            false,
            ProcessingState.loading,
          );

          PlayerState playerState = snapshot.data!.maybeMap(
            orElse: () => dupplayerstate,
            onlinestreams: (value) => value.playerState,
          );

          return SlideTransition(
            position: offsetanimation,
            child: FadeTransition(
              opacity: fadeanimation,
              child: MusicbottombarWidget(
                isloading: widget.isloading,
                onchange:
                    (value) =>
                        changeduration(value.toInt(), widget.audioPlayer),
                pos: postion,
                dur: duration,
                ontap: () {
                  Navigator.push(
                    context,
                    PageAnimationTransition(
                      page: Model1(index: songindex),
                      pageAnimationType: FadeAnimationTransition(),
                    ),
                  );
                },

                type: 'online',
                songindex: songindex,
                playerState: playerState,
                audioPlayer: widget.audioPlayer,
                audios: widget.audios,
              ),
            ),
          );
        } else {
          return const SizedBox(height: 70);
        }
      },
    );
  }
}
