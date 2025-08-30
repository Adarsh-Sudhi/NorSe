import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Checkforalbumpresentusecase {
  final Sqlrepository repo;

  Checkforalbumpresentusecase({required this.repo});

  Future<bool> call(String id) async {
    return repo.checkforalbumpresent(id);
  }
}
