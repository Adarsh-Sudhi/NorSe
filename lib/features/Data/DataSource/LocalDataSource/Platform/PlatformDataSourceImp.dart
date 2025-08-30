import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:norse/injection_container.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:norse/features/Data/DataSource/LocalDataSource/Platform/PlatFormDatasource.dart';
import '../../../../../configs/Error/Errors.dart';

class PlatformDataRepositoryimp extends PlatformDataRepository {
  final OnAudioQuery onAudioQuery;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  PlatformDataRepositoryimp({
    required this.onAudioQuery,
    required this.flutterLocalNotificationsPlugin,
  });

  @override
  Future<bool> getpermissions() async {
    if (Platform.isIOS) {
      PermissionStatus permission = await Permission.mediaLibrary.request();
      return permission.isGranted;
    } else {
      AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
      int version = info.version.sdkInt;
      if (version < 30) {
        PermissionStatus storagepermission = await Permission.storage.status;
        if (storagepermission.isDenied) {
          switch (version) {
            case 26 || 27 || 28:
              bool status = await onAudioQuery.permissionsRequest();
              return status ? true : false;

            case 29:
              PermissionStatus status = await Permission.storage.request();
              return status.isGranted ? true : false;

            default:
              return false;
          }
        } else {
          return true;
        }
      } else {
        if (version >= 33) {
          PermissionStatus permisson = await Permission.audio.status;
          PermissionStatus managestoragestatus =
              await Permission.manageExternalStorage.status;
          if (permisson.isDenied && managestoragestatus.isDenied) {
            switch (version) {
              case 33 || 34 || 35 || 36:
                PermissionStatus notificationpermission =
                    await Permission.notification.request();
                PermissionStatus audiopermission =
                    await Permission.audio.request();
                PermissionStatus managestorage =
                    await Permission.manageExternalStorage.request();
                return audiopermission.isGranted &&
                        managestorage.isGranted &&
                        notificationpermission.isGranted
                    ? true
                    : false;

              default:
                return false;
            }
          } else {
            return true;
          }
        } else {
          PermissionStatus audiopermissionstatus =
              await Permission.storage.status;
          PermissionStatus managestoragestatus =
              await Permission.manageExternalStorage.status;
          if (audiopermissionstatus.isDenied && managestoragestatus.isDenied) {
            switch (version) {
              case 30 || 31 || 32:
                PermissionStatus audiopermission =
                    await Permission.storage.request();
                PermissionStatus managestorage =
                    await Permission.manageExternalStorage.request();
                return audiopermission.isGranted && managestorage.isGranted
                    ? true
                    : false;

              default:
                return false;
            }
          } else {
            return true;
          }
        }
      }
    }
  }

  @override
  Future<Either<Failures, List<SongModel>>> getallsongs() async {
    try {
      final dir = await getApplicationDocumentsDirectory();

      String path =
          Platform.isAndroid
              ? "/storage/emulated/0/Download/norse"
              : "${dir.path}/norse";
      Platform.isAndroid ? await onAudioQuery.scanMedia(path) : null;

      List<SongModel> songs =
          Platform.isAndroid
              ? await onAudioQuery.querySongs(path: path)
              : await onAudioQuery.querySongs();

      log(songs.length.toString());

      log(path);

      if (songs.isNotEmpty) {
        return right(songs);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<AlbumModel>>> getalbums() async {
    try {
      final songs = await onAudioQuery.queryAlbums();
      if (songs.isNotEmpty) {
        return right(songs);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<SongModel>>> getalbumsongs(int id) async {
    try {
      List<SongModel> songs = await onAudioQuery.queryAudiosFrom(
        AudiosFromType.ALBUM_ID,
        id,
      );
      if (songs.isNotEmpty) {
        return right(songs);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> backupdata() async {
    try {
      String documentsDirectory = await getDatabasesPath();
      Database database = await openDatabase(
        p.join(documentsDirectory, 'nebula.db'),
      );
      String dbpath = database.path;
      if (await databaseExists(dbpath)) {
        String backupPath = p.join(
          '/storage/emulated/0/Documents',
          'backup.db',
        );
        File file = await File(dbpath).copy(backupPath);
        if (await file.exists()) {
          return right(true);
        }
        return left(const Failures.clientfailure());
      }
      return right(true);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> restoredata() async {
    try {
      String documentsDirectory = await getDatabasesPath();
      Database database = await openDatabase(
        p.join(documentsDirectory, 'nebula.db'),
      );
      String dbpath = database.path;
      if (await databaseExists(dbpath)) {
        await File(dbpath).delete();
        String backupPath = p.join(
          '/storage/emulated/0/Documents',
          'backup.db',
        );
        File file = await File(backupPath).copy(dbpath);
        if (await file.exists()) {
          return right(true);
        }
        return left(const Failures.clientfailure());
      }
      return right(true);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> initnotification() async {
    try {
      AndroidInitializationSettings androidInitializationSettings =
          const AndroidInitializationSettings('mipmap/ic_launcher');

      InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
      );

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void showprogress(
    double progress,
    int id,
    String title,
    String auther,
  ) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
          'progress channel',
          'progress channel',
          importance: Importance.max,
          priority: Priority.max,
          showProgress: false,
          playSound: false,
          enableVibration: false,
          onlyAlertOnce: true,
        );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      "Download Completed",
      notificationDetails,
    );
  }

  @override
  Future<bool> deletesongfromdevice(String path) async {
    try {
      File file = File(path);

      if (await file.exists()) {
        await file.delete();
        await onAudioQuery.scanMedia(path);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> getFolders() async {
    List<SongModel> Downloads = await onAudioQuery.querySongs(
      sortType: SongSortType.DATE_ADDED,
      orderType: OrderType.DESC_OR_GREATER,
      uriType: UriType.EXTERNAL,
      path: '/storage/emulated/0/Download',
    );

    List<SongModel> Music = await onAudioQuery.querySongs(
      sortType: SongSortType.DATE_ADDED,
      orderType: OrderType.DESC_OR_GREATER,
      uriType: UriType.EXTERNAL,
      path: '/storage/emulated/0/Music',
    );

    List<SongModel> Recordings = await onAudioQuery.querySongs(
      sortType: SongSortType.DATE_ADDED,
      orderType: OrderType.DESC_OR_GREATER,
      uriType: UriType.EXTERNAL,
      path: '/storage/emulated/0/Recordings',
    );

    List<SongModel> Ringtones = await onAudioQuery.querySongs(
      sortType: SongSortType.DATE_ADDED,
      orderType: OrderType.DESC_OR_GREATER,
      uriType: UriType.EXTERNAL,
      path: '/storage/emulated/0/Ringtones',
    );

    Map<String, dynamic> Foldersongs = {
      'Download': Downloads,
      'Music': Music,
      'RingTones': Ringtones,
      'Recordings': Recordings,
    };

    return right(Foldersongs);

    // Request permission
  }

  @override
  Future<Either<Failures, List<SongModel>>> getSongsFromArtist(int id) async {
    try {
      List<SongModel> artistsong = await onAudioQuery.queryAudiosFrom(
        AudiosFromType.ARTIST_ID,
        id,
      );

      if (artistsong.isNotEmpty) {
        return right(artistsong);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> updateaudiotag(
    Map<String, dynamic> audiotags,
  ) async {
    String title = audiotags['title'];
    String artist = audiotags['artist'];
    String album = audiotags['album'];
    String ganre = audiotags['ganre'];
    String path = audiotags['path'];

    throw Exception("unimpli,menmte");
  }

  @override
  Future<Either<Failures, List<GenreModel>>> getGenre() async {
    try {
      List<GenreModel> genres = await onAudioQuery.queryGenres(
        sortType: GenreSortType.GENRE,
      );

      if (genres.isNotEmpty) {
        return right(genres);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<SongModel>>> getSongsFromGenre(int id) async {
    try {
      List<SongModel> genresongs = await onAudioQuery.queryAudiosFrom(
        AudiosFromType.GENRE_ID,
        id,
      );
      if (genresongs.isNotEmpty) {
        return right(genresongs);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
