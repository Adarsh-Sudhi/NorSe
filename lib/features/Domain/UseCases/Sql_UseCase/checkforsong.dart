import 'package:norse/features/Data/DataSource/LocalDataSource/SqlQuerys/Sqllocaldatasource.dart';

class checkforsongusecase {
  final Sqldatasourcerepository repo;

  checkforsongusecase({required this.repo});
  Future<bool> call(String id) async {
    return repo.Checkifpresent(id);
  }
}
