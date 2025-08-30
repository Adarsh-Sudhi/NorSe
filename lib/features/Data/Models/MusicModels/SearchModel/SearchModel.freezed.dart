// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SearchModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return _SearchModel.fromJson(json);
}

/// @nodoc
mixin _$SearchModel {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  String get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'primaryArtists')
  String get primaryArtists => throw _privateConstructorUsedError;
  @JsonKey(name: 'downloadUrl')
  String get downloadUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'more_info')
  Map<dynamic, dynamic> get moreinfo => throw _privateConstructorUsedError;

  /// Serializes this SearchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchModelCopyWith<SearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchModelCopyWith<$Res> {
  factory $SearchModelCopyWith(
          SearchModel value, $Res Function(SearchModel) then) =
      _$SearchModelCopyWithImpl<$Res, SearchModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'year') String year,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'primaryArtists') String primaryArtists,
      @JsonKey(name: 'downloadUrl') String downloadUrl,
      @JsonKey(name: 'more_info') Map<dynamic, dynamic> moreinfo});
}

/// @nodoc
class _$SearchModelCopyWithImpl<$Res, $Val extends SearchModel>
    implements $SearchModelCopyWith<$Res> {
  _$SearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? year = null,
    Object? image = null,
    Object? primaryArtists = null,
    Object? downloadUrl = null,
    Object? moreinfo = null,
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
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      primaryArtists: null == primaryArtists
          ? _value.primaryArtists
          : primaryArtists // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      moreinfo: null == moreinfo
          ? _value.moreinfo
          : moreinfo // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchModelImplCopyWith<$Res>
    implements $SearchModelCopyWith<$Res> {
  factory _$$SearchModelImplCopyWith(
          _$SearchModelImpl value, $Res Function(_$SearchModelImpl) then) =
      __$$SearchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'year') String year,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'primaryArtists') String primaryArtists,
      @JsonKey(name: 'downloadUrl') String downloadUrl,
      @JsonKey(name: 'more_info') Map<dynamic, dynamic> moreinfo});
}

/// @nodoc
class __$$SearchModelImplCopyWithImpl<$Res>
    extends _$SearchModelCopyWithImpl<$Res, _$SearchModelImpl>
    implements _$$SearchModelImplCopyWith<$Res> {
  __$$SearchModelImplCopyWithImpl(
      _$SearchModelImpl _value, $Res Function(_$SearchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? year = null,
    Object? image = null,
    Object? primaryArtists = null,
    Object? downloadUrl = null,
    Object? moreinfo = null,
  }) {
    return _then(_$SearchModelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      null == primaryArtists
          ? _value.primaryArtists
          : primaryArtists // ignore: cast_nullable_to_non_nullable
              as String,
      null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      null == moreinfo
          ? _value._moreinfo
          : moreinfo // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchModelImpl implements _SearchModel {
  const _$SearchModelImpl(
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'year') this.year,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'primaryArtists') this.primaryArtists,
      @JsonKey(name: 'downloadUrl') this.downloadUrl,
      @JsonKey(name: 'more_info') final Map<dynamic, dynamic> moreinfo)
      : _moreinfo = moreinfo;

  factory _$SearchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'year')
  final String year;
  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'primaryArtists')
  final String primaryArtists;
  @override
  @JsonKey(name: 'downloadUrl')
  final String downloadUrl;
  final Map<dynamic, dynamic> _moreinfo;
  @override
  @JsonKey(name: 'more_info')
  Map<dynamic, dynamic> get moreinfo {
    if (_moreinfo is EqualUnmodifiableMapView) return _moreinfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_moreinfo);
  }

  @override
  String toString() {
    return 'SearchModel(id: $id, name: $name, year: $year, image: $image, primaryArtists: $primaryArtists, downloadUrl: $downloadUrl, moreinfo: $moreinfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.primaryArtists, primaryArtists) ||
                other.primaryArtists == primaryArtists) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            const DeepCollectionEquality().equals(other._moreinfo, _moreinfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      year,
      image,
      primaryArtists,
      downloadUrl,
      const DeepCollectionEquality().hash(_moreinfo));

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchModelImplCopyWith<_$SearchModelImpl> get copyWith =>
      __$$SearchModelImplCopyWithImpl<_$SearchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchModelImplToJson(
      this,
    );
  }
}

abstract class _SearchModel implements SearchModel {
  const factory _SearchModel(
          @JsonKey(name: 'id') final String id,
          @JsonKey(name: 'name') final String name,
          @JsonKey(name: 'year') final String year,
          @JsonKey(name: 'image') final String image,
          @JsonKey(name: 'primaryArtists') final String primaryArtists,
          @JsonKey(name: 'downloadUrl') final String downloadUrl,
          @JsonKey(name: 'more_info') final Map<dynamic, dynamic> moreinfo) =
      _$SearchModelImpl;

  factory _SearchModel.fromJson(Map<String, dynamic> json) =
      _$SearchModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'year')
  String get year;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'primaryArtists')
  String get primaryArtists;
  @override
  @JsonKey(name: 'downloadUrl')
  String get downloadUrl;
  @override
  @JsonKey(name: 'more_info')
  Map<dynamic, dynamic> get moreinfo;

  /// Create a copy of SearchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchModelImplCopyWith<_$SearchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
