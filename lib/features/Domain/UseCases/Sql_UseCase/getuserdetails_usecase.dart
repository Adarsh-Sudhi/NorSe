// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Getuserdetailsusecase {
  final Sqlrepository repository;
  const Getuserdetailsusecase({
    required this.repository,
  });
  Future<Map<String, dynamic>> call() async {
    return repository.getuserdetails();
  }
}
