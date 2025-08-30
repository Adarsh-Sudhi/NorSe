// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:norse/features/Domain/Repositorys/PlatformRepository/PlatformRepository.dart';

class DeleteSongFromDeviceUseCase {
  final PlatformRepository repo;
  DeleteSongFromDeviceUseCase({
    required this.repo,
  });
  Future<bool>call(String path)async{
    return repo.deletesongfromdevice(path);
  }
}
