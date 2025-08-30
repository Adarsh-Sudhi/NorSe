// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Songmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumElementImpl _$$AlbumElementImplFromJson(Map<String, dynamic> json) =>
    _$AlbumElementImpl(
      json['id'] as String?,
      json['name'] as String?,
      json['year'] as String?,
      json['type'] as String?,
      json['language'] as String?,
      json['primaryArtists'] as List<dynamic>,
      json['url'] as String?,
      json['image'] as List<dynamic>,
    );

Map<String, dynamic> _$$AlbumElementImplToJson(_$AlbumElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'type': instance.type,
      'language': instance.language,
      'primaryArtists': instance.primaryArtists,
      'url': instance.url,
      'image': instance.images,
    };
