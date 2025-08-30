import '../../Repositorys/PlatformRepository/PlatformRepository.dart';

class InitializeNotificationusecase {
  final PlatformRepository repository;
  InitializeNotificationusecase({
    required this.repository,
  });
  Future<void> call() {
    return repository.initnotification();
  }
}
