import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class AddtofaveUsecase {
  final Sqlrepository repo;

  AddtofaveUsecase({required this.repo});
  Future<Either<Failures, String>> call(
      AlbumElements song, bool isadded) async {
    return repo.addtofav(song, isadded);
  }
}
