import 'package:dart_ytmusic_api/types.dart';

abstract class Ytmusicrepository {
  Future<List<HomeSection>> getinitiallaunchdata();
}
