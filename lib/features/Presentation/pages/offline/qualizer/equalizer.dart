import 'dart:async';
import 'dart:developer';
import 'package:equalizer/equalizer.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:norse/configs/constants/Spaces.dart';

MainAxisAlignment crossAxisAlignment = MainAxisAlignment.start;
final List<int> _levels = [0, 0, 0, 0, 0]; // Default EQ levels
final int _minLevel = -1500; // -15 dB
final int _maxLevel = 1500; // +15 dB
int _bassStrength = 0; // 0 to 1000
// ignore: unused_element
int _selectedPresetIndex = 0;
int oldsessionid = 0;

final List<Map<String, dynamic>> equalizerPresets = [
  {
    "preset": "Normal",
    "bandLevels": [0, 0, 0, 0, 0],
    "bassBoost": 0,
    "img": "assets/normal.jpg",
  },
  {
    "preset": "Pop",
    "bandLevels": [3, 6, 6, 3, 2],
    "bassBoost": 200,
    "img": "assets/popular.jpg",
  },
  {
    "preset": "Rock",
    "bandLevels": [7, 5, 0, 5, 6],
    "bassBoost": 600,
    "img": "assets/rock.jpg",
  },
  {
    "preset": "Jazz",
    "bandLevels": [4, 2, 0, 5, 5],
    "bassBoost": 400,
    "img": "assets/jazz.jpg",
  },
  {
    "preset": "Classical",
    "bandLevels": [5, 3, 0, 4, 6],
    "bassBoost": 200,
    "img": "assets/classical.jpg",
  },
  {
    "preset": "Dance",
    "bandLevels": [6, 5, 2, 1, 3],
    "bassBoost": 800,
    "img": "assets/dance.png",
  },
  {
    "preset": "Metal",
    "bandLevels": [8, 7, 2, 7, 8],
    "bassBoost": 1000,
    "img": "assets/metal.jpg",
  },
  {
    "preset": "Hip Hop",
    "bandLevels": [10, 7, 2, 4, 3],
    "bassBoost": 1000,
    "img": "assets/hiphop.png",
  },
  {
    "preset": "Electronic",
    "bandLevels": [9, 7, 3, 5, 4],
    "bassBoost": 900,
    "img": "assets/electronic.png",
  },
];

class EqualizerPage extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const EqualizerPage({super.key, required this.audioPlayer});

  @override
  _EqualizerPageState createState() => _EqualizerPageState();
}

class _EqualizerPageState extends State<EqualizerPage> {
  late StreamSubscription streamSubscription;

  Future<void> _initializeEqualizer() async {
    streamSubscription = widget.audioPlayer.androidAudioSessionIdStream.listen(
      null,
    );

    streamSubscription.onData((incoming) async {
      if (incoming != oldsessionid) {
        try {
          final result = await FlutterEqualizerPlugin.init(incoming);
          oldsessionid = incoming;
          log(result ?? "unkown");
          setState(() {});
        } catch (e) {
          throw Exception(e);
        }
      }
    });
  }

  Future<void> _setBandLevel(int bandIndex, int level) async {
    try {
      final result = await FlutterEqualizerPlugin.setBandLevel(
        bandIndex,
        level,
      );
      print("Band $bandIndex set: $result");
    } catch (e) {
      print("Error setting band level: $e");
    }
  }

  Future<void> _setBassBoost(int strength) async {
    try {
      final result = await FlutterEqualizerPlugin.setBassBoostStrength(
        strength,
      );
      print("Bass boost set: $result");
    } catch (e) {
      print("Error setting bass boost: $e");
    }
  }

  Widget _buildSlider(int bandIndex) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: RotatedBox(
            quarterTurns: -1,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 10,
                thumbColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
                trackShape: const Custom3DSliderTrackShape(),
                showValueIndicator: ShowValueIndicator.never,
              ),
              child: Slider(
                min: _minLevel.toDouble(),
                max: _maxLevel.toDouble(),
                value: _levels[bandIndex].toDouble(),
                onChanged: (value) {
                  setState(() {
                    _levels[bandIndex] = value.toInt();
                  });
                  _setBandLevel(bandIndex, value.toInt());
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${(_levels[bandIndex] / 100).toStringAsFixed(1)} dB',
          style: const TextStyle(
            fontSize: 8,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _release() async {
    await FlutterEqualizerPlugin.stop();
    await streamSubscription.cancel();
    oldsessionid = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Spaces.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Ionicons.arrow_back, color: Colors.white),
        ),
        title: Textutil(
          text: 'Equalizer',
          fontsize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Spaces.backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () async {
                if (crossAxisAlignment == MainAxisAlignment.start) {
                  crossAxisAlignment = MainAxisAlignment.end;
                  setState(() {});
                  await _initializeEqualizer();
                } else {
                  crossAxisAlignment = MainAxisAlignment.start;
                  setState(() {});
                  await _release();
                }
              },
              child: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    colors: [Colors.cyanAccent, Colors.white],
                  ),
                  color:
                      crossAxisAlignment == MainAxisAlignment.end
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.5),
                ),
                child: Row(
                  mainAxisAlignment: crossAxisAlignment,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color:
                              crossAxisAlignment == MainAxisAlignment.end
                                  ? Colors.black
                                  : Colors.white.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height / 3,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2,
                  ),
                  itemCount: equalizerPresets.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        setState(() {
                          _selectedPresetIndex = index;
                          final preset = equalizerPresets[index];
                          _bassStrength = preset["bassBoost"];
                          for (int i = 0; i < 5; i++) {
                            _levels[i] =
                                preset["bandLevels"][i] *
                                100; // convert dB to plugin scale
                          }
                        });

                        // Apply to plugin
                        for (int i = 0; i < 5; i++) {
                          await _setBandLevel(i, _levels[i]);
                        }
                        await _setBassBoost(_bassStrength);
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            child: Image.asset(
                              equalizerPresets[index]['img'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(color: Colors.black.withValues(alpha: 0.6)),
                          Center(
                            child: Textutil(
                              text: equalizerPresets[index]['preset'],
                              fontsize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            Expanded(
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, _buildSlider),
                ),
              ),
            ),

            Spaces.kheight10,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Textutil(
                      text: "Bass Booster",
                      fontsize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      padding: EdgeInsets.zero,
                      trackHeight: 10,
                      thumbColor: Colors.white,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 6,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 12,
                      ),
                      trackShape: const Custom3DSliderTrackShape(),
                      showValueIndicator: ShowValueIndicator.always,
                      valueIndicatorColor: Colors.white,
                      valueIndicatorTextStyle: Spaces.Getstyle(
                        10,
                        Colors.black,
                        FontWeight.bold,
                      ),
                    ),
                    child: Slider(
                      padding: EdgeInsets.zero,
                      min: 0,
                      max: 1000,

                      divisions: 20,
                      value: _bassStrength.toDouble(),
                      label: "${(_bassStrength / 10).round()}%",
                      onChanged: (value) {
                        setState(() {
                          _bassStrength = value.toInt();
                        });
                        _setBassBoost(_bassStrength);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 120),

            /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Preset: ", style: TextStyle(fontSize: 16)),
                  DropdownButton<int>(
                    value: _selectedPresetIndex,
                    items: List.generate(equalizerPresets.length, (index) {
                      return DropdownMenuItem<int>(
                        value: index,
                        child: Text(equalizerPresets[index]["preset"]),
                      );
                    }),
                    onChanged: (int? index) async {
                      if (index != null) {
                        setState(() {
                          _selectedPresetIndex = index;
                          final preset = equalizerPresets[index];
                          _bassStrength = preset["bassBoost"];
                          for (int i = 0; i < 5; i++) {
                            _levels[i] =
                                preset["bandLevels"][i] *
                                100; // convert dB to plugin scale
                          }
                        });
        
                        // Apply to plugin
                        for (int i = 0; i < 5; i++) {
                          await _setBandLevel(i, _levels[i]);
                        }
                        await _setBassBoost(_bassStrength);
                      }
                    },
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class Custom3DSliderTrackShape extends SliderTrackShape {
  const Custom3DSliderTrackShape();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = true,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight ?? 4;
    final trackLeft = offset.dx + 8;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width - 16;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    required RenderBox parentBox,
    Offset? secondaryOffset, // <== New param added
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required Offset thumbCenter,
  }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
    );

    final Paint inactivePaint =
        Paint()
          ..shader = LinearGradient(
            colors: [Colors.grey.shade900, Colors.grey.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(trackRect);

    final Paint activePaint =
        Paint()
          ..shader = LinearGradient(
            colors: [Colors.cyanAccent, Colors.white],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(
            Rect.fromLTRB(
              trackRect.left,
              trackRect.top,
              thumbCenter.dx,
              trackRect.bottom,
            ),
          );

    // Draw inactive track (right of thumb)
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          thumbCenter.dx,
          trackRect.top,
          trackRect.right,
          trackRect.bottom,
        ),
        Radius.circular(6),
      ),
      inactivePaint,
    );

    // Draw active track (left of thumb)
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          trackRect.left,
          trackRect.top,
          thumbCenter.dx,
          trackRect.bottom,
        ),
        Radius.circular(6),
      ),
      activePaint,
    );
  }
}

class CustomSliderTrackShape extends SliderTrackShape {
  const CustomSliderTrackShape();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = true,
    bool isDiscrete = false,
  }) {
    final trackHeight =
        sliderTheme.trackHeight ?? 8; // Adjust track height for better visuals
    final trackLeft = offset.dx + 10; // Add padding to the left
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth =
        parentBox.size.width - 20; // Adjust track width for better visuals
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    required RenderBox parentBox,
    Offset? secondaryOffset,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required Offset thumbCenter,
  }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
    );

    final Paint inactivePaint =
        Paint()
          ..shader = LinearGradient(
            colors: [Colors.grey.shade600, Colors.grey.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(trackRect);

    final Paint activePaint =
        Paint()
          ..shader = LinearGradient(
            colors: [Colors.cyanAccent, Colors.blueAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(
            Rect.fromLTRB(
              trackRect.left,
              trackRect.top,
              thumbCenter.dx,
              trackRect.bottom,
            ),
          );

    // Draw inactive track (right of thumb)
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          thumbCenter.dx,
          trackRect.top,
          trackRect.right,
          trackRect.bottom,
        ),
        Radius.circular(10), // Rounded corners
      ),
      inactivePaint,
    );

    // Draw active track (left of thumb)
    context.canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          trackRect.left,
          trackRect.top,
          thumbCenter.dx,
          trackRect.bottom,
        ),
        Radius.circular(10), // Rounded corners
      ),
      activePaint,
    );
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  const CustomSliderThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    // Return the size for the thumb, e.g., 20x20
    return const Size(20, 20); // Custom thumb size
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required Animation<double> enableAnimation,
    required Animation<double> activationAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required Size sizeWithOverflow,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double textScaleFactor,
    required double value,
  }) {
    final Paint thumbPaint =
        Paint()
          ..color =
              Colors
                  .white // White thumb color
          ..style = PaintingStyle.fill;

    final Offset thumbCenter = offset + Offset(10, 10); // Adjust thumb position
    context.canvas.drawCircle(
      thumbCenter,
      10,
      thumbPaint,
    ); // Draw thumb with circle shape
  }
}
