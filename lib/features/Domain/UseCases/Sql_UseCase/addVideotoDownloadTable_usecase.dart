import 'package:norse/features/Domain/Repositorys/SqlReposiotory/Sqlreppository.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class AddVideosToDownLoadTableUseCase {
  final Sqlrepository repo;

  AddVideosToDownLoadTableUseCase({required this.repo});
  Future<bool> call(VideoOnlyStreamInfo videoOnlyStreamInfo,
    AudioOnlyStreamInfo audioOnlyStreamInfo,Map<String,dynamic> details) async {
    return repo.videoAndAudioDownload(
        videoOnlyStreamInfo, audioOnlyStreamInfo,details);
  }
}
