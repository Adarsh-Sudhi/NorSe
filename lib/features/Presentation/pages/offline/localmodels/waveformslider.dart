import 'package:flutter/material.dart';

late AnimationController Wavecontroller;
late Animation<double> waveheightScale;

class InteractiveBarSlideer extends StatefulWidget {
  final double position;
  final double duration;
  final List<int> waveList;

  const InteractiveBarSlideer({
    super.key,
    required this.position,
    required this.duration,
    required this.waveList,
  });

  static const int numberOfBars = 250;

  @override
  State<InteractiveBarSlideer> createState() => _InteractiveBarSlideerState();
}

class _InteractiveBarSlideerState extends State<InteractiveBarSlideer>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(covariant InteractiveBarSlideer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.waveList != widget.waveList &&
        oldWidget.waveList.isNotEmpty) {
      //  Wavecontroller.reverse().then((e) {
      // {
      //  if (mounted && Wavecontroller.status.isDismissed) {
      Wavecontroller.forward();
      //    }
      //   }
      // });
    }
    // _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    Wavecontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    waveheightScale = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: Wavecontroller, curve: Curves.easeOut));

    Wavecontroller.forward();
  }

  @override
  void dispose() {
    //Wavecontroller.dispose();
    super.dispose();
  }

  String formatTime(double seconds) {
    int mins = seconds ~/ 60;
    int secs = (seconds % 60).toInt();
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(mins)}:${twoDigits(secs)}';
  }

  @override
  Widget build(BuildContext context) {
    final sliderValue =
        widget.duration == 0
            ? 0.0
            : (widget.position / widget.duration).clamp(0.0, 1.0);

    final reducedWaveList = _reduceWaveList(widget.waveList);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 30,
        child: AnimatedBuilder(
          animation: waveheightScale,
          builder: (context, child) {
            return CustomPaint(
              painter: _WaveBarsPainter(
                reducedWaveList,
                progress: sliderValue,
                heightScale: waveheightScale.value,
                activeColor: Colors.white.withOpacity(0.9),
                inactiveColor: Colors.grey.withOpacity(0.5),
              ),
            );
          },
        ),
      ),
    );
  }

  List<int> _reduceWaveList(List<int> waveList) {
    int step = waveList.length ~/ InteractiveBarSlideer.numberOfBars;
    List<int> reducedList = [];

    for (int i = 0; i < InteractiveBarSlideer.numberOfBars; i++) {
      int startIndex = i * step;
      int endIndex = (i + 1) * step;
      if (endIndex > waveList.length) endIndex = waveList.length;

      int sum = 0;
      for (int j = startIndex; j < endIndex; j++) {
        sum += waveList[j];
      }
      int avg = (sum / (endIndex - startIndex)).toInt();
      reducedList.add(avg);
    }

    return reducedList;
  }
}

class _WaveBarsPainter extends CustomPainter {
  final List<int> waveList;
  final double progress;
  final double heightScale;
  final Color activeColor;
  final Color inactiveColor;

  _WaveBarsPainter(
    this.waveList, {
    required this.progress,
    required this.heightScale,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double barWidth = size.width / waveList.length;
    double centerY = size.height / 2;
    double borderRadius = 30;
    double heightMultiplier = 1.2;

    for (int i = 0; i < waveList.length; i++) {
      double waveValue = waveList[i] / 100.0;
      double barHeight =
          size.height * heightMultiplier * waveValue * heightScale;

      double x = i * barWidth;

      final barPaint =
          Paint()
            ..color =
                (i / waveList.length) <= progress ? activeColor : inactiveColor;

      final RRect rRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, centerY - barHeight, barWidth * 0.8, barHeight * 2),
        Radius.circular(borderRadius),
      );

      canvas.drawRRect(rRect, barPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _WaveBarsPainter oldDelegate) {
    return oldDelegate.waveList != waveList ||
        oldDelegate.progress != progress ||
        oldDelegate.heightScale != heightScale;
  }
}



/*
class InteractiveBarSlideer extends StatelessWidget {
  final double position; 
  final double duration;
  final List<int> waveList; // List of waveform values

  const InteractiveBarSlideer({
    super.key,
    required this.position,
    required this.duration,
    required this.waveList, // Pass waveList here
  });

  static const int numberOfBars = 80;

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

    // Reduce the waveList to 70 values
    final reducedWaveList = _reduceWaveList(waveList);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: CustomPaint(
          painter: _WaveBarsPainter(
            reducedWaveList, // Use the reduced wave list here
            progress: sliderValue,
            activeColor: Colors.white,
            inactiveColor: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  // Function to reduce the waveList to match the required number of bars
  List<int> _reduceWaveList(List<int> waveList) {
    int step = waveList.length ~/ numberOfBars;
    List<int> reducedList = [];

    for (int i = 0; i < numberOfBars; i++) {
      int startIndex = i * step;
      int endIndex = (i + 1) * step;
      // If the range exceeds the waveList, set the last value to the last index
      if (endIndex > waveList.length) {
        endIndex = waveList.length;
      }

      // Take the average of the values within the range
      int sum = 0;
      for (int j = startIndex; j < endIndex; j++) {
        sum += waveList[j];
      }
      int avg = (sum / (endIndex - startIndex)).toInt();
      reducedList.add(avg);
    }

    return reducedList;
  }
}

class _WaveBarsPainter extends CustomPainter {
  final List<int> waveList;  // List containing wave data
  final double progress;
  final Color activeColor;
  final Color inactiveColor;

  _WaveBarsPainter(
    this.waveList, {
    required this.progress,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double barWidth = size.width / waveList.length;
    double centerY = size.height / 2;
    double borderRadius = 30;

    // Loop through the waveList and draw bars
    for (int i = 0; i < waveList.length; i++) {
      double waveValue = waveList[i] / 100.0; // Normalize the wave value
      double barHeight = size.height * 0.5 * waveValue; // Calculate the height
      double x = i * barWidth;

      // Paint bars based on the progress
      final barPaint = Paint()
        ..color = (i / waveList.length) <= progress ? activeColor : inactiveColor;

      final RRect rRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, centerY - barHeight, barWidth * 0.8, barHeight * 2),
        Radius.circular(borderRadius),
      );

      canvas.drawRRect(rRect, barPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _WaveBarsPainter oldDelegate) {
    return oldDelegate.waveList != waveList || oldDelegate.progress != progress;
  }
}
*/
/*
class WaveformVisualizer extends StatelessWidget {
  final List<int> waveformOnlyint; // List of waveform data
  final double barWidth;           // Width of each bar

  const WaveformVisualizer({
    Key? key,
    required this.waveformOnlyint,
    this.barWidth = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Total height for top + bottom
      child: CustomPaint(
        painter: WaveformPainter(waveformOnlyint, barWidth),
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  final List<int> waveformOnlyint;
  final double barWidth;

  WaveformPainter(this.waveformOnlyint, this.barWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    // Space between bars
    const double spaceBetweenBars = 1.0;

    // Calculate the maximum number of bars that can fit in the width of the screen
    final int maxBars = (size.width / (barWidth + spaceBetweenBars)).floor();

    // Scale the waveform data to fit within the available bar count
    final int stepSize = (waveformOnlyint.length / maxBars).floor();
    final List<int> scaledWaveformData = List.generate(
      maxBars,
      (index) => waveformOnlyint[index * stepSize], // Sample the waveform data
    );

    // Center Y position for the bars
    final double centerY = size.height / 2;

    // Calculate the maximum value in the waveform data to scale it
    final int maxWaveformValue = waveformOnlyint.reduce((a, b) => a > b ? a : b);

    // Starting X position for drawing bars
    double xPos = 0.0;

    // Maximum bar height set to 50
    const double maxBarHeight = 30.0;

    for (var value in scaledWaveformData) {
      // Scale the waveform value to fit within the maxBarHeight
      final double barHeight = (value.toDouble() / maxWaveformValue) * maxBarHeight;

      // Top part (bars above the center)
      double topBarHeight = barHeight;
      double topYPosition = centerY - topBarHeight;

      // Bottom part (bars below the center)
      double bottomBarHeight = barHeight;
      double bottomYPosition = centerY;

      // Draw the top bar
      canvas.drawRect(
        Rect.fromLTWH(xPos, topYPosition, barWidth, topBarHeight),
        paint,
      );

      // Draw the bottom bar
      canvas.drawRect(
        Rect.fromLTWH(xPos, bottomYPosition, barWidth, bottomBarHeight),
        paint,
      );

      // Move x-position for the next bar
      xPos += barWidth + spaceBetweenBars;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} */

