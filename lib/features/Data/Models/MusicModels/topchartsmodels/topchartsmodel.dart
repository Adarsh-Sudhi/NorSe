import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/TopChartsEntity/topchartentity.dart';

part 'topchartsmodel.freezed.dart';
part 'topchartsmodel.g.dart';

@freezed
class TopchartsModel extends topchartsEntity with _$TopchartsModel {
  const factory TopchartsModel(
    @JsonKey(name: 'id') final String id,
    @JsonKey(name: 'title') final String title,
    @JsonKey(name: 'image') final String image,
    @JsonKey(name: 'perma_url') final String playlisturl,
    @JsonKey(name: 'type') final String type,
  ) = _TopchartsModel;

  factory TopchartsModel.fromJson(Map<String, dynamic> json) =>
      _$TopchartsModelFromJson(json);
}
