import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlaybackSpeedDropdownSlider extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const PlaybackSpeedDropdownSlider({super.key, required this.audioPlayer});

  @override
  State<PlaybackSpeedDropdownSlider> createState() =>
      _PlaybackSpeedDropdownSliderState();
}

class _PlaybackSpeedDropdownSliderState
    extends State<PlaybackSpeedDropdownSlider> {
  double _currentSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _currentSpeed = widget.audioPlayer.speed;
  }

  void _showSpeedSlider(BuildContext context) {
    double localSpeed = _currentSpeed;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Playback Speed",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "${localSpeed.toStringAsFixed(2)}x",
                    style: TextStyle(
                      color: Colors.blueAccent.shade200,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.blueAccent,
                      inactiveTrackColor: Colors.blueAccent.withValues(
                        alpha: 0.3,
                      ),
                      trackHeight: 6,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 14,
                        elevation: 4,
                        pressedElevation: 8,
                      ),
                      thumbColor: Colors.blueAccent,
                      overlayColor: Colors.blueAccent.withValues(alpha: 0.2),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.blueAccent,
                      inactiveTickMarkColor: Colors.blueAccent.withValues(
                        alpha: 0.3,
                      ),
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.blueAccent,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Slider(
                      value: localSpeed,
                      min: 0.0,
                      max: 2.0,
                      label: "${localSpeed.toStringAsFixed(2)}x",
                      onChanged: (value) {
                        setModalState(() {
                          localSpeed = value;
                        });
                        widget.audioPlayer.setSpeed(value);
                        setState(() {
                          _currentSpeed = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 32,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.speed, color: Colors.white, size: 29),
      tooltip: "Adjust playback speed",
      onPressed: () => _showSpeedSlider(context),
    );
  }
}
