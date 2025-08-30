import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Checkifplaylistpresentusecase {
  final Sqlrepository repo;

  Checkifplaylistpresentusecase({required this.repo});
  Future<bool> call(String id) async {
    return repo.checkifplaylistpresent(id);
  }
}
