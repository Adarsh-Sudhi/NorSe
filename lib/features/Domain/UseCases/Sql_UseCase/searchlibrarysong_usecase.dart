// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

import '../../../../configs/Error/Errors.dart';

class SearchLibrarySongUsecase {
  final Sqlrepository repo;
  SearchLibrarySongUsecase({
    required this.repo,
  });
  Future<Either<Failures, List<List<Map<String, dynamic>>>>> call(
      String query) {
    return repo.librarysearchfunc(query);
  }
}
