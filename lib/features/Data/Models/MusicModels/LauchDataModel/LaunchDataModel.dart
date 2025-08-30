import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:norse/features/Domain/Entity/MusicEntity/LaunchDataEntity/LaunchDataEntity.dart';

part 'LaunchDataModel.freezed.dart';
part 'LaunchDataModel.g.dart';

@freezed
class launchdataModel extends launchdataEntity with _$launchdataModel {
  const factory launchdataModel(
    @JsonKey(name: 'id') final String id,
    @JsonKey(name: 'title') final String title,
    @JsonKey(name: 'type') final String type,
    @JsonKey(name: 'image') final String image,
    @JsonKey(name: 'subtitle') final String suntitle,
    @JsonKey(name: 'perma_url') final String albumurl,
  ) = _launchdataModel;

  factory launchdataModel.fromJson(Map<String, dynamic> json) =>
      _$launchdataModelFromJson(json);
}
