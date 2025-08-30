// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Addtoplaylistusecase {
  final Sqlrepository repo;
  Addtoplaylistusecase({
    required this.repo,
  });
  Future<Either<Failures, bool>> call(String tbname, AlbumElements song) {
    return repo.Addtoplaylist(tbname, song);
  }
}
