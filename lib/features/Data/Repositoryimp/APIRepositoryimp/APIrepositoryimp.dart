import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:norse/features/Data/DataSource/RemoteDataSource/saavn/APIremotedatasource.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/PlaylistEntity/PlaylistEntity.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/TopChartsEntity/topchartentity.dart';
import 'package:norse/features/Domain/Repositorys/APIRepository/APIrepository.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../configs/Error/Errors.dart';
import '../../../Domain/Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import '../../../Domain/Entity/MusicEntity/SearchSongEntity/SearchEntity.dart';

class APIRepositoryimp implements APIRepository {
  final APIremoteDatasource apIremoteDatasource;
  APIRepositoryimp({required this.apIremoteDatasource});

  @override
  Future<List<AlbumSongEntity>> getAlbumSongs(String albumurl) =>
      apIremoteDatasource.getAlbumSongs(albumurl);

  @override
  Future<List<SearchEntity>> SearchSong(String Querydata) =>
      apIremoteDatasource.SearchSong(Querydata);
  @override
  Future<SearchEntity> GetSong(String Songurl) =>
      apIremoteDatasource.GetSong(Songurl);

  @override
  Future<List<AlbumSongEntity>> GetSearchedAlbums(String Query) =>
      apIremoteDatasource.GetSearchedAlbums(Query);

  @override
  Future<void> DownloadSong(
    String DownloadUrl,
    ProgressCallback progressCallback,
    String Songpath,
  ) =>
      apIremoteDatasource.DownloadSong(DownloadUrl, progressCallback, Songpath);

  @override
  Future<void> DownloadArtwork(
    String DownloadUrl,
    ProgressCallback progressCallback,
    String artworkpath,
  ) => apIremoteDatasource.DownloadArtwork(
    DownloadUrl,
    progressCallback,
    artworkpath,
  );

  @override
  Future<List<launchdataEntity>> trendingnow(String type) =>
      apIremoteDatasource.trendingnow(type);

  @override
  Future<Either<Failures, List<playlistEntity>>> getplaylistdetails(
    String id,
  ) => apIremoteDatasource.getplaylistdetails(id);

  @override
  Future<List<launchdataEntity>> getsearchPlaylists(String query) =>
      apIremoteDatasource.getsearchPlaylists(query);

  @override
  Future<Either<Failures, List<launchdataEntity>>> topsearches() =>
      apIremoteDatasource.topsearches();

  @override
  Future<Either<Failures, List<topchartsEntity>>> topcharts() =>
      apIremoteDatasource.topcharts();

  @override
  Future<Either<Failures, List<launchdataEntity>>> newlyreleased() =>
      apIremoteDatasource.newlyreleased();

  @override
  Future<Either<Failures, List<launchdataEntity>>> gettopalbums() =>
      apIremoteDatasource.gettopalbums();

  @override
  Future<Map<String, dynamic>> getvideoinfo(String id) =>
      apIremoteDatasource.getvideoinfo(id);

  @override
  Future<Either<Failures, List<AudioOnlyStreamInfo>>> getstream(String id) =>
      apIremoteDatasource.getstream(id);

  @override
  Future<Either<Failures, Map<String, dynamic>>> getlyrices(
    String id,
    String title,
  ) => apIremoteDatasource.getlyrices(id, title);

  @override
  Future<Either<Failures, VideoSearchList>> getsearchvideo(String query) =>
      apIremoteDatasource.getsearchvideo(query);

  @override
  Future<dynamic> getplaylist(String id, String mode) =>
      apIremoteDatasource.getplaylist(id, mode);

  @override
  Future<Either<Failures, List<VideoOnlyStreamInfo>>> getManifest(String id) =>
      apIremoteDatasource.getManifest(id);

  @override
  Future<Either<Failures, RelatedVideosList>> getrelatedvideos(String video) =>
      apIremoteDatasource.getrelatedvideos(video);

  @override
  Future<Either<Failures, ChannelUploadsList>> getchanneluploads(channelid) =>
      apIremoteDatasource.getchanneluploads(channelid);

  @override
  Future<List<String>> getsearchsuggestion(String query) =>
      apIremoteDatasource.getsearchsuggestion(query);

  @override
  Future<List<AlbumSongEntity>> getsuggestion(String id) async {
    return apIremoteDatasource.getsuggestion(id);
  }
}
