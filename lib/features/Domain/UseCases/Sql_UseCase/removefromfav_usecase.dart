import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class removefromfavusecase {
  final Sqlrepository repository;

  removefromfavusecase({required this.repository});
  Future<Either<Failures, bool>> call(String id) async {
    return repository.removefromfav(id);
  }
}
