import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Spaces {
  List<Widget> getList(int length, Widget Function(int) generator) {
    return List.generate(length, generator);
  }

  //static const iplink = "192.168.18.253";

  static const String version = 'v5.3.1';

  static const kheigth5 = SizedBox(height: 5);
  static const kheight10 = SizedBox(height: 10);
  static const kheight20 = SizedBox(height: 20);
  static const kheight50 = SizedBox(height: 50);
  static const kheight40 = SizedBox(height: 40);
  static const kheight30 = SizedBox(height: 30);

  static const baseColor = Color.fromARGB(255, 133, 133, 133);
  static Color highlightColor = Colors.grey;
  static const textColor = Color.fromARGB(255, 221, 221, 221);
  static const backgroundColor = Colors.black;
  static const iconColor = Color.fromARGB(255, 58, 58, 58);

  static showtoast(String content) {
    return Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static LinearGradient musicgradient() {
    return const LinearGradient(
      colors: [Color.fromARGB(255, 27, 27, 27), Color.fromARGB(255, 0, 0, 0)],
    );
  }

  static TextStyle Getstyle(
    double fontSize,
    Color color,
    FontWeight fontWeight,
  ) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
  }

  Future<String> Gethumbnail(ThumbnailSet thumbnailSet) async {
    Response response = await http.get(Uri.parse(thumbnailSet.maxResUrl));
    if (response.statusCode == 200) {
      return thumbnailSet.maxResUrl;
    } else {
      Response response = await http.get(Uri.parse(thumbnailSet.highResUrl));
      if (response.statusCode == 200) {
        return thumbnailSet.highResUrl;
      } else {
        return 'https://cdn.pixabay.com/photo/2016/11/19/03/08/youtube-1837872_1280.png';
      }
    }
  }
}

class Textutil extends StatelessWidget {
  const Textutil({
    super.key,
    required this.text,
    required this.fontsize,
    required this.color,
    required this.fontWeight,
  });
  final String text;
  final double fontsize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Spaces.Getstyle(fontsize, color, fontWeight),
      overflow: TextOverflow.ellipsis,
    );
  }
}
