import 'package:dartz/dartz.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../configs/Error/Errors.dart';
import '../../Repositorys/PlatformRepository/PlatformRepository.dart';

class Getalbumsongsusecase {
  final PlatformRepository repo;

  Getalbumsongsusecase({required this.repo});
  Future<Either<Failures, List<SongModel>>> call(int id) async {
    return repo.getalbumsongs(id);
  }
}
