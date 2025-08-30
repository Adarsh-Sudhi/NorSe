import 'package:flutter/material.dart';

class Notifiers {
  static ValueNotifier<bool> isloopednotifer = ValueNotifier(false);
  static ValueNotifier<bool> isshufflednotifier = ValueNotifier(false);

  static ValueNotifier<bool> isLoloopednotifier = ValueNotifier(false);
  static ValueNotifier<bool> isLoshufflednotifier = ValueNotifier(false);

  static ValueNotifier<bool> isSongSearchonVisible = ValueNotifier(false);

  static ValueNotifier<String> qualityNotifier = ValueNotifier('360kbps');

  static ValueNotifier<int> tabindexNotifer = ValueNotifier(0);
  static ValueNotifier<int> onlinetabarNotifier = ValueNotifier(0);

  static ValueNotifier<double> ytexpandnotifer = ValueNotifier(60.0);

  static ValueNotifier<bool> showplayer = ValueNotifier(false);

  static ValueNotifier<bool> isytvisible = ValueNotifier(false);

  static ValueNotifier<int> pagenotifer = ValueNotifier(0);

  static ValueNotifier<bool> showMenu = ValueNotifier(false);

  static ValueNotifier<bool> isfullscreen = ValueNotifier(false);

  static ValueNotifier<bool> loadingnotifer = ValueNotifier(false);

  static ValueNotifier<bool> viewtype = ValueNotifier(false);
  static ValueNotifier<String> videoQualityNotifier = ValueNotifier("medium 1080p");
  static ValueNotifier<int> launchdataprovidernotifiers = ValueNotifier(0);
}
