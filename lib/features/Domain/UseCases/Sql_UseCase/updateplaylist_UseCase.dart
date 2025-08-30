import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class updateplaylistusecase {
  final Sqlrepository repository;

  updateplaylistusecase({required this.repository});
  Future<Either<Failures, List<Map<String, dynamic>>>> call(
      String table, List<Map<String, dynamic>> newitems) {
    return repository.updateplaylist(table, newitems);
  }
}
