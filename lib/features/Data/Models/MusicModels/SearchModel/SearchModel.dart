import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/SearchSongEntity/SearchEntity.dart';

part 'SearchModel.freezed.dart';
part 'SearchModel.g.dart';

@freezed
class SearchModel extends SearchEntity with _$SearchModel {
  const factory SearchModel(
    @JsonKey(name: 'id') final String id,
    @JsonKey(name: 'name') final String name,
    @JsonKey(name: 'year') final String year,
    @JsonKey(name: 'image') final String image,
    @JsonKey(name: 'primaryArtists') final String primaryArtists,
    @JsonKey(name: 'downloadUrl') final String downloadUrl,
    @JsonKey(name: 'more_info') final Map<dynamic, dynamic> moreinfo,
  ) = _SearchModel;
  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}
