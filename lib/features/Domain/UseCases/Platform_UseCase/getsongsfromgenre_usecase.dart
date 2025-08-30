import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/PlatformRepository/PlatformRepository.dart';
import 'package:on_audio_query/on_audio_query.dart';

class GetSongsFromGenreUseCase {
  final PlatformRepository repository;

  GetSongsFromGenreUseCase(this.repository);

  Future<Either<Failures, List<SongModel>>> call(int id) {
    return repository.getSongsFromGenre(id);
  }
}
