// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class getallrecentUseCase {
  final Sqlrepository repository;
  getallrecentUseCase({
    required this.repository,
  });
  Future<Either<Failures, List<Map<String, dynamic>>>> call() async {
    return repository.getallrecent();
  }
}
