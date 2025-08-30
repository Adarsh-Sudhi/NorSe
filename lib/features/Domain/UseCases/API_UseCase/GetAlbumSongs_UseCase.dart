// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';
import '../../Repositorys/APIRepository/APIrepository.dart';

class GetAlbumSongsUseCase {
  final APIRepository repository;
  GetAlbumSongsUseCase({
    required this.repository,
  });
  Future<List<AlbumSongEntity>> call(String albumurl) async {
    return repository.getAlbumSongs(albumurl);
  }
}
