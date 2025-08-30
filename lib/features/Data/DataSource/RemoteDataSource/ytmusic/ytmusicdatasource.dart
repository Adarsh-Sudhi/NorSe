import 'package:dart_ytmusic_api/types.dart';

abstract class Ytmusicdatasource {
  Future<List<HomeSection>> getinitiallaunchdata();
}
