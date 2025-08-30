import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/APIRepository/APIrepository.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class GetyoutubeRelatedVideosUseCase {
  final APIRepository repository;

  GetyoutubeRelatedVideosUseCase({required this.repository});
  Future<Either<Failures, RelatedVideosList>> call(String video) async {
    return repository.getrelatedvideos(video);
  }
}
