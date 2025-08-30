import '../../Repositorys/PlatformRepository/PlatformRepository.dart';

class Shownotificationusecase {
  final PlatformRepository repository;
  Shownotificationusecase({
    required this.repository,
  });
  Future<void> call(
      double progress, int id, String title, String auther) async {
    return repository.showprogress(progress, id, title, auther);
  }
}
