import 'package:dartz/dartz.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Usersearchusecase {
  final Sqlrepository repo;

  Usersearchusecase({required this.repo});
  Future<Either<bool, List<Map<String, dynamic>>>> call(
          String mode, String search) async =>
      await repo.getsearchsuggestions(mode, search);
}
