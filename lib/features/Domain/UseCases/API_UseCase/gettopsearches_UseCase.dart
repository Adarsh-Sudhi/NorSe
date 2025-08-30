import 'package:dartz/dartz.dart';
import '../../../../configs/Error/Errors.dart';
import '../../Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class GettopserachesUseCase {
  final APIRepository repo;
  GettopserachesUseCase({
    required this.repo,
  });
  Future<Either<Failures, List<launchdataEntity>>> call() async {
    return repo.topsearches();
  }
}
