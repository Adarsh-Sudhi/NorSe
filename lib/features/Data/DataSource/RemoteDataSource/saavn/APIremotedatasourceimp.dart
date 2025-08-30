// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:dart_des/dart_des.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jiosaavn/jiosaavn.dart';
import 'package:norse/features/Data/Models/MusicModels/LauchDataModel/LaunchDataModel.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../../configs/APIEndpoints/API.dart';
import '../../../../../configs/Error/Errors.dart';
import '../../../../../configs/notifier/notifiers.dart';
import '../../../../Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import '../../../../Domain/Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';
import '../../../../Domain/Entity/MusicEntity/PlaylistEntity/PlaylistEntity.dart';
import '../../../../Domain/Entity/MusicEntity/SearchSongEntity/SearchEntity.dart';
import '../../../../Domain/Entity/MusicEntity/TopChartsEntity/topchartentity.dart';
import '../../../Models/MusicModels/AlbumsModel/AlbumModel.dart';
import '../../../Models/MusicModels/SearchModel/SearchModel.dart';
import '../../../Models/MusicModels/topchartsmodels/topchartsmodel.dart';
import '../../LocalDataSource/SqlQuerys/Sqllocaldatasource.dart';
import 'APIremotedatasource.dart';

class APIremotedatasourceimp implements APIremoteDatasource {
  final Sqldatasourcerepository sqldatasourcerepository;
  final YoutubeExplode yt;
  final JioSaavnClient jioSaavnClient;
  const APIremotedatasourceimp({
    required this.sqldatasourcerepository,
    required this.yt,
    required this.jioSaavnClient,
  });

  @override
  Future<List<AlbumSongEntity>> getAlbumSongs(String albumurl) async {
    try {
      List<AlbumSongEntity> albumsongslist = [];
      Uri url = Uri.parse("${ApiEndpoints.GetAlbumSongs}$albumurl");

      http.Response response = await http.get(url);
      final res = response.body
          .replaceAll('&quot;', '')
          .replaceAll('&#039;', '')
          .replaceAll('&amp;', '');
      if (response.statusCode == 200) {
        final res1 = jsonDecode(res);
        for (Map<String, dynamic> element in res1['data']['songs']) {
          AlbumSongEntity albumSongEntity = AlbumSongModels.fromMap(
            element,
            element['downloadUrl'][Notifiers.qualityNotifier.value == '96kbps'
                ? 2
                : Notifiers.qualityNotifier.value == '160kbps'
                ? 3
                : 4]['link'],
          );
          albumsongslist.add(albumSongEntity);
        }
      }
      return albumsongslist;
    } catch (e) {
      throw Exception('Album Songs Failed');
    }
  }

  @override
  Future<List<SearchEntity>> SearchSong(String Querydata) async {
    List<SearchEntity> results = [];
    final String encoded = jsonEncode(ApiEndpoints().url);
    final uurl = encoded
        .replaceAll('Querydata', Querydata)
        .replaceAll('6', '30');
    final decoded = jsonDecode(uurl);
    Uri uri = Uri.https(ApiEndpoints.jiosaavnSearchBase, '/api.php', decoded);
    log(uri.toString());
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      for (var items in res['results']) {
        if (items['type'] == 'song') {
          List<Map<String, dynamic>> links = await decrypt(
            items['more_info']['encrypted_media_url'],
          );
          SearchEntity searchEntity = SearchEntity(
            moreinfo: items['more_info'],
            id: items['id'],
            name: items['title']
                .toString()
                .replaceAll('&quot;', '')
                .replaceAll('&amp;', ''),
            year: items['id'],
            image: items['image'].toString().replaceAll('150x150', '500x500'),
            primaryArtists:
                (items['more_info']['artistMap']['primary_artists'] as List)
                        .isEmpty
                    ? items['more_info']['music']
                    : items['more_info']['artistMap']['primary_artists'][0]['name'],
            downloadUrl:
                links[Notifiers.qualityNotifier.value == '96kbps'
                        ? 2
                        : Notifiers.qualityNotifier.value == '160kbps'
                        ? 3
                        : 4]['link']
                    .toString(),
          );
          results.add(searchEntity);
        }
      }
      return results;
    }
    throw Exception("Fetch error");
  }

  @override
  Future<SearchEntity> GetSong(String Songurl) async {
    Uri url = Uri.parse("${ApiEndpoints.GetSong}$Songurl");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      if (res['data'] != null && res['data'].isNotEmpty) {
        Map<String, dynamic> data = res['data'][0];
        SearchEntity searchEntity = SearchModel.fromJson(data);
        return searchEntity;
      } else {
        throw Exception('Data is empty');
      }
    } else {
      throw Exception('Failure');
    }
  }

  @override
  Future<List<AlbumSongEntity>> GetSearchedAlbums(String Query) async {
    List<AlbumSongEntity> list = [];
    try {
      final String encoded = jsonEncode(ApiEndpoints().url);
      final uurl = encoded.replaceAll('Querydata', Query);
      final finalporc = uurl.replaceAll(
        'search.getResults',
        'search.getAlbumResults',
      );
      Map<String, dynamic> decoded = jsonDecode(finalporc);
      Uri uri = Uri.https(ApiEndpoints.jiosaavnSearchBase, '/api.php', decoded);
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (Map<String, dynamic> element in data['results']) {
          AlbumSongEntity entity = AlbumSongModels(
            type: "saavn",
            id: element['id'],
            name: element['title'],
            year: element['year'],
            primaryArtists: element['subtitle'],
            image: element['image'],
            songs: 'null',
            albumurl: element['perma_url'],
          );
          list.add(entity);
        }
        return list;
      }
      throw Exception('Data is empty');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> DownloadSong(
    String DownloadUrl,
    ProgressCallback progressCallback,
    String Songpath,
  ) async {
    try {
      final dio = Dio();
      await dio.download(
        DownloadUrl,
        Songpath,
        onReceiveProgress: progressCallback,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> DownloadArtwork(
    String DownloadUrl,
    ProgressCallback progressCallback,
    String artworkpath,
  ) async {
    try {
      final dio = Dio();
      await dio.download(
        DownloadUrl,
        artworkpath,
        onReceiveProgress: progressCallback,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<launchdataEntity>> trendingnow(String type) async {
    log('Called here');
    List<launchdataEntity> launchdata = [];

    try {
      String encoded = jsonEncode(ApiEndpoints().url);

      String uurl = encoded.replaceAll(
        'search.getResults',
        'webapi.getLaunchData',
      );

      Map<String, dynamic> decoded = jsonDecode(uurl);

      Uri uri = Uri.https(ApiEndpoints.jiosaavnSearchBase, '/api.php', decoded);

      http.Response response = await http.get(
        uri,
        headers: {'cookie': 'L=$type', 'Accept': '*/*'},
      );

      await sqldatasourcerepository.storeresponse(response.body, type);

      if (response.statusCode == 200) {
        final ress = response.body
            .replaceAll('&quot;', '')
            .replaceAll('&#039;', '')
            .replaceAll('&amp;', '');
        Map<String, dynamic> res = jsonDecode(ress);
        for (var items in res['new_trending']) {
          if (items['type'] == 'album' || items['type'] == 'playlist') {
            launchdataEntity entity = launchdataModel.fromJson(items);
            launchdata.add(entity);
          }
        }
        return launchdata;
      } else {
        throw Exception('trending song failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<playlistEntity>>> getplaylistdetails(
    String id,
  ) async {
    log(id);
    List<playlistEntity> playlistsongs = [];
    try {
      Map<String, dynamic> response = await jioSaavnClient.songs.request(
        call: ApiEndpoints.endpoints.playlists.id,
        queryParameters: {'listid': id},
      );

      //   final song = await jioSaavnClient.songs.request(
      //     call: ApiEndpoints.endpoints.songs.id,
      //     queryParameters: {"pids": "QwkYUnDf"},
      //   );

      String cleanres = jsonEncode(response);

      Map<String, dynamic> res = jsonDecode(
        cleanres.replaceAll('&quot;', '').replaceAll('&#039;', ''),
      );

      if (res['artists'].isEmpty) {
        String ids = res['content_list']
            .toString()
            .replaceAll('[', '')
            .replaceAll(']', '')
            .replaceAll(' ', '');

        final songss = await jioSaavnClient.songs.request(
          call: ApiEndpoints.endpoints.songs.id,
          queryParameters: {"pids": ids.trim()},
        );

        for (var songs in songss['songs']) {
          List<Map<String, dynamic>> links = await decrypt(
            songs['encrypted_media_url'],
          );
          Map moreinfo = {
            'more_info': {'music': songs["album"]},
          };
          playlistEntity entity = playlistEntity(
            name: songs['song'],
            id: songs['id'],
            images: songs['image'].toString().replaceAll('150x150', '500x500'),
            downloadUrl:
                links[Notifiers.qualityNotifier.value == '96kbps'
                        ? 2
                        : Notifiers.qualityNotifier.value == '160kbps'
                        ? 3
                        : 4]['link']
                    .toString(),
            primaryArtists: songs["primary_artists"],
            more_info: moreinfo,
          );
          playlistsongs.add(entity);
        }
        return right(playlistsongs);
      }

      if (res.isNotEmpty) {
        for (var songs in res['songs']) {
          List<Map<String, dynamic>> links = await decrypt(
            songs['encrypted_media_url'],
          );
          Map moreinfo = {
            'more_info': {'music': songs["album"]},
          };
          playlistEntity entity = playlistEntity(
            name: songs['song'],
            id: songs['id'],
            images: songs['image'].toString().replaceAll('150x150', '500x500'),
            downloadUrl:
                links[Notifiers.qualityNotifier.value == '96kbps'
                        ? 2
                        : Notifiers.qualityNotifier.value == '160kbps'
                        ? 3
                        : 4]['link']
                    .toString(),
            primaryArtists: songs["primary_artists"],
            more_info: moreinfo,
          );
          playlistsongs.add(entity);
        }
        return right(playlistsongs);
      } else {
        throw Exception('playlist details failed');
      }
    } catch (e) {
      return left(const Failures.serverfailure());
    }
  }

  @override
  Future<List<launchdataEntity>> getsearchPlaylists(String query) async {
    List<launchdataEntity> playlists = [];
    try {
      String encoded = jsonEncode(ApiEndpoints().url);
      String uurl = encoded.replaceAll(
        'search.getResults',
        'search.getPlaylistResults',
      );
      String finalproc = uurl.replaceAll('Querydata', query);
      Map<String, dynamic> decoded = jsonDecode(finalproc);
      Uri uri = Uri.https(ApiEndpoints.jiosaavnSearchBase, '/api.php', decoded);
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (var res in data['results']) {
          launchdataEntity res1 = launchdataModel.fromJson(res);
          playlists.add(res1);
        }
        return playlists;
      } else {
        throw Exception('playlist fetch failed');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Either<Failures, List<launchdataEntity>>> topsearches() async {
    List<launchdataEntity> res = [];
    try {
      String encoded = jsonEncode(ApiEndpoints().url);
      String uurl = encoded.replaceAll(
        'search.getResults',
        'content.getTopSearches',
      );
      String finalproc = uurl.replaceAll('q', '');
      Map<String, dynamic> decoded = jsonDecode(finalproc);
      Uri uri = Uri.https(ApiEndpoints.jiosaavnSearchBase, '/api.php', decoded);
      final http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (var items in data) {
          if (items['type'] == 'album' || items['type'] == 'playlist') {
            launchdataEntity launchdata = launchdataModel.fromJson(items);
            res.add(launchdata);
          }
        }
      }
      if (res.isNotEmpty) {
        return right(res);
      } else {
        return left(const Failures.serverfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<topchartsEntity>>> topcharts() async {
    List<topchartsEntity> res = [];
    try {
      String encoded = jsonEncode(ApiEndpoints().url);
      String uurl = encoded.replaceAll(
        'search.getResults',
        'webapi.getLaunchData',
      );
      String finalproc = uurl.replaceAll('q', '');
      Map<String, dynamic> decoded = jsonDecode(finalproc);
      Uri uri = Uri.https(ApiEndpoints.jiosaavnSearchBase, '/api.php', decoded);
      http.Response response = await http.get(uri);
      await sqldatasourcerepository.storeresponse(response.body, 'topcharts');
      if (response.statusCode == 200) {
        final map = jsonDecode(response.body);
        for (var i in map['charts']) {
          topchartsEntity charts = TopchartsModel.fromJson(i);
          res.add(charts);
        }
        return right(res);
      } else {
        return left(const Failures.serverfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<launchdataEntity>>> newlyreleased() async {
    List<launchdataEntity> list = [];
    try {
      String encoded = jsonEncode(ApiEndpoints().url);
      String uurl = encoded.replaceAll(
        'search.getResults',
        'webapi.getLaunchData',
      );
      String finalproc = uurl.replaceAll('q', '');
      Map<String, dynamic> decoded = jsonDecode(finalproc);
      Uri uri = Uri.https(ApiEndpoints.jiosaavnSearchBase, '/api.php', decoded);
      http.Response response = await http.get(uri);
      await sqldatasourcerepository.storeresponse(
        response.body,
        'newlyreleased',
      );
      if (response.statusCode == 200) {
        final res = response.body
            .replaceAll('&quot;', '')
            .replaceAll('&amp;', '');
        final data = jsonDecode(res);
        for (var items in data['top_playlists']) {
          final songs = launchdataModel.fromJson(items);
          list.add(songs);
        }
        if (list.isNotEmpty) {
          return right(list);
        } else {
          return left(const Failures.serverfailure());
        }
      } else {
        throw Exception('newlydata failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<launchdataEntity>>> gettopalbums() async {
    List<launchdataEntity> list = [];
    try {
      String encoded = jsonEncode(ApiEndpoints().url);
      String uurl = encoded.replaceAll(
        'search.getResults',
        'webapi.getLaunchData',
      );
      String finalproc = uurl.replaceAll('q', '');
      Map<String, dynamic> decoded = jsonDecode(finalproc);
      Uri uri = Uri.https(ApiEndpoints.jiosaavnSearchBase, '/api.php', decoded);
      http.Response response = await http.get(uri);
      await sqldatasourcerepository.storeresponse(response.body, 'topalbums');
      if (response.statusCode == 200) {
        final res = response.body
            .replaceAll('&quot;', '')
            .replaceAll('&#039;', '')
            .replaceAll('&amp;', '');
        final data = jsonDecode(res);
        for (var items in data['promo:vx:data:116']) {
          final songs = launchdataModel.fromJson(items);
          list.add(songs);
        }
        if (list.isNotEmpty) {
          return right(list);
        } else {
          return left(const Failures.serverfailure());
        }
      } else {
        throw Exception('top albumfailed failed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> decrypt(String encriptedmediaurl) async {
    try {
      String data = '38346591';
      Uint8List encryptedBytes = base64.decode(encriptedmediaurl);
      List<int> keyBytes = utf8.encode(data);
      final decripted = DES(
        key: keyBytes,
        mode: DESMode.ECB,
        paddingType: DESPaddingType.PKCS7,
      ).decrypt(encryptedBytes);
      List<Map<String, String>> links =
          ApiEndpoints().qualities.map((quality) {
            final updatedLink = utf8
                .decode(decripted)
                .replaceAll('_96', quality['id']!);
            return {'quality': quality['bitrate']!, 'link': updatedLink};
          }).toList();
      return links;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getvideoinfo(String id) async {
    try {
      final channelinfo = await yt.channels.getByVideo(id); //
      final info = await yt.videos.get(id); //compute(, id);

      String disklikeurl = "${(ApiEndpoints.ytdislike)}$id";

      Uri url = Uri.parse(disklikeurl);

      final response = await http.get(url);

      Map<String, dynamic> body = jsonDecode(response.body);

      Map<String, dynamic> allinfo = {
        'channel': channelinfo,
        'video': info,
        'dislike': body['dislikes'],
      };
      if (info.title != '') {
        return allinfo;
      } else {
        throw Exception('infoFailed');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<AudioOnlyStreamInfo>>> getstream(
    String id,
  ) async {
    try {
      List<AudioOnlyStreamInfo> audioStream = [];

      final streamManifest = await compute(getManifestInIsolate, id);

      UnmodifiableListView<AudioOnlyStreamInfo> audioonly =
          streamManifest.audioOnly;

      List<AudioOnlyStreamInfo> audioOnlyStreamInfo = List.from(audioonly);

      Iterable<AudioOnlyStreamInfo> res = audioOnlyStreamInfo.where(
        (e) => e.codec.subtype == "mp4",
      );

      for (var element in res) {
        audioStream.add(element);
      }

      return right(audioStream);
    } catch (e) {
      return left(const Failures.serverfailure());
    }
  }

  @override
  Future<Either<Failures, Map<String, dynamic>>> getlyrices(
    String id,
    String title,
  ) async {
    try {
      String lyrics = await getLyrics(title);

      if (lyrics != "failure") {
        return right({"lyrics": lyrics});
      } else {
        Map<String, dynamic> lyr = await jioSaavnClient.songs.request(
          call: ApiEndpoints.endpoints.lyrics,
          queryParameters: {'lyrics_id': id},
        );

        if (lyr['status'] == "failure") {
          return right({"lyrics": "failure"});
        } else {
          return right(lyr);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, VideoSearchList>> getsearchvideo(String query) async {
    try {
      VideoSearchList list = await yt.search.search(query);
      if (list.isNotEmpty) {
        return right(list);
      }
      return left(const Failures.serverfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<dynamic> getplaylist(String id, String mode) async {
    try {
      if (mode == 'playlist') {
        List<Video> playlist = await yt.playlists.getVideos(id).toList();
        return playlist;
      } else {
        throw Exception('not a mode');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<VideoOnlyStreamInfo>>> getManifest(
    String url,
  ) async {
    try {
      final streamManifest = await compute(getManifestInIsolate, url);

      UnmodifiableListView<VideoOnlyStreamInfo> unmodifiedlist =
          streamManifest.videoOnly;
      List<VideoOnlyStreamInfo> videoOnlyStreamInfo = List.from(unmodifiedlist);

      return right(videoOnlyStreamInfo);
    } catch (e) {
      return left(Failures.serverfailure());
    }
  }

  @override
  Future<Either<Failures, RelatedVideosList>> getrelatedvideos(
    String videoid,
  ) async {
    try {
      Video video = await yt.videos.get(videoid);
      RelatedVideosList? videos = await yt.videos.getRelatedVideos(video);
      if (videos != null && videos.isNotEmpty) {
        return right(videos);
      } else {
        return left(const Failures.serverfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, ChannelUploadsList>> getchanneluploads(
    dynamic channelid,
  ) async {
    try {
      ChannelUploadsList uploadsList = await yt.channels.getUploadsFromPage(
        channelid,
        videoSorting: VideoSorting.popularity,
        videoType: VideoType.normal,
      );
      if (uploadsList.isEmpty) {
        return left(const Failures.serverfailure());
      } else {
        return right(uploadsList);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<String>> getsearchsuggestion(String query) async {
    List<String> suggestions = [];
    suggestions.clear();
    final String encoded = jsonEncode(ApiEndpoints().url);
    final uurl = encoded.replaceAll('Querydata', query).replaceAll('6', '30');
    final decoded = jsonDecode(uurl);
    Uri uri = Uri.https(ApiEndpoints.jiosaavnSearchBase, '/api.php', decoded);
    final response = await http.get(uri);
    final res = jsonDecode(response.body);
    for (var item in res['results'].where((item) => item['type'] == 'song')) {
      suggestions.add(item['title']);
    }
    return suggestions;
  }

  Future<String> getLyrics(String title) async {
    String url =
        "https://lyrics-beryl.vercel.app/youtube/lyrics?title=${title.split("|")[0]}";

    String lrclib =
        "https://lrclib.net//api/get?artist_name=${title.split("|")[1]}&track_name=${title.split("|")[0]}";

    String lrclib1 =
        "https://lrclib.net//api/search?artist_name=${title.split("|")[1]}&track_name=${title.split("|")[0]}";

    try {
      final lrcresponse = await http.get(
        Uri.parse(lrclib),
        headers: {
          "X-App-Name": "NorSe Music Player",
          "X-App-Version": "5.0.0",
          "X-App-GitHub": "https://github.com/adarsh-ns-dev/NorSe",
        },
      );

      if (lrcresponse.statusCode == 200) {
        if (jsonDecode(lrcresponse.body)["syncedLyrics"] != null) {
          return jsonDecode(lrcresponse.body)["syncedLyrics"];
        } else {
          return jsonDecode(lrcresponse.body)["plainLyrics"];
        }
      } else if (lrcresponse.statusCode == 404) {
        final lrcresponse1 = await http.get(
          Uri.parse(lrclib1),
          headers: {
            "X-App-Name": "NorSe Music Player",
            "X-App-Version": "5.0.0",
            "X-App-GitHub": "https://github.com/adarsh-ns-dev/NorSe",
          },
        );

        if (lrcresponse1.statusCode == 200) {
          if ((jsonDecode(lrcresponse1.body) as List<dynamic>).isEmpty) {
            final response = await Dio().get(url);

            if (response.statusCode == 200) {
              final data = response.data;

              log(data['lyrics'].toString());

              if (data['lyrics'] == null) {
                return 'failure';
              }

              String lyrics = data['lyrics'];

              return lyrics;
            } else {
              return "failure";
            }
          } else {
            return jsonDecode(lrcresponse1.body)[0]["syncedLyrics"];
          }
        } else {
          return "failure";
        }

       
      } else {
        return "failure";
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<AlbumSongEntity>> getsuggestion(String id) async {
    List<AlbumSongEntity> albumElements = [];
    try {
      String apibase = ApiEndpoints.Suggestionurl;
      String url = "${apibase}api/songs/$id/suggestions?&limit=20";
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        Map<String, dynamic> decoded = jsonDecode(res.body);

        for (var element in decoded['data']) {
          AlbumSongEntity songEntity = AlbumSongEntity(
            type: 'saavn',
            id: element['id'],
            name: element['name'],
            year: element['year'],
            primaryArtists:
                (element['artists']['primary'] as List<dynamic>)
                    .map((e) => e['name'])
                    .toString(),
            image: element['image'][2]['url'],
            songs: element['downloadUrl'][4]['url'],
            albumurl: element['url'],
          );

          albumElements.add(songEntity);
        }

        return albumElements;
      } else {
        throw Exception('failed suggestion');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
