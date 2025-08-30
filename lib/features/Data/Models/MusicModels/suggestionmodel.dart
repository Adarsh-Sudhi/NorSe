
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestionmodel.freezed.dart';
part 'suggestionmodel.g.dart';

@freezed
class Suggestionmodel with _$Suggestionmodel {
  factory Suggestionmodel(
    @JsonKey(name: 'id') final String id,
    @JsonKey(name: 'name') final String name,
    @JsonKey(name: 'type') final String type,
    @JsonKey(name: 'image') final List<Map<String, dynamic>> images,
    @JsonKey(name: 'artists') final List<dynamic> artist,
    @JsonKey(name: 'downloadUrl') final List<Map<String, dynamic>> downloadurl,
  ) = _Suggestionmodel;
	
  factory Suggestionmodel.fromJson(Map<String, dynamic> json) =>
			_$SuggestionmodelFromJson(json);
      
}
