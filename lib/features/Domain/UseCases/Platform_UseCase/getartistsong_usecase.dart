// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:norse/features/Domain/Repositorys/PlatformRepository/PlatformRepository.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../configs/Error/Errors.dart';

class GetArtistSongUSeCase {
  final PlatformRepository repository;
  GetArtistSongUSeCase({
    required this.repository,
  });
  Future<Either<Failures,List<SongModel>>>call(int id)async{
    return repository.getSongsFromArtist(id);
  }
}
