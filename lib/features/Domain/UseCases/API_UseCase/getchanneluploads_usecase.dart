import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/APIRepository/APIrepository.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class GetChannelUploads {
  final APIRepository repo;

  GetChannelUploads(this.repo);

  Future<Either<Failures, ChannelUploadsList>> call(dynamic channelid) {
    return repo.getchanneluploads(channelid);
  }
}
