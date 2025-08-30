// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dart_ytmusic_api/types.dart';
import 'package:norse/features/Domain/Repositorys/ytmusicrepository/ytmusicrepository.dart';

class Getinitiallaunchdata {
  final Ytmusicrepository repo;
  Getinitiallaunchdata({required this.repo});
  Future<List<HomeSection>> call() async {
    return repo.getinitiallaunchdata();
  }
}
