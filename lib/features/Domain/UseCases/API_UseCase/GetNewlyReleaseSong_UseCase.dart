import '../../Entity/MusicEntity/SearchSongEntity/SearchEntity.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class GetSongsUseCase {
  final APIRepository repository;
  GetSongsUseCase({
    required this.repository,
  });

  Future<SearchEntity> call(String Songurl) async {
    return repository.GetSong(Songurl);
  }
}
