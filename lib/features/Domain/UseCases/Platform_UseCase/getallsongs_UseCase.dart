// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../configs/Error/Errors.dart';
import '../../Repositorys/PlatformRepository/PlatformRepository.dart';

class getallsongsUsecase {
  final PlatformRepository repository;
  getallsongsUsecase({
    required this.repository,
  });
  Future<Either<Failures, List<SongModel>>> call(String type) async {
    return repository.getallsongs();
  }
}
