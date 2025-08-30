import 'package:dartz/dartz.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

import '../../../../configs/Error/Errors.dart';

class getquerydataUsecase {
  final Sqlrepository repository;
  getquerydataUsecase({
    required this.repository,
  });
  Future<Either<Failures, List<Map<String, dynamic>>>> call() {
    return repository.QueryDownloaddata();
  }
}
