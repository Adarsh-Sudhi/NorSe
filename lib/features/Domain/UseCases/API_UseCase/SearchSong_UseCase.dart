
import '../../Entity/MusicEntity/SearchSongEntity/SearchEntity.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class SearchSongUseCase {
  final APIRepository repository;
  SearchSongUseCase({
    required this.repository,
  });
  Future<List<SearchEntity>>call(String query)async{
    return repository.SearchSong(query);
  }
}
