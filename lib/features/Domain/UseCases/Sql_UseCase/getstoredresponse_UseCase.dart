import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class GetStoredUseCase {
  final Sqlrepository repo;

  GetStoredUseCase({required this.repo});
  Future<String> call(String id) async {
    return repo.getstoredresponse(id);
  }
}
