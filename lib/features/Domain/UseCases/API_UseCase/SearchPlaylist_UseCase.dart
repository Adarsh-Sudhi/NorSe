// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class SearchPlaylistUseCase {
  final APIRepository repository;
  SearchPlaylistUseCase({
    required this.repository,
  });
  Future<List<launchdataEntity>> call(String query) async {
    return repository.getsearchPlaylists(query);
  }
}
