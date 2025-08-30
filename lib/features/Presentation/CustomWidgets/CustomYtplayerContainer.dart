import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:norse/features/Presentation/pages/Youtube/youtubeplayer/testytplayerscreen.dart';

class CustomYtPlayerContainer extends StatefulWidget {
  const CustomYtPlayerContainer({super.key, required this.controller});

  final Widget controller;

  @override
  State<CustomYtPlayerContainer> createState() =>
      _CustomYtPlayerContainerState();
}

class _CustomYtPlayerContainerState extends State<CustomYtPlayerContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return PiPSwitcher(
        childWhenEnabled: widget.controller,
        childWhenDisabled: Material(
          color: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            width: size.width,
            child: Stack(
              fit: StackFit.expand,
              children: [
                SizedBox(key: const Key('01'), child: widget.controller),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() => isfloating = false);
                          // PictureInPicture.stopPiP();
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                          size: 25,
                          weight: 20,
                        )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
