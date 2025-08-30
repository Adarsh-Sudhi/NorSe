import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Clearallrecentsusecase {
  final Sqlrepository repository;
  Clearallrecentsusecase({
    required this.repository,
  });
  Future<Either<Failures, bool>> call() async {
    return repository.clearecentsongs();
  }
}
