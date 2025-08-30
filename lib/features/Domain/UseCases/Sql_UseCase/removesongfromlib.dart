import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Removesongfromlibusecase {
  final Sqlrepository repo;

  Removesongfromlibusecase({required this.repo});

  Future<Either<Failures, bool>> call(String id) {
    return repo.removesongfromlib(id);
  }
}
