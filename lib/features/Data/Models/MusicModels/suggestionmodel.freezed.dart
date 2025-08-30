// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestionmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Suggestionmodel _$SuggestionmodelFromJson(Map<String, dynamic> json) {
  return _Suggestionmodel.fromJson(json);
}

/// @nodoc
mixin _$Suggestionmodel {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  List<Map<String, dynamic>> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'artists')
  List<dynamic> get artist => throw _privateConstructorUsedError;
  @JsonKey(name: 'downloadUrl')
  List<Map<String, dynamic>> get downloadurl =>
      throw _privateConstructorUsedError;

  /// Serializes this Suggestionmodel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Suggestionmodel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestionmodelCopyWith<Suggestionmodel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionmodelCopyWith<$Res> {
  factory $SuggestionmodelCopyWith(
          Suggestionmodel value, $Res Function(Suggestionmodel) then) =
      _$SuggestionmodelCopyWithImpl<$Res, Suggestionmodel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'image') List<Map<String, dynamic>> images,
      @JsonKey(name: 'artists') List<dynamic> artist,
      @JsonKey(name: 'downloadUrl') List<Map<String, dynamic>> downloadurl});
}

/// @nodoc
class _$SuggestionmodelCopyWithImpl<$Res, $Val extends Suggestionmodel>
    implements $SuggestionmodelCopyWith<$Res> {
  _$SuggestionmodelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Suggestionmodel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? images = null,
    Object? artist = null,
    Object? downloadurl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      downloadurl: null == downloadurl
          ? _value.downloadurl
          : downloadurl // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionmodelImplCopyWith<$Res>
    implements $SuggestionmodelCopyWith<$Res> {
  factory _$$SuggestionmodelImplCopyWith(_$SuggestionmodelImpl value,
          $Res Function(_$SuggestionmodelImpl) then) =
      __$$SuggestionmodelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'image') List<Map<String, dynamic>> images,
      @JsonKey(name: 'artists') List<dynamic> artist,
      @JsonKey(name: 'downloadUrl') List<Map<String, dynamic>> downloadurl});
}

/// @nodoc
class __$$SuggestionmodelImplCopyWithImpl<$Res>
    extends _$SuggestionmodelCopyWithImpl<$Res, _$SuggestionmodelImpl>
    implements _$$SuggestionmodelImplCopyWith<$Res> {
  __$$SuggestionmodelImplCopyWithImpl(
      _$SuggestionmodelImpl _value, $Res Function(_$SuggestionmodelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Suggestionmodel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? images = null,
    Object? artist = null,
    Object? downloadurl = null,
  }) {
    return _then(_$SuggestionmodelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      null == artist
          ? _value._artist
          : artist // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      null == downloadurl
          ? _value._downloadurl
          : downloadurl // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionmodelImpl implements _Suggestionmodel {
  _$SuggestionmodelImpl(
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'image') final List<Map<String, dynamic>> images,
      @JsonKey(name: 'artists') final List<dynamic> artist,
      @JsonKey(name: 'downloadUrl')
      final List<Map<String, dynamic>> downloadurl)
      : _images = images,
        _artist = artist,
        _downloadurl = downloadurl;

  factory _$SuggestionmodelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionmodelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'type')
  final String type;
  final List<Map<String, dynamic>> _images;
  @override
  @JsonKey(name: 'image')
  List<Map<String, dynamic>> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<dynamic> _artist;
  @override
  @JsonKey(name: 'artists')
  List<dynamic> get artist {
    if (_artist is EqualUnmodifiableListView) return _artist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artist);
  }

  final List<Map<String, dynamic>> _downloadurl;
  @override
  @JsonKey(name: 'downloadUrl')
  List<Map<String, dynamic>> get downloadurl {
    if (_downloadurl is EqualUnmodifiableListView) return _downloadurl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloadurl);
  }

  @override
  String toString() {
    return 'Suggestionmodel(id: $id, name: $name, type: $type, images: $images, artist: $artist, downloadurl: $downloadurl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionmodelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._artist, _artist) &&
            const DeepCollectionEquality()
                .equals(other._downloadurl, _downloadurl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_artist),
      const DeepCollectionEquality().hash(_downloadurl));

  /// Create a copy of Suggestionmodel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionmodelImplCopyWith<_$SuggestionmodelImpl> get copyWith =>
      __$$SuggestionmodelImplCopyWithImpl<_$SuggestionmodelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionmodelImplToJson(
      this,
    );
  }
}

abstract class _Suggestionmodel implements Suggestionmodel {
  factory _Suggestionmodel(
      @JsonKey(name: 'id') final String id,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'type') final String type,
      @JsonKey(name: 'image') final List<Map<String, dynamic>> images,
      @JsonKey(name: 'artists') final List<dynamic> artist,
      @JsonKey(name: 'downloadUrl')
      final List<Map<String, dynamic>> downloadurl) = _$SuggestionmodelImpl;

  factory _Suggestionmodel.fromJson(Map<String, dynamic> json) =
      _$SuggestionmodelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'image')
  List<Map<String, dynamic>> get images;
  @override
  @JsonKey(name: 'artists')
  List<dynamic> get artist;
  @override
  @JsonKey(name: 'downloadUrl')
  List<Map<String, dynamic>> get downloadurl;

  /// Create a copy of Suggestionmodel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionmodelImplCopyWith<_$SuggestionmodelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
