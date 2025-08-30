import '../../Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class GetSearchedAlbumsUseCase {
  final APIRepository repository;
  GetSearchedAlbumsUseCase({
    required this.repository,
  });
  Future<List<AlbumSongEntity>> call(String Query) {
    return repository.GetSearchedAlbums(Query);
  }
}
