import 'package:freezed_annotation/freezed_annotation.dart';

part 'Songmodel.freezed.dart';
part 'Songmodel.g.dart';

@freezed
class AlbumElement with _$AlbumElement {
  const AlbumElement._(); 
 const factory AlbumElement(
     @JsonKey(name: 'id') final String? id,
     @JsonKey(name: 'name') final String? name,
     @JsonKey(name: 'year')final String? year,
     @JsonKey(name: 'type')final String? type,
     @JsonKey(name: 'language')final String? language,
     @JsonKey(name: 'primaryArtists') final List primaryArtists,
     @JsonKey(name: 'url')final String? url,
     @JsonKey(name: 'image' )final List images,
  ) = _AlbumElement ;
  factory AlbumElement.fromJson(Map<String, dynamic> json) => _$AlbumElementFromJson(json);
}