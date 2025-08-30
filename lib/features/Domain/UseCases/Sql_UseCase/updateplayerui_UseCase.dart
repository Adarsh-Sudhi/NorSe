// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class UpdatePlayerUiUseCase {
  final Sqlrepository repo;
  UpdatePlayerUiUseCase({
    required this.repo,
  });
  Future<void> call(String type) async {
    return repo.updateplayerui(type);
  }
}
