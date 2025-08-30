import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class GetAllVidoeFromTableUseCase {
  final Sqlrepository repo;

  GetAllVidoeFromTableUseCase({required this.repo});
  Future<List<Map<String, dynamic>>> call() async {
    return repo.getAddedDownloadVideos();
  }
}
