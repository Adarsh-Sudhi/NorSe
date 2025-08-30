import 'package:dartz/dartz.dart';
import 'package:norse/features/Domain/Repositorys/APIRepository/APIrepository.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../configs/Error/Errors.dart';

class GetstreamManifestusecase {
  final APIRepository repository;
  GetstreamManifestusecase({
    required this.repository,
  });
  Future<Either<Failures, List<VideoOnlyStreamInfo>>> call(String url) async {
    return repository.getManifest(url);
  }
}
