// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_ytmusic_api/dart_ytmusic_api.dart';
import 'package:norse/features/Data/DataSource/RemoteDataSource/ytmusic/ytmusicdatasource.dart';

class Ytmusicdatasourceimp extends Ytmusicdatasource {
  final YTMusic ytMusic;
  Ytmusicdatasourceimp({required this.ytMusic});

  @override
  Future<List<HomeSection>> getinitiallaunchdata() async {
    try {
      List<HomeSection> homedata = await ytMusic.getHomeSections();
      return homedata;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
 