// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class GetPlayerUiUseCase {
  final Sqlrepository repo;
  GetPlayerUiUseCase({
    required this.repo,
  });
  Future<Map<String, dynamic>> call() async {
    return repo.getplayerui('0');
  }
}
