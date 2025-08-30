// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestionmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestionmodelImpl _$$SuggestionmodelImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestionmodelImpl(
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      (json['image'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      json['artists'] as List<dynamic>,
      (json['downloadUrl'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$SuggestionmodelImplToJson(
        _$SuggestionmodelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'image': instance.images,
      'artists': instance.artist,
      'downloadUrl': instance.downloadurl,
    };
