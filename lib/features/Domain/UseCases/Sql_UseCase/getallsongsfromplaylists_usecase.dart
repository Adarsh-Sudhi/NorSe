// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';

class Getallsongsfromplaylistsusecase {
  final Sqlrepository Repositorys;
  Getallsongsfromplaylistsusecase({
    required this.Repositorys,
  });
  Future<Either<Failures, List<Map<String, dynamic>>>> call(String playlistid) {
    return Repositorys.getallsongsfromplaylists(playlistid);
  }
}
