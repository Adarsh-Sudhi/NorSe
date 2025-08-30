// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Removesongfromplaylistusecase {
  final Sqlrepository repository;
  Removesongfromplaylistusecase({
    required this.repository,
  });
  Future<Either<Failures, bool>> call(String playlistname, String songid) {
    return repository.deletesongfromplaylist(playlistname, songid);
  }
}
