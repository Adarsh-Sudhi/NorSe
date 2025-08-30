// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../configs/Error/Errors.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class Getlyricesusecase {
  final APIRepository repository;
  const Getlyricesusecase({
    required this.repository,
  });
  Future<Either<Failures, Map<String, dynamic>>> call(String id,String title) async {
    return repository.getlyrices(id,title);
  }
}
