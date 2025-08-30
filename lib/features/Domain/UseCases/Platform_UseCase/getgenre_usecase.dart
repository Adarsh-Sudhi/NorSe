import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/PlatformRepository/PlatformRepository.dart';
import 'package:on_audio_query/on_audio_query.dart';

class GetGenreUseCase {
  final PlatformRepository repository;

  GetGenreUseCase({required this.repository});
  Future<Either<Failures, List<GenreModel>>> call() {
    return repository.getGenre();
  }
}
