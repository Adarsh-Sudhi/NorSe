import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../../configs/Error/Errors.dart';
import '../../../../Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import '../../../../Domain/Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';
import '../../../../Domain/Entity/MusicEntity/PlaylistEntity/PlaylistEntity.dart';
import '../../../../Domain/Entity/MusicEntity/SearchSongEntity/SearchEntity.dart';
import '../../../../Domain/Entity/MusicEntity/TopChartsEntity/topchartentity.dart';

abstract class APIremoteDatasource {
  Future<List<AlbumSongEntity>> getAlbumSongs(String albumurl);
  Future<List<SearchEntity>> SearchSong(String Querydata);
  Future<SearchEntity> GetSong(String Songurl);
  Future<List<AlbumSongEntity>> GetSearchedAlbums(String Query);
  Future<void> DownloadSong(
    String DownloadUrl,
    ProgressCallback progressCallback,
    String Songpath,
  );
  Future<void> DownloadArtwork(
    String DownloadUrl,
    ProgressCallback progressCallback,
    String artworkpath,
  );
  Future<List<launchdataEntity>> trendingnow(String type);
  Future<List<Map<String, dynamic>>> decrypt(String encriptedmediaurl);
  Future<Either<Failures, List<playlistEntity>>> getplaylistdetails(String id);
  Future<List<launchdataEntity>> getsearchPlaylists(String query);
  Future<Either<Failures, List<launchdataEntity>>> topsearches();
  Future<Either<Failures, List<topchartsEntity>>> topcharts();
  Future<Either<Failures, List<launchdataEntity>>> newlyreleased();
  Future<Either<Failures, List<launchdataEntity>>> gettopalbums();
  Future<Map<String, dynamic>> getvideoinfo(String id);
  Future<Either<Failures, List<AudioOnlyStreamInfo>>> getstream(String id);
  Future<Either<Failures, Map<String, dynamic>>> getlyrices(
    String id,
    String title,
  );
  Future<Either<Failures, VideoSearchList>> getsearchvideo(String query);
  Future<dynamic> getplaylist(String id, String mode);
  Future<Either<Failures, List<VideoOnlyStreamInfo>>> getManifest(String url);
  Future<Either<Failures, RelatedVideosList>> getrelatedvideos(String video);
  Future<Either<Failures, ChannelUploadsList>> getchanneluploads(
    dynamic channelid,
  );
  Future<List<String>> getsearchsuggestion(String query);
  Future<List<AlbumSongEntity>> getsuggestion(String id);

}
