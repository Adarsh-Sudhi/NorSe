import 'package:flutter/material.dart';
import 'package:norse/features/Presentation/pages/Youtube/youtubeplayer/testytplayerscreen.dart';
import 'package:norse/features/Presentation/pages/Youtube/youtubescreen/ytpage.dart';
import '../../features/Presentation/pages/MainHomePage/MainHomePage.dart';
import '../../features/Presentation/pages/Youtube/youtube_playlistpage.dart';
import '../../features/Presentation/pages/Youtube/ytsearchpage/ytsearchpage.dart';
import '../../features/Presentation/pages/saavn/queue/onlinequeue.dart';
import '../../features/Presentation/pages/saavn/Aboutpage/aboutpage.dart';
import '../../features/Presentation/pages/saavn/DownloadPages/Downloadpages.dart';
import '../../features/Presentation/pages/saavn/Settings/settingspage.dart';
import '../../features/Presentation/pages/Youtube/onlinefavepage.dart';
import '../../features/Presentation/pages/saavn/subscreens/SearchResultPage/SearchResultPage.dart';
import '../../features/Presentation/pages/saavn/subscreens/SongDetailsPage/SongDetailsPage.dart';
import '../../features/Presentation/pages/saavn/subscreens/backupandrestore/backupandrestore.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case MainHomePage.mainHomePAge:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const MainHomePage());

    case SongDetailsPage.SongDetials:
      final para = settings.arguments as SongDetailsPage;
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => SongDetailsPage(
                imageurl: para.imageurl,
                albumurl: para.albumurl,
                name: para.name,
                id: para.id,
                type: para.type,
              ));

    case SearchResultscreen.searchscreen:
      final args = settings.arguments as String;
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => SearchResultscreen(querydata: args));

    case Downloadpage.downloadscreen:
      return MaterialPageRoute(builder: (_) => const Downloadpage());

    case Onlinefavscreen.onlinefavscreen:
      return MaterialPageRoute(builder: (_) => const Onlinefavscreen());



    case Aboutpage.aboutpage:
      return MaterialPageRoute(builder: (_) => const Aboutpage());



    case Onlinequeue.onlinequeuescreen:
      final args = settings.arguments as Onlinequeue;
      return MaterialPageRoute(
          builder: (_) => Onlinequeue(
                audios: args.audios,
                audioPlayer: args.audioPlayer,
              ));

    case Settingpage.settingpage:
      return MaterialPageRoute(builder: (_) => const Settingpage());

    case Backupandrestore.backupandrestore:
      return MaterialPageRoute(builder: (_) => const Backupandrestore());

    case Testytplayer.testytplayer:
      final args = settings.arguments as Testytplayer;
      return MaterialPageRoute(
          builder: (_) => Testytplayer(
                persentage: args.persentage,
                height: args.height,
                context: args.context,
                video: args.video,
                index: args.index,
              ));

    case Youtubeplaylistpage.youtubeplaylistpage:
      final args = settings.arguments as Youtubeplaylistpage;
      return MaterialPageRoute(
          builder: (_) => Youtubeplaylistpage(
                songs: args.songs,
                title: args.title,
              ));

    case Ytsearchpage.ytsearchpage:
      return MaterialPageRoute(builder: (_) => Ytsearchpage());



    case Youtubepage.ytHome:
      return MaterialPageRoute(builder: (_) => const Youtubepage());

    default:
  }
  return null;
}
