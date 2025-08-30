import 'dart:math';
import 'package:flutter/material.dart';

class InteractiveBarSlider extends StatelessWidget {
  final double position;
  final double duration;

  const InteractiveBarSlider({
    super.key,
    required this.position,
    required this.duration,
  });

  static const int numberOfBars = 200;

  String formatTime(double seconds) {
    int mins = seconds ~/ 60;
    int secs = (seconds % 60).toInt();
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(mins)}:${twoDigits(secs)}';
  }

  @override
  Widget build(BuildContext context) {
    final sliderValue =
        duration == 0 ? 0.0 : (position / duration).clamp(0.0, 1.0);

    final List<double> barHeights = List.generate(
      numberOfBars,
      (i) => 0.01 + (0.12 * sin((i / numberOfBars) * pi)),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: CustomPaint(
          painter: _StaticBarsPainter(
            barHeights,
            progress: sliderValue,
            activeColor: Colors.white,
            inactiveColor: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}

class _StaticBarsPainter extends CustomPainter {
  final List<double> heights;
  final double progress;
  final Color activeColor;
  final Color inactiveColor;

  _StaticBarsPainter(
    this.heights, {
    required this.progress,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double barWidth = size.width / heights.length;
    double centerY = size.height / 2;
    double borderRadius = 30;

    for (int i = 0; i < heights.length; i++) {
      double heightFactor = heights[i];
      double barHeight = size.height * 0.5 * heightFactor;
      double x = i * barWidth;

      final barPaint =
          Paint()
            ..color =
                (i / heights.length) <= progress ? activeColor : inactiveColor;

      final RRect rRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, centerY - barHeight, barWidth * 0.8, barHeight * 2),
        Radius.circular(borderRadius),
      );

      canvas.drawRRect(rRect, barPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _StaticBarsPainter oldDelegate) {
    return oldDelegate.heights != heights || oldDelegate.progress != progress;
  }
}
