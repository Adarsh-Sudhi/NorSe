// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class addtorecentUseCase {
  final Sqlrepository repo;
  addtorecentUseCase({
    required this.repo,
  });
  Future<Either<Failures, bool>> call(AlbumElements song) async {
    return repo.addtorecent(song);
  }
}
