import 'package:dartz/dartz.dart';
import 'package:norse/features/Domain/Repositorys/APIRepository/APIrepository.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../configs/Error/Errors.dart';

class Getaudiostreamusecase {
  final APIRepository repository;
  const Getaudiostreamusecase({
    required this.repository,
  });
  Future<Either<Failures, List<AudioOnlyStreamInfo>>> call(String id) async {
    return repository.getstream(id);
  }
}
