import 'package:dart_ytmusic_api/dart_ytmusic_api.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:jiosaavn/jiosaavn.dart';
import 'package:norse/features/Data/DataSource/LocalDataSource/Platform/PlatFormDatasource.dart';
import 'package:norse/features/Data/DataSource/LocalDataSource/Platform/PlatformDataSourceImp.dart';
import 'package:norse/features/Data/DataSource/LocalDataSource/SqlQuerys/Sqllocaldatasource.dart';
import 'package:norse/features/Data/DataSource/LocalDataSource/SqlQuerys/sqllocaldatasourceimp.dart';
import 'package:norse/features/Data/DataSource/RemoteDataSource/saavn/APIremotedatasource.dart';
import 'package:norse/features/Data/DataSource/RemoteDataSource/saavn/APIremotedatasourceimp.dart';
import 'package:norse/features/Data/DataSource/RemoteDataSource/ytmusic/ytmusicdatasource.dart';
import 'package:norse/features/Data/DataSource/RemoteDataSource/ytmusic/ytmusicdatasourceimp.dart';
import 'package:norse/features/Data/Repositoryimp/APIRepositoryimp/APIrepositoryimp.dart';
import 'package:norse/features/Data/Repositoryimp/PlatformRepositoryimp/PlatformRepositoryimp.dart';
import 'package:norse/features/Data/Repositoryimp/SqlRepositoryimp/sqlrepositoryimp.dart';
import 'package:norse/features/Data/Repositoryimp/ytmusicrepositoryimp/ytmusicrepositoryimp.dart';
import 'package:norse/features/Domain/Repositorys/APIRepository/APIrepository.dart';
import 'package:norse/features/Domain/Repositorys/PlatformRepository/PlatformRepository.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';
import 'package:norse/features/Domain/Repositorys/ytmusicrepository/ytmusicrepository.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getSuggestion_useCase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getchanneluploads_usecase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getsongs_songsuggestionusecase.dart';
import 'package:norse/features/Domain/UseCases/API_UseCase/getytReleatedvideos_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/GetPermissions_UseCase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/backupdata_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/deletesongfromdevice_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getalbuma_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getalbumsongs_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getallsongs_UseCase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getartistsong_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getartistwise_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getgenre_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/getsongsfromgenre_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/initializenotification_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/restoredata_usecase.dart';
import 'package:norse/features/Domain/UseCases/Platform_UseCase/shownotification_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/addVideotoDownloadTable_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/getallVideosfromDownload_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/logoutspotify_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/removedonwloadfromVideotab_usecase.dart';
import 'package:norse/features/Domain/UseCases/Sql_UseCase/updateplayerui_UseCase.dart';
import 'package:norse/features/Domain/UseCases/ytmusic_usecase/ytmusic_usecase.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/LocalSongs_bloc/localsong_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/Suggestion/suggestion_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/TagEditor_bloc/tageditor_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/managevideo_bloc/manage_video_download_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtubeplayer_bloc/youtubeplayer_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/youtuber_player_background/youtube_player_background_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytchannel_bloc/youtubechannel_bloc.dart';
import 'package:norse/features/Presentation/Blocs/youtubeBloc/ytrelatedvideos_bloc/ytrelatedvideos_bloc.dart'
    show YtrelatedvideosBloc;
import 'package:norse/features/Presentation/Blocs/ytmusic/ytmusic_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'features/Domain/UseCases/API_UseCase/DownloadArtwork_UseCase.dart';
import 'features/Domain/UseCases/API_UseCase/DownloadSong_UseCase.dart';
import 'features/Domain/UseCases/API_UseCase/GetAlbumSongs_UseCase.dart';
import 'features/Domain/UseCases/API_UseCase/GetNewlyReleaseSong_UseCase.dart';
import 'features/Domain/UseCases/API_UseCase/GetSearchedAlbums_USeCase.dart';
import 'features/Domain/UseCases/API_UseCase/SearchPlaylist_UseCase.dart';
import 'features/Domain/UseCases/API_UseCase/SearchSong_UseCase.dart';
import 'features/Domain/UseCases/API_UseCase/getlyrices_usecase.dart';
import 'features/Domain/UseCases/API_UseCase/getnewlyreleased_Usecase.dart';
import 'features/Domain/UseCases/API_UseCase/getplaylists_Usecase.dart';
import 'features/Domain/UseCases/API_UseCase/getsearchsongs_usecase.dart';
import 'features/Domain/UseCases/API_UseCase/gettopCharts_UseCase.dart';
import 'features/Domain/UseCases/API_UseCase/gettopalbums_Usecase.dart';
import 'features/Domain/UseCases/API_UseCase/gettopsearches_UseCase.dart';
import 'features/Domain/UseCases/API_UseCase/trendingnow_UseCase.dart';
import 'features/Domain/UseCases/Sql_UseCase/Getallrecents.dart';
import 'features/Domain/UseCases/Sql_UseCase/addtodownloads_Usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/addtofav_UseCase.dart';
import 'features/Domain/UseCases/Sql_UseCase/addtolibrary_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/addtoplaylist_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/addtorecents_UseCase.dart';
import 'features/Domain/UseCases/Sql_UseCase/chechifplaylistpresent_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/checkforalbumpresent_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/checkforsong.dart';
import 'features/Domain/UseCases/Sql_UseCase/clearalldownloads_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/clearallrecents_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/createplaylist_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getallfav_Usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getallplaylist_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getallsongsfromplaylists_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getfavsongstatus_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getlibraryalbums_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getlibraryplaylist_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getlibrarysong_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getplayerui_UseCase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getquerydata_Usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getstoredresponse_UseCase.dart';
import 'features/Domain/UseCases/Sql_UseCase/getuserdetails_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/initializedatabase_Usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/initialplayerui_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/removefromdownloads.dart';
import 'features/Domain/UseCases/Sql_UseCase/removefromfav_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/removefromrecents.dart';
import 'features/Domain/UseCases/Sql_UseCase/removeplaylist_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/removesongfromlib.dart';
import 'features/Domain/UseCases/Sql_UseCase/removesongfromplaylist_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/searchlibrarysong_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/updateplaylist_UseCase.dart';
import 'features/Domain/UseCases/Sql_UseCase/updateuserplaylists_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/userdetails_usecase.dart';
import 'features/Domain/UseCases/Sql_UseCase/usersearch_usecase.dart';
import 'features/Domain/UseCases/yt_usecase/getaudiostream_usecase.dart';
import 'features/Domain/UseCases/yt_usecase/getsearchvideo_usecase.dart';
import 'features/Domain/UseCases/yt_usecase/getstreamManifest_usecase.dart';
import 'features/Domain/UseCases/yt_usecase/getvideoinfo_usecase.dart';
import 'features/Domain/UseCases/yt_usecase/getytplaylist_usecase.dart';
import 'features/Presentation/Blocs/Connectivity_bloc/connnectivity_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Albumsongs/albums_songs_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Download_Bloc/download_song_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Library/album/libraryalbum/libraryalbum_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Library/album/libraryalbumlike/libraryalbumlike_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Library/playlist/libraryplaylist/libraryplaylist_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Library/playlist/libraryplaylistlike/libraryplaylistlike_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Library/song/library_bloc/library_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Library/song/songlike_bloc/songlike_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/LocalData/localdata_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Lyrics_bloc/lyrics_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/SearchSong_bloc/search_song_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/Trending_Song_bloc/trending_song_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/User_bloc/user_bloc_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/audio_bloc/audio_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/backupandrestorebloc/bloc/backup_and_restore_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/favorite_bloc/favoriteplaylist_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/favsong_bloc/favsongs_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/playerui_bloc/playerui_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/playlist_Bloc/playlist_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/playlistsongs_bloc/playlistsongs_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/recents_bloc/recents_bloc.dart';
import 'features/Presentation/Blocs/Musicbloc/searchlibrary_bloc/searchlibrary_bloc.dart';
import 'features/Presentation/Blocs/youtubeBloc/downloadvideo_bloc/download_video_bloc.dart';
import 'features/Presentation/Blocs/youtubeBloc/searchyt_bloc/searchyt_bloc_bloc.dart';
import 'features/Presentation/Blocs/youtubeBloc/videoinfo_bloc/videoinfo_bloc.dart';
import 'features/Presentation/Blocs/youtubeBloc/yt_bloc/yt_bloc.dart';
import 'features/Presentation/Blocs/youtubeBloc/ytdownload_bloc/ytdownload_bloc.dart';
import 'features/Presentation/Blocs/youtubeBloc/ytsearch_bloc/ytsearch_bloc.dart';

GetIt di = GetIt.instance;

Future<void> init() async {
  //bloc
  di.registerFactory(() => AlbumsSongsBloc(di.call(), di.call()));
  di.registerFactory(
    () =>
        TrendingSongBloc(di.call(), di.call(), di.call(), di.call(), di.call()),
  );
  di.registerFactory(() => SearchSongBloc(di.call(), di.call(), di.call()));
  di.registerFactory(() => DownloadSongBloc(di.call(), di.call()));
  di.registerFactory(() => LocaldataBloc(di.call(), di.call(), di.call()));
  di.registerFactory(() => PlaylistBloc());
  di.registerFactory(() => FavsongsBloc());
  di.registerFactory(() => FavoriteplaylistBloc());
  di.registerFactory(() => PlaylistsongsBloc(di.call()));
  di.registerFactory(() => LibraryBloc());
  di.registerFactory(() => SonglikeBloc());
  di.registerFactory(() => LibraryalbumBloc());
  di.registerFactory(() => LibraryalbumlikeBloc());
  di.registerFactory(() => LibraryplaylistBloc());
  di.registerFactory(() => LibraryplaylistlikeBloc());
  di.registerFactory(() => YtBloc(di.call()));
  di.registerFactory(() => YtdownloadBloc(di.call()));
  di.registerFactory(() => UserBlocBloc());
  di.registerFactory(() => RecentsBloc(di.call()));
  di.registerFactory(() => LyricsBloc());
  di.registerFactory(() => YtsearchBloc());
  di.registerFactory(() => AudioBloc());
  di.registerFactory(() => BackupAndRestoreBloc());
  di.registerFactory(() => VideoinfoBloc());
  di.registerFactory(() => SearchytBlocBloc());
  di.registerFactory(() => ConnnectivityBloc());
  di.registerFactory(() => SearchlibraryBloc());
  di.registerFactory(() => PlayeruiBloc());
  di.registerFactory(() => TageditorBloc());
  di.registerFactory(() => YtrelatedvideosBloc());
  di.registerFactory(() => YoutubeplayerBloc());
  di.registerFactory(() => YoutubechannelBloc());
  di.registerFactory(() => SuggestionBloc());
  di.registerFactory(
    () => ManageVideoDownloadBloc(
      addVideosToDownLoadTableUseCase: di.call(),
      getallvideosfromtable: di.call(),
    ),
  );
  di.registerFactory(() => YtmusicBloc());

  di.registerFactory(() => LocalsongBloc(di.call(), di.call(), di.call()));
  di.registerFactory(() => DownloadVideoBloc(downloadSongUseCase: di.call()));
  di.registerFactory(() => YoutubePlayerBackgroundBloc());

  //UseCase
  di.registerLazySingleton(() => GetAlbumSongsUseCase(repository: di.call()));
  di.registerLazySingleton(() => SearchSongUseCase(repository: di.call()));
  di.registerLazySingleton(() => GetSongsUseCase(repository: di.call()));
  di.registerLazySingleton(
    () => GetSearchedAlbumsUseCase(repository: di.call()),
  );
  di.registerLazySingleton(() => DownloadSongUseCase(repository: di.call()));
  di.registerLazySingleton(() => DownloadArworkUseCase(repository: di.call()));
  di.registerLazySingleton(() => GetpermissionUseCase(repository: di.call()));
  di.registerLazySingleton(() => trendingnowUseCase(repository: di.call()));
  di.registerLazySingleton(
    () => getplaylistdetailsUSeCase(repository: di.call()),
  );
  di.registerLazySingleton(() => SearchPlaylistUseCase(repository: di.call()));
  di.registerLazySingleton(() => initializedbusecase(repository: di.call()));
  di.registerLazySingleton(() => addtodownloadsUsecase(Repository: di.call()));
  di.registerLazySingleton(() => getquerydataUsecase(repository: di.call()));
  di.registerLazySingleton(
    () => RemovefromdownloadsUseCase(repository: di.call()),
  );
  di.registerLazySingleton(() => GettopserachesUseCase(repo: di.call()));
  di.registerLazySingleton(() => GettopChatsUseCase(repo: di.call()));
  di.registerLazySingleton(() => addtorecentUseCase(repo: di.call()));
  di.registerLazySingleton(() => getallrecentUseCase(repository: di.call()));
  di.registerLazySingleton(
    () => RemovefromrecentsUsecase(repository: di.call()),
  );
  di.registerLazySingleton(() => getallsongsUsecase(repository: di.call()));
  di.registerLazySingleton(() => AddtofaveUsecase(repo: di.call()));
  di.registerLazySingleton(() => GetallfaveUsecase(repository: di.call()));
  di.registerLazySingleton(() => removefromfavusecase(repository: di.call()));
  di.registerLazySingleton(() => updateplaylistusecase(repository: di.call()));
  di.registerLazySingleton(() => newlyreleasedUsecase(repository: di.call()));
  di.registerLazySingleton(() => gettopalbumsUseCase(repository: di.call()));
  di.registerLazySingleton(() => Createplaylistusecase(repository: di.call()));
  di.registerLazySingleton(() => Getallplaylistusecase(repository: di.call()));
  di.registerLazySingleton(() => Removeplaylistusecase(repo: di.call()));
  di.registerLazySingleton(() => Addtoplaylistusecase(repo: di.call()));
  di.registerLazySingleton(
    () => Getallsongsfromplaylistsusecase(Repositorys: di.call()),
  );
  di.registerLazySingleton(
    () => Removesongfromplaylistusecase(repository: di.call()),
  );
  di.registerLazySingleton(
    () => Uppdateuserplaylistusecase(repository: di.call()),
  );
  di.registerLazySingleton(() => Getfavsongstatususecase(repo: di.call()));
  di.registerLazySingleton(() => Getallalbumsusecase(repository: di.call()));
  di.registerLazySingleton(() => Clearallrecentsusecase(repository: di.call()));
  di.registerLazySingleton(
    () => Clearalldownloadusecase(repository: di.call()),
  );
  di.registerLazySingleton(() => Addtolibraryusecase(repo: di.call()));
  di.registerLazySingleton(() => Getlibraryusecase(repo: di.call()));
  di.registerLazySingleton(() => checkforsongusecase(repo: di.call()));
  di.registerLazySingleton(() => Getlibraryalbumsusecase(repo: di.call()));
  di.registerLazySingleton(() => Checkforalbumpresentusecase(repo: di.call()));
  di.registerLazySingleton(() => Getlibraryplaylistusecase(repo: di.call()));
  di.registerLazySingleton(
    () => Checkifplaylistpresentusecase(repo: di.call()),
  );
  di.registerLazySingleton(() => Getalbumsongsusecase(repo: di.call()));
  di.registerLazySingleton(() => Getvideoinfousecase(repository: di.call()));
  di.registerLazySingleton(() => Getaudiostreamusecase(repository: di.call()));
  di.registerLazySingleton(() => Userdetailsusecase(repository: di.call()));
  di.registerLazySingleton(() => Getuserdetailsusecase(repository: di.call()));
  di.registerLazySingleton(() => Getlyricesusecase(repository: di.call()));
  di.registerLazySingleton(() => Getsearchvideousecase(repository: di.call()));
  di.registerLazySingleton(() => Backupdatausecase(repository: di.call()));
  di.registerLazySingleton(() => Restoredatausecase(repository: di.call()));
  di.registerLazySingleton(() => Getplaylistusecase(repository: di.call()));
  di.registerLazySingleton(() => Usersearchusecase(repo: di.call()));
  di.registerLazySingleton(
    () => GetstreamManifestusecase(repository: di.call()),
  );
  di.registerLazySingleton(() => Getsearchsongsusecase(repository: di.call()));
  di.registerLazySingleton(
    () => InitializeNotificationusecase(repository: di.call()),
  );
  di.registerLazySingleton(
    () => Shownotificationusecase(repository: di.call()),
  );
  di.registerLazySingleton(() => Removesongfromlibusecase(repo: di.call()));
  di.registerLazySingleton(() => SearchLibrarySongUsecase(repo: di.call()));
  di.registerLazySingleton(() => IntialPlayerUiUseCase(repo: di.call()));
  di.registerLazySingleton(() => GetPlayerUiUseCase(repo: di.call()));
  di.registerLazySingleton(() => GetStoredUseCase(repo: di.call()));
  di.registerLazySingleton(() => DeleteSongFromDeviceUseCase(repo: di.call()));
  di.registerLazySingleton(() => GetArtistWiseUseCase(repository: di.call()));
  di.registerLazySingleton(() => GetArtistSongUSeCase(repository: di.call()));
  di.registerLazySingleton(() => GetGenreUseCase(repository: di.call()));
  di.registerLazySingleton(() => GetSongsFromGenreUseCase(di.call()));

  di.registerLazySingleton(
    () => GetyoutubeRelatedVideosUseCase(repository: di.call()),
  );
  di.registerLazySingleton(() => GetChannelUploads(di.call()));
  di.registerLazySingleton(() => Getsuggestionusecase(repository: di.call()));
  di.registerLazySingleton(
    () => AddVideosToDownLoadTableUseCase(repo: di.call()),
  );
  di.registerLazySingleton(() => GetAllVidoeFromTableUseCase(repo: di.call()));
  di.registerLazySingleton(
    () => RemoveVideoFromDownloadTavUseCase(repo: di.call()),
  );
  di.registerLazySingleton(() => LogoutspotifyUsecase(repo: di.call()));
  di.registerLazySingleton(() => UpdatePlayerUiUseCase(repo: di.call()));
  di.registerLazySingleton(
    () => GetSongSuggestionUseCase(repository: di.call()),
  );
  di.registerLazySingleton(() => Getinitiallaunchdata(repo: di.call()));

  //Repository
  di.registerLazySingleton<APIRepository>(
    () => APIRepositoryimp(apIremoteDatasource: di.call()),
  );
  di.registerLazySingleton<APIremoteDatasource>(
    () => APIremotedatasourceimp(
      yt: di.call(),
      jioSaavnClient: di.call(),
      sqldatasourcerepository: di.call(),
    ),
  );
  di.registerLazySingleton<PlatformRepository>(
    () => PlatformRepositoryimp(platformDataRepository: di.call()),
  );
  di.registerLazySingleton<PlatformDataRepository>(
    () => PlatformDataRepositoryimp(
      onAudioQuery: di.call(),
      flutterLocalNotificationsPlugin: di.call(),
    ),
  );
  di.registerLazySingleton<Sqlrepository>(
    () => Sqlrepositoryimp(sqldatasourcerepository: di.call()),
  );
  di.registerLazySingleton<Sqldatasourcerepository>(
    () => Sqldatasourcerepositoryimp(),
  );
  di.registerLazySingleton<Ytmusicrepository>(
    () => Ytmusicrepositoryimp(ytmusicdatasource: di.call()),
  );
  di.registerLazySingleton<Ytmusicdatasource>(
    () => Ytmusicdatasourceimp(ytMusic: di.call()),
  );

  final OnAudioQuery onAudioQuery = OnAudioQuery();
  final YoutubeExplode yt = YoutubeExplode();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final JioSaavnClient saavnClient = JioSaavnClient();
  final YTMusic ytMusic = YTMusic();

  di.registerLazySingleton<YoutubeExplode>(() => yt);
  di.registerLazySingleton<OnAudioQuery>(() => onAudioQuery);
  di.registerLazySingleton<FlutterLocalNotificationsPlugin>(
    () => flutterLocalNotificationsPlugin,
  );
  di.registerLazySingleton<JioSaavnClient>(() => saavnClient);
  di.registerLazySingleton<YTMusic>(() => ytMusic);
  // di.registerLazySingleton<Audiotagger>(()=> audiotagger);
}
