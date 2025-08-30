// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/main.dart';

class Userinfoyt extends StatelessWidget {
  final Map userinfo;
  const Userinfoyt({super.key, required this.userinfo});

  @override
  Widget build(BuildContext context) {
    log(userinfo.toString());
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                userinfo['accountPhotoUrl'],
              ),
              backgroundColor: Colors.black,
              radius: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textutil(
                  text: "MUSIC THAT'S HOT AND HAPPENING!",
                  fontsize: 16,
                  color: const Color.fromARGB(255, 123, 123, 123),
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  children: [
                    Textutil(
                      text: "${userinfo['accountName']} • ",
                      fontsize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    Textutil(
                      text: userinfo['channelHandle'],
                      fontsize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
