// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_kit_video/media_kit_video.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    Key? key,
    required this.postion,
    required this.duration,
    required this.trackHeight,
    required this.thumshape,
    this.secondaryTrackValue,
    required this.audioPlayer,
    this.videoController,
    this.durationyt,
    required this.activecolor,
    required this.inactiveColor,
  }) : super(key: key);
  final double postion;
  final double duration;
  final double trackHeight;
  final SliderComponentShape thumshape;
  final double? secondaryTrackValue;
  final AudioPlayer audioPlayer;
  final VideoController? videoController;
  final Duration? durationyt;
  final Color activecolor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackShape: const RectangularSliderTrackShape(),
        trackHeight: trackHeight,
        thumbShape: thumshape,
      ),
      child: Slider(
        
        secondaryTrackValue: secondaryTrackValue ?? 0,
        secondaryActiveColor: Colors.grey.withValues(alpha: 0.5),
        thumbColor: const Color.fromARGB(255, 255, 255, 255),
        activeColor: activecolor,
        inactiveColor: inactiveColor,
        value: postion,
        max: duration,
        min: const Duration(microseconds: 0).inSeconds.toDouble(),
        onChanged: (value) async {
          if (videoController != null && durationyt != null) {
            await videoController!.player.seek(
              Duration(seconds: postion.toInt()),
            );
          }

          Duration duration = Duration(seconds: value.toInt());
          await audioPlayer.seek(duration);
        },
      ),
    );
  }
}
