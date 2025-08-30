// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LaunchDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$launchdataModelImpl _$$launchdataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$launchdataModelImpl(
      json['id'] as String,
      json['title'] as String,
      json['type'] as String,
      json['image'] as String,
      json['subtitle'] as String,
      json['perma_url'] as String,
    );

Map<String, dynamic> _$$launchdataModelImplToJson(
        _$launchdataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'image': instance.image,
      'subtitle': instance.suntitle,
      'perma_url': instance.albumurl,
    };
