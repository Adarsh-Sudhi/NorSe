// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localdata_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocaldataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistname) createPlaylist,
    required TResult Function(List<Map<String, dynamic>> newitem)
        updateplaylist,
    required TResult Function(String id) removefromdownloads,
    required TResult Function(AlbumElements song) addtorecent,
    required TResult Function(String id) removefromRecents,
    required TResult Function() getDownloads,
    required TResult Function() clearalldownloads,
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistname)? createPlaylist,
    TResult? Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult? Function(String id)? removefromdownloads,
    TResult? Function(AlbumElements song)? addtorecent,
    TResult? Function(String id)? removefromRecents,
    TResult? Function()? getDownloads,
    TResult? Function()? clearalldownloads,
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistname)? createPlaylist,
    TResult Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult Function(String id)? removefromdownloads,
    TResult Function(AlbumElements song)? addtorecent,
    TResult Function(String id)? removefromRecents,
    TResult Function()? getDownloads,
    TResult Function()? clearalldownloads,
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Createplaylist value) createPlaylist,
    required TResult Function(_Updateplaylist value) updateplaylist,
    required TResult Function(_RemovefromDownloads value) removefromdownloads,
    required TResult Function(_Addtorecent value) addtorecent,
    required TResult Function(_Removefromrecents value) removefromRecents,
    required TResult Function(_GetDownloads value) getDownloads,
    required TResult Function(_Clearalldownloads value) clearalldownloads,
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Createplaylist value)? createPlaylist,
    TResult? Function(_Updateplaylist value)? updateplaylist,
    TResult? Function(_RemovefromDownloads value)? removefromdownloads,
    TResult? Function(_Addtorecent value)? addtorecent,
    TResult? Function(_Removefromrecents value)? removefromRecents,
    TResult? Function(_GetDownloads value)? getDownloads,
    TResult? Function(_Clearalldownloads value)? clearalldownloads,
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Createplaylist value)? createPlaylist,
    TResult Function(_Updateplaylist value)? updateplaylist,
    TResult Function(_RemovefromDownloads value)? removefromdownloads,
    TResult Function(_Addtorecent value)? addtorecent,
    TResult Function(_Removefromrecents value)? removefromRecents,
    TResult Function(_GetDownloads value)? getDownloads,
    TResult Function(_Clearalldownloads value)? clearalldownloads,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaldataEventCopyWith<$Res> {
  factory $LocaldataEventCopyWith(
          LocaldataEvent value, $Res Function(LocaldataEvent) then) =
      _$LocaldataEventCopyWithImpl<$Res, LocaldataEvent>;
}

/// @nodoc
class _$LocaldataEventCopyWithImpl<$Res, $Val extends LocaldataEvent>
    implements $LocaldataEventCopyWith<$Res> {
  _$LocaldataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateplaylistImplCopyWith<$Res> {
  factory _$$CreateplaylistImplCopyWith(_$CreateplaylistImpl value,
          $Res Function(_$CreateplaylistImpl) then) =
      __$$CreateplaylistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playlistname});
}

/// @nodoc
class __$$CreateplaylistImplCopyWithImpl<$Res>
    extends _$LocaldataEventCopyWithImpl<$Res, _$CreateplaylistImpl>
    implements _$$CreateplaylistImplCopyWith<$Res> {
  __$$CreateplaylistImplCopyWithImpl(
      _$CreateplaylistImpl _value, $Res Function(_$CreateplaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlistname = null,
  }) {
    return _then(_$CreateplaylistImpl(
      null == playlistname
          ? _value.playlistname
          : playlistname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateplaylistImpl
    with DiagnosticableTreeMixin
    implements _Createplaylist {
  const _$CreateplaylistImpl(this.playlistname);

  @override
  final String playlistname;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataEvent.createPlaylist(playlistname: $playlistname)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocaldataEvent.createPlaylist'))
      ..add(DiagnosticsProperty('playlistname', playlistname));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateplaylistImpl &&
            (identical(other.playlistname, playlistname) ||
                other.playlistname == playlistname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistname);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateplaylistImplCopyWith<_$CreateplaylistImpl> get copyWith =>
      __$$CreateplaylistImplCopyWithImpl<_$CreateplaylistImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistname) createPlaylist,
    required TResult Function(List<Map<String, dynamic>> newitem)
        updateplaylist,
    required TResult Function(String id) removefromdownloads,
    required TResult Function(AlbumElements song) addtorecent,
    required TResult Function(String id) removefromRecents,
    required TResult Function() getDownloads,
    required TResult Function() clearalldownloads,
    required TResult Function() started,
  }) {
    return createPlaylist(playlistname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistname)? createPlaylist,
    TResult? Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult? Function(String id)? removefromdownloads,
    TResult? Function(AlbumElements song)? addtorecent,
    TResult? Function(String id)? removefromRecents,
    TResult? Function()? getDownloads,
    TResult? Function()? clearalldownloads,
    TResult? Function()? started,
  }) {
    return createPlaylist?.call(playlistname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistname)? createPlaylist,
    TResult Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult Function(String id)? removefromdownloads,
    TResult Function(AlbumElements song)? addtorecent,
    TResult Function(String id)? removefromRecents,
    TResult Function()? getDownloads,
    TResult Function()? clearalldownloads,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (createPlaylist != null) {
      return createPlaylist(playlistname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Createplaylist value) createPlaylist,
    required TResult Function(_Updateplaylist value) updateplaylist,
    required TResult Function(_RemovefromDownloads value) removefromdownloads,
    required TResult Function(_Addtorecent value) addtorecent,
    required TResult Function(_Removefromrecents value) removefromRecents,
    required TResult Function(_GetDownloads value) getDownloads,
    required TResult Function(_Clearalldownloads value) clearalldownloads,
    required TResult Function(_Started value) started,
  }) {
    return createPlaylist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Createplaylist value)? createPlaylist,
    TResult? Function(_Updateplaylist value)? updateplaylist,
    TResult? Function(_RemovefromDownloads value)? removefromdownloads,
    TResult? Function(_Addtorecent value)? addtorecent,
    TResult? Function(_Removefromrecents value)? removefromRecents,
    TResult? Function(_GetDownloads value)? getDownloads,
    TResult? Function(_Clearalldownloads value)? clearalldownloads,
    TResult? Function(_Started value)? started,
  }) {
    return createPlaylist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Createplaylist value)? createPlaylist,
    TResult Function(_Updateplaylist value)? updateplaylist,
    TResult Function(_RemovefromDownloads value)? removefromdownloads,
    TResult Function(_Addtorecent value)? addtorecent,
    TResult Function(_Removefromrecents value)? removefromRecents,
    TResult Function(_GetDownloads value)? getDownloads,
    TResult Function(_Clearalldownloads value)? clearalldownloads,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (createPlaylist != null) {
      return createPlaylist(this);
    }
    return orElse();
  }
}

abstract class _Createplaylist implements LocaldataEvent {
  const factory _Createplaylist(final String playlistname) =
      _$CreateplaylistImpl;

  String get playlistname;

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateplaylistImplCopyWith<_$CreateplaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateplaylistImplCopyWith<$Res> {
  factory _$$UpdateplaylistImplCopyWith(_$UpdateplaylistImpl value,
          $Res Function(_$UpdateplaylistImpl) then) =
      __$$UpdateplaylistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> newitem});
}

/// @nodoc
class __$$UpdateplaylistImplCopyWithImpl<$Res>
    extends _$LocaldataEventCopyWithImpl<$Res, _$UpdateplaylistImpl>
    implements _$$UpdateplaylistImplCopyWith<$Res> {
  __$$UpdateplaylistImplCopyWithImpl(
      _$UpdateplaylistImpl _value, $Res Function(_$UpdateplaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newitem = null,
  }) {
    return _then(_$UpdateplaylistImpl(
      null == newitem
          ? _value._newitem
          : newitem // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$UpdateplaylistImpl
    with DiagnosticableTreeMixin
    implements _Updateplaylist {
  const _$UpdateplaylistImpl(final List<Map<String, dynamic>> newitem)
      : _newitem = newitem;

  final List<Map<String, dynamic>> _newitem;
  @override
  List<Map<String, dynamic>> get newitem {
    if (_newitem is EqualUnmodifiableListView) return _newitem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newitem);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataEvent.updateplaylist(newitem: $newitem)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocaldataEvent.updateplaylist'))
      ..add(DiagnosticsProperty('newitem', newitem));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateplaylistImpl &&
            const DeepCollectionEquality().equals(other._newitem, _newitem));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_newitem));

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateplaylistImplCopyWith<_$UpdateplaylistImpl> get copyWith =>
      __$$UpdateplaylistImplCopyWithImpl<_$UpdateplaylistImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistname) createPlaylist,
    required TResult Function(List<Map<String, dynamic>> newitem)
        updateplaylist,
    required TResult Function(String id) removefromdownloads,
    required TResult Function(AlbumElements song) addtorecent,
    required TResult Function(String id) removefromRecents,
    required TResult Function() getDownloads,
    required TResult Function() clearalldownloads,
    required TResult Function() started,
  }) {
    return updateplaylist(newitem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistname)? createPlaylist,
    TResult? Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult? Function(String id)? removefromdownloads,
    TResult? Function(AlbumElements song)? addtorecent,
    TResult? Function(String id)? removefromRecents,
    TResult? Function()? getDownloads,
    TResult? Function()? clearalldownloads,
    TResult? Function()? started,
  }) {
    return updateplaylist?.call(newitem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistname)? createPlaylist,
    TResult Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult Function(String id)? removefromdownloads,
    TResult Function(AlbumElements song)? addtorecent,
    TResult Function(String id)? removefromRecents,
    TResult Function()? getDownloads,
    TResult Function()? clearalldownloads,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (updateplaylist != null) {
      return updateplaylist(newitem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Createplaylist value) createPlaylist,
    required TResult Function(_Updateplaylist value) updateplaylist,
    required TResult Function(_RemovefromDownloads value) removefromdownloads,
    required TResult Function(_Addtorecent value) addtorecent,
    required TResult Function(_Removefromrecents value) removefromRecents,
    required TResult Function(_GetDownloads value) getDownloads,
    required TResult Function(_Clearalldownloads value) clearalldownloads,
    required TResult Function(_Started value) started,
  }) {
    return updateplaylist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Createplaylist value)? createPlaylist,
    TResult? Function(_Updateplaylist value)? updateplaylist,
    TResult? Function(_RemovefromDownloads value)? removefromdownloads,
    TResult? Function(_Addtorecent value)? addtorecent,
    TResult? Function(_Removefromrecents value)? removefromRecents,
    TResult? Function(_GetDownloads value)? getDownloads,
    TResult? Function(_Clearalldownloads value)? clearalldownloads,
    TResult? Function(_Started value)? started,
  }) {
    return updateplaylist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Createplaylist value)? createPlaylist,
    TResult Function(_Updateplaylist value)? updateplaylist,
    TResult Function(_RemovefromDownloads value)? removefromdownloads,
    TResult Function(_Addtorecent value)? addtorecent,
    TResult Function(_Removefromrecents value)? removefromRecents,
    TResult Function(_GetDownloads value)? getDownloads,
    TResult Function(_Clearalldownloads value)? clearalldownloads,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (updateplaylist != null) {
      return updateplaylist(this);
    }
    return orElse();
  }
}

abstract class _Updateplaylist implements LocaldataEvent {
  const factory _Updateplaylist(final List<Map<String, dynamic>> newitem) =
      _$UpdateplaylistImpl;

  List<Map<String, dynamic>> get newitem;

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateplaylistImplCopyWith<_$UpdateplaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovefromDownloadsImplCopyWith<$Res> {
  factory _$$RemovefromDownloadsImplCopyWith(_$RemovefromDownloadsImpl value,
          $Res Function(_$RemovefromDownloadsImpl) then) =
      __$$RemovefromDownloadsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemovefromDownloadsImplCopyWithImpl<$Res>
    extends _$LocaldataEventCopyWithImpl<$Res, _$RemovefromDownloadsImpl>
    implements _$$RemovefromDownloadsImplCopyWith<$Res> {
  __$$RemovefromDownloadsImplCopyWithImpl(_$RemovefromDownloadsImpl _value,
      $Res Function(_$RemovefromDownloadsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemovefromDownloadsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemovefromDownloadsImpl
    with DiagnosticableTreeMixin
    implements _RemovefromDownloads {
  const _$RemovefromDownloadsImpl(this.id);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataEvent.removefromdownloads(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocaldataEvent.removefromdownloads'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovefromDownloadsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovefromDownloadsImplCopyWith<_$RemovefromDownloadsImpl> get copyWith =>
      __$$RemovefromDownloadsImplCopyWithImpl<_$RemovefromDownloadsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistname) createPlaylist,
    required TResult Function(List<Map<String, dynamic>> newitem)
        updateplaylist,
    required TResult Function(String id) removefromdownloads,
    required TResult Function(AlbumElements song) addtorecent,
    required TResult Function(String id) removefromRecents,
    required TResult Function() getDownloads,
    required TResult Function() clearalldownloads,
    required TResult Function() started,
  }) {
    return removefromdownloads(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistname)? createPlaylist,
    TResult? Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult? Function(String id)? removefromdownloads,
    TResult? Function(AlbumElements song)? addtorecent,
    TResult? Function(String id)? removefromRecents,
    TResult? Function()? getDownloads,
    TResult? Function()? clearalldownloads,
    TResult? Function()? started,
  }) {
    return removefromdownloads?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistname)? createPlaylist,
    TResult Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult Function(String id)? removefromdownloads,
    TResult Function(AlbumElements song)? addtorecent,
    TResult Function(String id)? removefromRecents,
    TResult Function()? getDownloads,
    TResult Function()? clearalldownloads,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (removefromdownloads != null) {
      return removefromdownloads(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Createplaylist value) createPlaylist,
    required TResult Function(_Updateplaylist value) updateplaylist,
    required TResult Function(_RemovefromDownloads value) removefromdownloads,
    required TResult Function(_Addtorecent value) addtorecent,
    required TResult Function(_Removefromrecents value) removefromRecents,
    required TResult Function(_GetDownloads value) getDownloads,
    required TResult Function(_Clearalldownloads value) clearalldownloads,
    required TResult Function(_Started value) started,
  }) {
    return removefromdownloads(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Createplaylist value)? createPlaylist,
    TResult? Function(_Updateplaylist value)? updateplaylist,
    TResult? Function(_RemovefromDownloads value)? removefromdownloads,
    TResult? Function(_Addtorecent value)? addtorecent,
    TResult? Function(_Removefromrecents value)? removefromRecents,
    TResult? Function(_GetDownloads value)? getDownloads,
    TResult? Function(_Clearalldownloads value)? clearalldownloads,
    TResult? Function(_Started value)? started,
  }) {
    return removefromdownloads?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Createplaylist value)? createPlaylist,
    TResult Function(_Updateplaylist value)? updateplaylist,
    TResult Function(_RemovefromDownloads value)? removefromdownloads,
    TResult Function(_Addtorecent value)? addtorecent,
    TResult Function(_Removefromrecents value)? removefromRecents,
    TResult Function(_GetDownloads value)? getDownloads,
    TResult Function(_Clearalldownloads value)? clearalldownloads,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (removefromdownloads != null) {
      return removefromdownloads(this);
    }
    return orElse();
  }
}

abstract class _RemovefromDownloads implements LocaldataEvent {
  const factory _RemovefromDownloads(final String id) =
      _$RemovefromDownloadsImpl;

  String get id;

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemovefromDownloadsImplCopyWith<_$RemovefromDownloadsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddtorecentImplCopyWith<$Res> {
  factory _$$AddtorecentImplCopyWith(
          _$AddtorecentImpl value, $Res Function(_$AddtorecentImpl) then) =
      __$$AddtorecentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AlbumElements song});
}

/// @nodoc
class __$$AddtorecentImplCopyWithImpl<$Res>
    extends _$LocaldataEventCopyWithImpl<$Res, _$AddtorecentImpl>
    implements _$$AddtorecentImplCopyWith<$Res> {
  __$$AddtorecentImplCopyWithImpl(
      _$AddtorecentImpl _value, $Res Function(_$AddtorecentImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
  }) {
    return _then(_$AddtorecentImpl(
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as AlbumElements,
    ));
  }
}

/// @nodoc

class _$AddtorecentImpl with DiagnosticableTreeMixin implements _Addtorecent {
  const _$AddtorecentImpl(this.song);

  @override
  final AlbumElements song;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataEvent.addtorecent(song: $song)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocaldataEvent.addtorecent'))
      ..add(DiagnosticsProperty('song', song));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddtorecentImpl &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddtorecentImplCopyWith<_$AddtorecentImpl> get copyWith =>
      __$$AddtorecentImplCopyWithImpl<_$AddtorecentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistname) createPlaylist,
    required TResult Function(List<Map<String, dynamic>> newitem)
        updateplaylist,
    required TResult Function(String id) removefromdownloads,
    required TResult Function(AlbumElements song) addtorecent,
    required TResult Function(String id) removefromRecents,
    required TResult Function() getDownloads,
    required TResult Function() clearalldownloads,
    required TResult Function() started,
  }) {
    return addtorecent(song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistname)? createPlaylist,
    TResult? Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult? Function(String id)? removefromdownloads,
    TResult? Function(AlbumElements song)? addtorecent,
    TResult? Function(String id)? removefromRecents,
    TResult? Function()? getDownloads,
    TResult? Function()? clearalldownloads,
    TResult? Function()? started,
  }) {
    return addtorecent?.call(song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistname)? createPlaylist,
    TResult Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult Function(String id)? removefromdownloads,
    TResult Function(AlbumElements song)? addtorecent,
    TResult Function(String id)? removefromRecents,
    TResult Function()? getDownloads,
    TResult Function()? clearalldownloads,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (addtorecent != null) {
      return addtorecent(song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Createplaylist value) createPlaylist,
    required TResult Function(_Updateplaylist value) updateplaylist,
    required TResult Function(_RemovefromDownloads value) removefromdownloads,
    required TResult Function(_Addtorecent value) addtorecent,
    required TResult Function(_Removefromrecents value) removefromRecents,
    required TResult Function(_GetDownloads value) getDownloads,
    required TResult Function(_Clearalldownloads value) clearalldownloads,
    required TResult Function(_Started value) started,
  }) {
    return addtorecent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Createplaylist value)? createPlaylist,
    TResult? Function(_Updateplaylist value)? updateplaylist,
    TResult? Function(_RemovefromDownloads value)? removefromdownloads,
    TResult? Function(_Addtorecent value)? addtorecent,
    TResult? Function(_Removefromrecents value)? removefromRecents,
    TResult? Function(_GetDownloads value)? getDownloads,
    TResult? Function(_Clearalldownloads value)? clearalldownloads,
    TResult? Function(_Started value)? started,
  }) {
    return addtorecent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Createplaylist value)? createPlaylist,
    TResult Function(_Updateplaylist value)? updateplaylist,
    TResult Function(_RemovefromDownloads value)? removefromdownloads,
    TResult Function(_Addtorecent value)? addtorecent,
    TResult Function(_Removefromrecents value)? removefromRecents,
    TResult Function(_GetDownloads value)? getDownloads,
    TResult Function(_Clearalldownloads value)? clearalldownloads,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (addtorecent != null) {
      return addtorecent(this);
    }
    return orElse();
  }
}

abstract class _Addtorecent implements LocaldataEvent {
  const factory _Addtorecent(final AlbumElements song) = _$AddtorecentImpl;

  AlbumElements get song;

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddtorecentImplCopyWith<_$AddtorecentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovefromrecentsImplCopyWith<$Res> {
  factory _$$RemovefromrecentsImplCopyWith(_$RemovefromrecentsImpl value,
          $Res Function(_$RemovefromrecentsImpl) then) =
      __$$RemovefromrecentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemovefromrecentsImplCopyWithImpl<$Res>
    extends _$LocaldataEventCopyWithImpl<$Res, _$RemovefromrecentsImpl>
    implements _$$RemovefromrecentsImplCopyWith<$Res> {
  __$$RemovefromrecentsImplCopyWithImpl(_$RemovefromrecentsImpl _value,
      $Res Function(_$RemovefromrecentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemovefromrecentsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemovefromrecentsImpl
    with DiagnosticableTreeMixin
    implements _Removefromrecents {
  const _$RemovefromrecentsImpl(this.id);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataEvent.removefromRecents(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocaldataEvent.removefromRecents'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovefromrecentsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovefromrecentsImplCopyWith<_$RemovefromrecentsImpl> get copyWith =>
      __$$RemovefromrecentsImplCopyWithImpl<_$RemovefromrecentsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistname) createPlaylist,
    required TResult Function(List<Map<String, dynamic>> newitem)
        updateplaylist,
    required TResult Function(String id) removefromdownloads,
    required TResult Function(AlbumElements song) addtorecent,
    required TResult Function(String id) removefromRecents,
    required TResult Function() getDownloads,
    required TResult Function() clearalldownloads,
    required TResult Function() started,
  }) {
    return removefromRecents(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistname)? createPlaylist,
    TResult? Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult? Function(String id)? removefromdownloads,
    TResult? Function(AlbumElements song)? addtorecent,
    TResult? Function(String id)? removefromRecents,
    TResult? Function()? getDownloads,
    TResult? Function()? clearalldownloads,
    TResult? Function()? started,
  }) {
    return removefromRecents?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistname)? createPlaylist,
    TResult Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult Function(String id)? removefromdownloads,
    TResult Function(AlbumElements song)? addtorecent,
    TResult Function(String id)? removefromRecents,
    TResult Function()? getDownloads,
    TResult Function()? clearalldownloads,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (removefromRecents != null) {
      return removefromRecents(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Createplaylist value) createPlaylist,
    required TResult Function(_Updateplaylist value) updateplaylist,
    required TResult Function(_RemovefromDownloads value) removefromdownloads,
    required TResult Function(_Addtorecent value) addtorecent,
    required TResult Function(_Removefromrecents value) removefromRecents,
    required TResult Function(_GetDownloads value) getDownloads,
    required TResult Function(_Clearalldownloads value) clearalldownloads,
    required TResult Function(_Started value) started,
  }) {
    return removefromRecents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Createplaylist value)? createPlaylist,
    TResult? Function(_Updateplaylist value)? updateplaylist,
    TResult? Function(_RemovefromDownloads value)? removefromdownloads,
    TResult? Function(_Addtorecent value)? addtorecent,
    TResult? Function(_Removefromrecents value)? removefromRecents,
    TResult? Function(_GetDownloads value)? getDownloads,
    TResult? Function(_Clearalldownloads value)? clearalldownloads,
    TResult? Function(_Started value)? started,
  }) {
    return removefromRecents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Createplaylist value)? createPlaylist,
    TResult Function(_Updateplaylist value)? updateplaylist,
    TResult Function(_RemovefromDownloads value)? removefromdownloads,
    TResult Function(_Addtorecent value)? addtorecent,
    TResult Function(_Removefromrecents value)? removefromRecents,
    TResult Function(_GetDownloads value)? getDownloads,
    TResult Function(_Clearalldownloads value)? clearalldownloads,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (removefromRecents != null) {
      return removefromRecents(this);
    }
    return orElse();
  }
}

abstract class _Removefromrecents implements LocaldataEvent {
  const factory _Removefromrecents(final String id) = _$RemovefromrecentsImpl;

  String get id;

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemovefromrecentsImplCopyWith<_$RemovefromrecentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDownloadsImplCopyWith<$Res> {
  factory _$$GetDownloadsImplCopyWith(
          _$GetDownloadsImpl value, $Res Function(_$GetDownloadsImpl) then) =
      __$$GetDownloadsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDownloadsImplCopyWithImpl<$Res>
    extends _$LocaldataEventCopyWithImpl<$Res, _$GetDownloadsImpl>
    implements _$$GetDownloadsImplCopyWith<$Res> {
  __$$GetDownloadsImplCopyWithImpl(
      _$GetDownloadsImpl _value, $Res Function(_$GetDownloadsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetDownloadsImpl with DiagnosticableTreeMixin implements _GetDownloads {
  const _$GetDownloadsImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataEvent.getDownloads()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LocaldataEvent.getDownloads'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDownloadsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistname) createPlaylist,
    required TResult Function(List<Map<String, dynamic>> newitem)
        updateplaylist,
    required TResult Function(String id) removefromdownloads,
    required TResult Function(AlbumElements song) addtorecent,
    required TResult Function(String id) removefromRecents,
    required TResult Function() getDownloads,
    required TResult Function() clearalldownloads,
    required TResult Function() started,
  }) {
    return getDownloads();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistname)? createPlaylist,
    TResult? Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult? Function(String id)? removefromdownloads,
    TResult? Function(AlbumElements song)? addtorecent,
    TResult? Function(String id)? removefromRecents,
    TResult? Function()? getDownloads,
    TResult? Function()? clearalldownloads,
    TResult? Function()? started,
  }) {
    return getDownloads?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistname)? createPlaylist,
    TResult Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult Function(String id)? removefromdownloads,
    TResult Function(AlbumElements song)? addtorecent,
    TResult Function(String id)? removefromRecents,
    TResult Function()? getDownloads,
    TResult Function()? clearalldownloads,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (getDownloads != null) {
      return getDownloads();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Createplaylist value) createPlaylist,
    required TResult Function(_Updateplaylist value) updateplaylist,
    required TResult Function(_RemovefromDownloads value) removefromdownloads,
    required TResult Function(_Addtorecent value) addtorecent,
    required TResult Function(_Removefromrecents value) removefromRecents,
    required TResult Function(_GetDownloads value) getDownloads,
    required TResult Function(_Clearalldownloads value) clearalldownloads,
    required TResult Function(_Started value) started,
  }) {
    return getDownloads(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Createplaylist value)? createPlaylist,
    TResult? Function(_Updateplaylist value)? updateplaylist,
    TResult? Function(_RemovefromDownloads value)? removefromdownloads,
    TResult? Function(_Addtorecent value)? addtorecent,
    TResult? Function(_Removefromrecents value)? removefromRecents,
    TResult? Function(_GetDownloads value)? getDownloads,
    TResult? Function(_Clearalldownloads value)? clearalldownloads,
    TResult? Function(_Started value)? started,
  }) {
    return getDownloads?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Createplaylist value)? createPlaylist,
    TResult Function(_Updateplaylist value)? updateplaylist,
    TResult Function(_RemovefromDownloads value)? removefromdownloads,
    TResult Function(_Addtorecent value)? addtorecent,
    TResult Function(_Removefromrecents value)? removefromRecents,
    TResult Function(_GetDownloads value)? getDownloads,
    TResult Function(_Clearalldownloads value)? clearalldownloads,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (getDownloads != null) {
      return getDownloads(this);
    }
    return orElse();
  }
}

abstract class _GetDownloads implements LocaldataEvent {
  const factory _GetDownloads() = _$GetDownloadsImpl;
}

/// @nodoc
abstract class _$$ClearalldownloadsImplCopyWith<$Res> {
  factory _$$ClearalldownloadsImplCopyWith(_$ClearalldownloadsImpl value,
          $Res Function(_$ClearalldownloadsImpl) then) =
      __$$ClearalldownloadsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearalldownloadsImplCopyWithImpl<$Res>
    extends _$LocaldataEventCopyWithImpl<$Res, _$ClearalldownloadsImpl>
    implements _$$ClearalldownloadsImplCopyWith<$Res> {
  __$$ClearalldownloadsImplCopyWithImpl(_$ClearalldownloadsImpl _value,
      $Res Function(_$ClearalldownloadsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearalldownloadsImpl
    with DiagnosticableTreeMixin
    implements _Clearalldownloads {
  const _$ClearalldownloadsImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataEvent.clearalldownloads()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'LocaldataEvent.clearalldownloads'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearalldownloadsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistname) createPlaylist,
    required TResult Function(List<Map<String, dynamic>> newitem)
        updateplaylist,
    required TResult Function(String id) removefromdownloads,
    required TResult Function(AlbumElements song) addtorecent,
    required TResult Function(String id) removefromRecents,
    required TResult Function() getDownloads,
    required TResult Function() clearalldownloads,
    required TResult Function() started,
  }) {
    return clearalldownloads();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistname)? createPlaylist,
    TResult? Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult? Function(String id)? removefromdownloads,
    TResult? Function(AlbumElements song)? addtorecent,
    TResult? Function(String id)? removefromRecents,
    TResult? Function()? getDownloads,
    TResult? Function()? clearalldownloads,
    TResult? Function()? started,
  }) {
    return clearalldownloads?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistname)? createPlaylist,
    TResult Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult Function(String id)? removefromdownloads,
    TResult Function(AlbumElements song)? addtorecent,
    TResult Function(String id)? removefromRecents,
    TResult Function()? getDownloads,
    TResult Function()? clearalldownloads,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (clearalldownloads != null) {
      return clearalldownloads();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Createplaylist value) createPlaylist,
    required TResult Function(_Updateplaylist value) updateplaylist,
    required TResult Function(_RemovefromDownloads value) removefromdownloads,
    required TResult Function(_Addtorecent value) addtorecent,
    required TResult Function(_Removefromrecents value) removefromRecents,
    required TResult Function(_GetDownloads value) getDownloads,
    required TResult Function(_Clearalldownloads value) clearalldownloads,
    required TResult Function(_Started value) started,
  }) {
    return clearalldownloads(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Createplaylist value)? createPlaylist,
    TResult? Function(_Updateplaylist value)? updateplaylist,
    TResult? Function(_RemovefromDownloads value)? removefromdownloads,
    TResult? Function(_Addtorecent value)? addtorecent,
    TResult? Function(_Removefromrecents value)? removefromRecents,
    TResult? Function(_GetDownloads value)? getDownloads,
    TResult? Function(_Clearalldownloads value)? clearalldownloads,
    TResult? Function(_Started value)? started,
  }) {
    return clearalldownloads?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Createplaylist value)? createPlaylist,
    TResult Function(_Updateplaylist value)? updateplaylist,
    TResult Function(_RemovefromDownloads value)? removefromdownloads,
    TResult Function(_Addtorecent value)? addtorecent,
    TResult Function(_Removefromrecents value)? removefromRecents,
    TResult Function(_GetDownloads value)? getDownloads,
    TResult Function(_Clearalldownloads value)? clearalldownloads,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (clearalldownloads != null) {
      return clearalldownloads(this);
    }
    return orElse();
  }
}

abstract class _Clearalldownloads implements LocaldataEvent {
  const factory _Clearalldownloads() = _$ClearalldownloadsImpl;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$LocaldataEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LocaldataEvent.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistname) createPlaylist,
    required TResult Function(List<Map<String, dynamic>> newitem)
        updateplaylist,
    required TResult Function(String id) removefromdownloads,
    required TResult Function(AlbumElements song) addtorecent,
    required TResult Function(String id) removefromRecents,
    required TResult Function() getDownloads,
    required TResult Function() clearalldownloads,
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistname)? createPlaylist,
    TResult? Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult? Function(String id)? removefromdownloads,
    TResult? Function(AlbumElements song)? addtorecent,
    TResult? Function(String id)? removefromRecents,
    TResult? Function()? getDownloads,
    TResult? Function()? clearalldownloads,
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistname)? createPlaylist,
    TResult Function(List<Map<String, dynamic>> newitem)? updateplaylist,
    TResult Function(String id)? removefromdownloads,
    TResult Function(AlbumElements song)? addtorecent,
    TResult Function(String id)? removefromRecents,
    TResult Function()? getDownloads,
    TResult Function()? clearalldownloads,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Createplaylist value) createPlaylist,
    required TResult Function(_Updateplaylist value) updateplaylist,
    required TResult Function(_RemovefromDownloads value) removefromdownloads,
    required TResult Function(_Addtorecent value) addtorecent,
    required TResult Function(_Removefromrecents value) removefromRecents,
    required TResult Function(_GetDownloads value) getDownloads,
    required TResult Function(_Clearalldownloads value) clearalldownloads,
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Createplaylist value)? createPlaylist,
    TResult? Function(_Updateplaylist value)? updateplaylist,
    TResult? Function(_RemovefromDownloads value)? removefromdownloads,
    TResult? Function(_Addtorecent value)? addtorecent,
    TResult? Function(_Removefromrecents value)? removefromRecents,
    TResult? Function(_GetDownloads value)? getDownloads,
    TResult? Function(_Clearalldownloads value)? clearalldownloads,
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Createplaylist value)? createPlaylist,
    TResult Function(_Updateplaylist value)? updateplaylist,
    TResult Function(_RemovefromDownloads value)? removefromdownloads,
    TResult Function(_Addtorecent value)? addtorecent,
    TResult Function(_Removefromrecents value)? removefromRecents,
    TResult Function(_GetDownloads value)? getDownloads,
    TResult Function(_Clearalldownloads value)? clearalldownloads,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LocaldataEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$LocaldataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isloading) failed,
    required TResult Function(bool isremoved) remove,
    required TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)
        querys,
    required TResult Function(bool isloading) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isloading)? failed,
    TResult? Function(bool isremoved)? remove,
    TResult? Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult? Function(bool isloading)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isloading)? failed,
    TResult Function(bool isremoved)? remove,
    TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult Function(bool isloading)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failed value) failed,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Query value) querys,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Query value)? querys,
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failed value)? failed,
    TResult Function(_Remove value)? remove,
    TResult Function(_Query value)? querys,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaldataStateCopyWith<$Res> {
  factory $LocaldataStateCopyWith(
          LocaldataState value, $Res Function(LocaldataState) then) =
      _$LocaldataStateCopyWithImpl<$Res, LocaldataState>;
}

/// @nodoc
class _$LocaldataStateCopyWithImpl<$Res, $Val extends LocaldataState>
    implements $LocaldataStateCopyWith<$Res> {
  _$LocaldataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isloading});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$LocaldataStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
  }) {
    return _then(_$FailedImpl(
      null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FailedImpl with DiagnosticableTreeMixin implements _Failed {
  const _$FailedImpl(this.isloading);

  @override
  final bool isloading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataState.failed(isloading: $isloading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocaldataState.failed'))
      ..add(DiagnosticsProperty('isloading', isloading));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isloading);

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isloading) failed,
    required TResult Function(bool isremoved) remove,
    required TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)
        querys,
    required TResult Function(bool isloading) initial,
  }) {
    return failed(isloading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isloading)? failed,
    TResult? Function(bool isremoved)? remove,
    TResult? Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult? Function(bool isloading)? initial,
  }) {
    return failed?.call(isloading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isloading)? failed,
    TResult Function(bool isremoved)? remove,
    TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult Function(bool isloading)? initial,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(isloading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failed value) failed,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Query value) querys,
    required TResult Function(_Initial value) initial,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Query value)? querys,
    TResult? Function(_Initial value)? initial,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failed value)? failed,
    TResult Function(_Remove value)? remove,
    TResult Function(_Query value)? querys,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements LocaldataState {
  const factory _Failed(final bool isloading) = _$FailedImpl;

  bool get isloading;

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isremoved});
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$LocaldataStateCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isremoved = null,
  }) {
    return _then(_$RemoveImpl(
      null == isremoved
          ? _value.isremoved
          : isremoved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RemoveImpl with DiagnosticableTreeMixin implements _Remove {
  const _$RemoveImpl(this.isremoved);

  @override
  final bool isremoved;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataState.remove(isremoved: $isremoved)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocaldataState.remove'))
      ..add(DiagnosticsProperty('isremoved', isremoved));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.isremoved, isremoved) ||
                other.isremoved == isremoved));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isremoved);

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isloading) failed,
    required TResult Function(bool isremoved) remove,
    required TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)
        querys,
    required TResult Function(bool isloading) initial,
  }) {
    return remove(isremoved);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isloading)? failed,
    TResult? Function(bool isremoved)? remove,
    TResult? Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult? Function(bool isloading)? initial,
  }) {
    return remove?.call(isremoved);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isloading)? failed,
    TResult Function(bool isremoved)? remove,
    TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult Function(bool isloading)? initial,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(isremoved);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failed value) failed,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Query value) querys,
    required TResult Function(_Initial value) initial,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Query value)? querys,
    TResult? Function(_Initial value)? initial,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failed value)? failed,
    TResult Function(_Remove value)? remove,
    TResult Function(_Query value)? querys,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements LocaldataState {
  const factory _Remove(final bool isremoved) = _$RemoveImpl;

  bool get isremoved;

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QueryImplCopyWith<$Res> {
  factory _$$QueryImplCopyWith(
          _$QueryImpl value, $Res Function(_$QueryImpl) then) =
      __$$QueryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isloading, bool fail, List<Map<String, dynamic>> downloads});
}

/// @nodoc
class __$$QueryImplCopyWithImpl<$Res>
    extends _$LocaldataStateCopyWithImpl<$Res, _$QueryImpl>
    implements _$$QueryImplCopyWith<$Res> {
  __$$QueryImplCopyWithImpl(
      _$QueryImpl _value, $Res Function(_$QueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
    Object? fail = null,
    Object? downloads = null,
  }) {
    return _then(_$QueryImpl(
      null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      null == fail
          ? _value.fail
          : fail // ignore: cast_nullable_to_non_nullable
              as bool,
      null == downloads
          ? _value._downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$QueryImpl with DiagnosticableTreeMixin implements _Query {
  const _$QueryImpl(
      this.isloading, this.fail, final List<Map<String, dynamic>> downloads)
      : _downloads = downloads;

  @override
  final bool isloading;
  @override
  final bool fail;
  final List<Map<String, dynamic>> _downloads;
  @override
  List<Map<String, dynamic>> get downloads {
    if (_downloads is EqualUnmodifiableListView) return _downloads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloads);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataState.querys(isloading: $isloading, fail: $fail, downloads: $downloads)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocaldataState.querys'))
      ..add(DiagnosticsProperty('isloading', isloading))
      ..add(DiagnosticsProperty('fail', fail))
      ..add(DiagnosticsProperty('downloads', downloads));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryImpl &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            (identical(other.fail, fail) || other.fail == fail) &&
            const DeepCollectionEquality()
                .equals(other._downloads, _downloads));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isloading, fail,
      const DeepCollectionEquality().hash(_downloads));

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryImplCopyWith<_$QueryImpl> get copyWith =>
      __$$QueryImplCopyWithImpl<_$QueryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isloading) failed,
    required TResult Function(bool isremoved) remove,
    required TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)
        querys,
    required TResult Function(bool isloading) initial,
  }) {
    return querys(isloading, fail, downloads);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isloading)? failed,
    TResult? Function(bool isremoved)? remove,
    TResult? Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult? Function(bool isloading)? initial,
  }) {
    return querys?.call(isloading, fail, downloads);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isloading)? failed,
    TResult Function(bool isremoved)? remove,
    TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult Function(bool isloading)? initial,
    required TResult orElse(),
  }) {
    if (querys != null) {
      return querys(isloading, fail, downloads);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failed value) failed,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Query value) querys,
    required TResult Function(_Initial value) initial,
  }) {
    return querys(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Query value)? querys,
    TResult? Function(_Initial value)? initial,
  }) {
    return querys?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failed value)? failed,
    TResult Function(_Remove value)? remove,
    TResult Function(_Query value)? querys,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (querys != null) {
      return querys(this);
    }
    return orElse();
  }
}

abstract class _Query implements LocaldataState {
  const factory _Query(final bool isloading, final bool fail,
      final List<Map<String, dynamic>> downloads) = _$QueryImpl;

  bool get isloading;
  bool get fail;
  List<Map<String, dynamic>> get downloads;

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryImplCopyWith<_$QueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isloading});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LocaldataStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
  }) {
    return _then(_$InitialImpl(
      null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl(this.isloading);

  @override
  final bool isloading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocaldataState.initial(isloading: $isloading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocaldataState.initial'))
      ..add(DiagnosticsProperty('isloading', isloading));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isloading);

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isloading) failed,
    required TResult Function(bool isremoved) remove,
    required TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)
        querys,
    required TResult Function(bool isloading) initial,
  }) {
    return initial(isloading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isloading)? failed,
    TResult? Function(bool isremoved)? remove,
    TResult? Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult? Function(bool isloading)? initial,
  }) {
    return initial?.call(isloading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isloading)? failed,
    TResult Function(bool isremoved)? remove,
    TResult Function(
            bool isloading, bool fail, List<Map<String, dynamic>> downloads)?
        querys,
    TResult Function(bool isloading)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isloading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Failed value) failed,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Query value) querys,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Query value)? querys,
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Failed value)? failed,
    TResult Function(_Remove value)? remove,
    TResult Function(_Query value)? querys,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocaldataState {
  const factory _Initial(final bool isloading) = _$InitialImpl;

  bool get isloading;

  /// Create a copy of LocaldataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
