// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import '../../../../configs/Error/Errors.dart';
import '../../Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class gettopalbumsUseCase {
  final APIRepository repository;
  gettopalbumsUseCase({
    required this.repository,
  });
  Future<Either<Failures, List<launchdataEntity>>> call() async {
    return repository.gettopalbums();
  }
}
