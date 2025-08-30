// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topchartsmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopchartsModel _$TopchartsModelFromJson(Map<String, dynamic> json) {
  return _TopchartsModel.fromJson(json);
}

/// @nodoc
mixin _$TopchartsModel {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'perma_url')
  String get playlisturl => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;

  /// Serializes this TopchartsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopchartsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopchartsModelCopyWith<TopchartsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopchartsModelCopyWith<$Res> {
  factory $TopchartsModelCopyWith(
          TopchartsModel value, $Res Function(TopchartsModel) then) =
      _$TopchartsModelCopyWithImpl<$Res, TopchartsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'perma_url') String playlisturl,
      @JsonKey(name: 'type') String type});
}

/// @nodoc
class _$TopchartsModelCopyWithImpl<$Res, $Val extends TopchartsModel>
    implements $TopchartsModelCopyWith<$Res> {
  _$TopchartsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopchartsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? playlisturl = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      playlisturl: null == playlisturl
          ? _value.playlisturl
          : playlisturl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopchartsModelImplCopyWith<$Res>
    implements $TopchartsModelCopyWith<$Res> {
  factory _$$TopchartsModelImplCopyWith(_$TopchartsModelImpl value,
          $Res Function(_$TopchartsModelImpl) then) =
      __$$TopchartsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'perma_url') String playlisturl,
      @JsonKey(name: 'type') String type});
}

/// @nodoc
class __$$TopchartsModelImplCopyWithImpl<$Res>
    extends _$TopchartsModelCopyWithImpl<$Res, _$TopchartsModelImpl>
    implements _$$TopchartsModelImplCopyWith<$Res> {
  __$$TopchartsModelImplCopyWithImpl(
      _$TopchartsModelImpl _value, $Res Function(_$TopchartsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopchartsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? playlisturl = null,
    Object? type = null,
  }) {
    return _then(_$TopchartsModelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      null == playlisturl
          ? _value.playlisturl
          : playlisturl // ignore: cast_nullable_to_non_nullable
              as String,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopchartsModelImpl implements _TopchartsModel {
  const _$TopchartsModelImpl(
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'perma_url') this.playlisturl,
      @JsonKey(name: 'type') this.type);

  factory _$TopchartsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopchartsModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'perma_url')
  final String playlisturl;
  @override
  @JsonKey(name: 'type')
  final String type;

  @override
  String toString() {
    return 'TopchartsModel(id: $id, title: $title, image: $image, playlisturl: $playlisturl, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopchartsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.playlisturl, playlisturl) ||
                other.playlisturl == playlisturl) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, image, playlisturl, type);

  /// Create a copy of TopchartsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopchartsModelImplCopyWith<_$TopchartsModelImpl> get copyWith =>
      __$$TopchartsModelImplCopyWithImpl<_$TopchartsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopchartsModelImplToJson(
      this,
    );
  }
}

abstract class _TopchartsModel implements TopchartsModel {
  const factory _TopchartsModel(
      @JsonKey(name: 'id') final String id,
      @JsonKey(name: 'title') final String title,
      @JsonKey(name: 'image') final String image,
      @JsonKey(name: 'perma_url') final String playlisturl,
      @JsonKey(name: 'type') final String type) = _$TopchartsModelImpl;

  factory _TopchartsModel.fromJson(Map<String, dynamic> json) =
      _$TopchartsModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'perma_url')
  String get playlisturl;
  @override
  @JsonKey(name: 'type')
  String get type;

  /// Create a copy of TopchartsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopchartsModelImplCopyWith<_$TopchartsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
