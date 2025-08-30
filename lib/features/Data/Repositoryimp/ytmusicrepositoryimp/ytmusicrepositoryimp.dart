// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_ytmusic_api/types.dart';
import 'package:norse/features/Data/DataSource/RemoteDataSource/ytmusic/ytmusicdatasource.dart';
import 'package:norse/features/Domain/Repositorys/ytmusicrepository/ytmusicrepository.dart';

class Ytmusicrepositoryimp extends Ytmusicrepository {
  final Ytmusicdatasource ytmusicdatasource;
  Ytmusicrepositoryimp({required this.ytmusicdatasource});
  @override
  Future<List<HomeSection>> getinitiallaunchdata() async {
    return ytmusicdatasource.getinitiallaunchdata();
  }
}
