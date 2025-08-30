import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../../configs/Error/Errors.dart';
import '../../../../Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import '../../../Models/MusicModels/usermodel.dart';

abstract class Sqldatasourcerepository {
  Future<bool> storeresponse(String jsonString, String type);
  Future<String> getstoredresponse(String id);
  Future<Database> intializedatabase();
  Future<bool> addtodownloads(AlbumElements song);
  Future<Either<Failures, List<Map<String, dynamic>>>> QueryDownloaddata();
  Future<Either<Failures, bool>> removefromdownloads(String id);
  Future<Either<Failures, bool>> addtorecent(AlbumElements song);
  Future<Either<Failures, List<Map<String, dynamic>>>> getallrecent();
  Future<Either<Failures, bool>> removefromRecents(String id);
  Future<Either<Failures, String>> addtofav(AlbumElements song, bool isadded);
  Future<Either<Failures, bool>> removefromfav(String id);
  Future<Either<Failures, List<Map<String, dynamic>>>> getallfavs();
  Future<Either<Failures, List<Map<String, dynamic>>>> updateplaylist(
      String table, List<Map<String, dynamic>> newitems);
  Future<Either<Failures, bool>> Addtoplaylist(
      String tbname, AlbumElements song);
  Future<Either<Failures, bool>> createplaylist(String playlistname);
  Future<Either<Failures, List<Map<String, dynamic>>>> getallplaylist();
  Future<Either<Failures, List<Map<String, dynamic>>>> getallsongsfromplaylists(
      String playlistid);
  Future<Either<Failures, bool>> deleteplaylist(
      String playlistid, String playlistname);
  Future<Either<Failures, bool>> deletesongfromplaylist(
      String playlistname, String songid);
  Future<Either<Failures, bool>> updateuserplaylist(
      String playlistname, List<Map<String, dynamic>> newform);
  Future<Either<Failures, bool>> favsong(String songid);
  Future<Either<Failures, bool>> clearecentsongs();
  Future<Either<Failures, bool>> cleardownloads();
  Future<Either<Failures, String>> addtolibrary(
      String type, AlbumElements song);
  Future<Either<Failures, List<Map<String, dynamic>>>> getlibrarysongs();
  Future<Either<Failures, bool>> removesongfromlib(String id);
  Future<bool> Checkifpresent(String id);
  Future<Either<Failures, List<Map<String, dynamic>>>> getlibraryalbums();
  Future<bool> checkforalbumpresent(String id);
  Future<Either<Failures, List<Map<String, dynamic>>>> getlibraryplaylist();
  Future<bool> checkifplaylistpresent(String id);
  Future<bool> userdetails(String mode, Usermodel user);
  Future<Map<String, dynamic>> getuserdetails();
  Future<Either<bool, List<Map<String, dynamic>>>> getsearchsuggestions(
      String mode, String search);
  Future<Either<Failures, List<List<Map<String, dynamic>>>>> librarysearchfunc(
      String query);
  Future<Map<String, dynamic>> getplayerui(String uitype);
  Future<void> initialplayerui();
  Future<bool> videoAndAudioDownload(VideoOnlyStreamInfo videoOnlyStreamInfo,
    AudioOnlyStreamInfo audioOnlyStreamInfo,Map<String,dynamic> details);
  Future<List<Map<String, dynamic>>> getAddedDownloadVideos();
  Future<bool> removeFromVideoDownloadTab(String id);
  Future<void> fetchspotifydata(Map<String,dynamic> spotify);
  Future<List<Map<String, dynamic>>> getSpotifyTokens();
  Future<void>logoutspotify();
  Future<void> updateplayerui(String type);
}
