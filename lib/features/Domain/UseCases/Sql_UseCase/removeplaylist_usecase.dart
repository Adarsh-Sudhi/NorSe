// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Removeplaylistusecase {
  final Sqlrepository repo;
  Removeplaylistusecase({
    required this.repo,
  });
  Future<Either<Failures, bool>> call(String playlistid, String playlistname) {
    return repo.deleteplaylist(playlistid, playlistname);
  }
}
