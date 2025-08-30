// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:norse/features/Domain/Repositorys/APIRepository/APIrepository.dart';
import '../../Entity/MusicEntity/AlbumDetailsEntity/AlbumDetailEntity.dart';

class GetSongSuggestionUseCase {
  final APIRepository repository;
  GetSongSuggestionUseCase({
    required this.repository,
  });
  Future<List<AlbumSongEntity>> call(String id){
    return repository.getsuggestion(id);
  }
}
