// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../configs/Error/Errors.dart';
import '../../Entity/MusicEntity/PlaylistEntity/PlaylistEntity.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class getplaylistdetailsUSeCase {
  final APIRepository repository;
  getplaylistdetailsUSeCase({
    required this.repository,
  });
  Future<Either<Failures, List<playlistEntity>>> call(String id) async {
    return repository.getplaylistdetails(id);
  }
}
