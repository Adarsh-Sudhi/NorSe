// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import '../../../../configs/Error/Errors.dart';
import '../../Entity/MusicEntity/TopChartsEntity/topchartentity.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class GettopChatsUseCase {
  final APIRepository repo;
  GettopChatsUseCase({
    required this.repo,
  });
  Future<Either<Failures, List<topchartsEntity>>> call() async {
    return repo.topcharts();
  }
}
