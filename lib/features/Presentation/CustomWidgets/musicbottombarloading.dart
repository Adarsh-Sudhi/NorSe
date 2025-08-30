import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../configs/constants/Spaces.dart';
import '../Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import '../pages/MainHomePage/MainHomePage.dart';

class MusicBottomBarloading extends StatefulWidget {
  const MusicBottomBarloading({super.key});

  @override
  State<MusicBottomBarloading> createState() => _MusicBottomBarloadingState();
}

class _MusicBottomBarloadingState extends State<MusicBottomBarloading>
    with TickerProviderStateMixin {
  late Animation<double> fadeanimation;
  late AnimationController fadeanimationcontroller;

  @override
  void initState() {
    super.initState();
    fadeanimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    fadeanimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: fadeanimationcontroller,
        curve: Curves.easeInToLinear,
      ),
    );

    fadeanimationcontroller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    fadeanimationcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeanimation,
      child: Container(
        height: 80,
        decoration: BoxDecoration(gradient: Spaces.musicgradient()),
        child: ListTile(
          leading: const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(color: Colors.white),
          ),
          title: const Loadingcustomgradient(),
          subtitle: const Loadingcustomgradient(),
          trailing: SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<AudioBloc>(
                      context,
                    ).add(const AudioEvent.SeekPreviousAudio());
                  },
                  icon: const Icon(
                    CupertinoIcons.backward_end_fill,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    CupertinoIcons.play_arrow,
                    color: Colors.black,
                    size: 19,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.forward_end_fill,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
