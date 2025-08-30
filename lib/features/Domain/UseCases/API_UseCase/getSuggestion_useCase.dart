import 'package:norse/features/Domain/Repositorys/APIRepository/APIrepository.dart';

class Getsuggestionusecase {
  final APIRepository repository;

  Getsuggestionusecase({required this.repository});

  Future<List<String>> call(String query) {
    return repository.getsearchsuggestion(query);
  }
}
