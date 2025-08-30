// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class LogoutspotifyUsecase {
  final Sqlrepository repo;
  LogoutspotifyUsecase({
    required this.repo,
  });
  Future<void>call()async{
    return repo.logoutspotify();
  }
}
