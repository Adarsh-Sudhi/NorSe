// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:norse/configs/constants/Spaces.dart';

class Loadingbottombar extends StatefulWidget {
  const Loadingbottombar({
    super.key,
    required this.title,
    required this.imag,
    required this.subtitle,
  });
  final String title;
  final String imag;
  final String subtitle;

  @override
  State<Loadingbottombar> createState() => _LoadingbottombarState();
}

class _LoadingbottombarState extends State<Loadingbottombar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,

      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Image.network(
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/musical-note.png',
                      color: Colors.black.withValues(alpha: 0.6),
                    );
                  },
                  widget.imag,
                  fit: BoxFit.fitWidth,
                ),
                Container(color: Colors.black.withValues(alpha: 0.7)),
                SizedBox(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Image.network(
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/musical-note.png',
                              color: Colors.black.withValues(alpha: 0.6),
                            );
                          },
                          widget.imag,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 16,
                            width: 150,
                            child: Textutil(
                              text: widget.title,
                              fontsize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                            width: 100,
                            child: Textutil(
                              text: widget.subtitle,
                              fontsize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Ionicons.play_back,
                                color: Colors.grey,
                                size: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: 35,
                                width: 35,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Ionicons.play_forward,
                                color: Colors.grey,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
