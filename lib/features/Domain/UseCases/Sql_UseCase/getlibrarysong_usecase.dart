import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Data/DataSource/LocalDataSource/SqlQuerys/Sqllocaldatasource.dart';

class Getlibraryusecase {
  final Sqldatasourcerepository repo;

  Getlibraryusecase({required this.repo});
  Future<Either<Failures, List<Map<String, dynamic>>>> call() {
    return repo.getlibrarysongs();
  }
}
