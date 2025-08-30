// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchModelImpl _$$SearchModelImplFromJson(Map<String, dynamic> json) =>
    _$SearchModelImpl(
      json['id'] as String,
      json['name'] as String,
      json['year'] as String,
      json['image'] as String,
      json['primaryArtists'] as String,
      json['downloadUrl'] as String,
      json['more_info'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$SearchModelImplToJson(_$SearchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'image': instance.image,
      'primaryArtists': instance.primaryArtists,
      'downloadUrl': instance.downloadUrl,
      'more_info': instance.moreinfo,
    };
