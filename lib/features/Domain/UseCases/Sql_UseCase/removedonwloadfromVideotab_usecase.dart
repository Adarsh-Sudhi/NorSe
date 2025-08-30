import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class RemoveVideoFromDownloadTavUseCase {
  final Sqlrepository repo;

  RemoveVideoFromDownloadTavUseCase({required this.repo});
  Future<bool> call(String id) async {
    return repo.removeFromVideoDownloadTab(id);
  }
}
