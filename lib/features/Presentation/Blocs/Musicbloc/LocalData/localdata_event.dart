part of 'localdata_bloc.dart';


@freezed
class LocaldataEvent with _$LocaldataEvent {
  const factory LocaldataEvent.createPlaylist(
    String playlistname, 
  )=_Createplaylist;
  const factory LocaldataEvent.updateplaylist( 
    List<Map<String,dynamic>> newitem,
  )=_Updateplaylist;
  const factory LocaldataEvent.removefromdownloads(
    String id,
  ) = _RemovefromDownloads;
  const factory LocaldataEvent.addtorecent(
    AlbumElements song,
  ) = _Addtorecent;
  const factory LocaldataEvent.removefromRecents(
    String id,
  ) = _Removefromrecents;
  const factory LocaldataEvent.getDownloads() = _GetDownloads;
  const factory LocaldataEvent.clearalldownloads() = _Clearalldownloads;

  const factory LocaldataEvent.started() = _Started;
}