import 'package:dartz/dartz.dart';
import 'package:norse/configs/Error/Errors.dart';
import 'package:norse/features/Data/DataSource/LocalDataSource/SqlQuerys/Sqllocaldatasource.dart';
import '../../Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';

class Addtolibraryusecase {
  final Sqldatasourcerepository repo;

  Addtolibraryusecase({required this.repo});

  Future<Either<Failures, String>> call(String type, AlbumElements song) async {
    return repo.addtolibrary(type, song);
  }
}
