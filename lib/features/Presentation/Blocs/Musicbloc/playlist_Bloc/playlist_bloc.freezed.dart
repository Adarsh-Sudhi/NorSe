// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaylistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistid, String playlistname)
        removePlaylist,
    required TResult Function(String tbname, AlbumElements song) addtoplaylist,
    required TResult Function() getallplaylist,
    required TResult Function(String playlistname) createplaylist,
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistid, String playlistname)? removePlaylist,
    TResult? Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult? Function()? getallplaylist,
    TResult? Function(String playlistname)? createplaylist,
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistid, String playlistname)? removePlaylist,
    TResult Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult Function()? getallplaylist,
    TResult Function(String playlistname)? createplaylist,
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Removeplaylist value) removePlaylist,
    required TResult Function(_Addtoplaylist value) addtoplaylist,
    required TResult Function(_Getallplaylist value) getallplaylist,
    required TResult Function(_Createplaylist value) createplaylist,
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removeplaylist value)? removePlaylist,
    TResult? Function(_Addtoplaylist value)? addtoplaylist,
    TResult? Function(_Getallplaylist value)? getallplaylist,
    TResult? Function(_Createplaylist value)? createplaylist,
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removeplaylist value)? removePlaylist,
    TResult Function(_Addtoplaylist value)? addtoplaylist,
    TResult Function(_Getallplaylist value)? getallplaylist,
    TResult Function(_Createplaylist value)? createplaylist,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistEventCopyWith<$Res> {
  factory $PlaylistEventCopyWith(
          PlaylistEvent value, $Res Function(PlaylistEvent) then) =
      _$PlaylistEventCopyWithImpl<$Res, PlaylistEvent>;
}

/// @nodoc
class _$PlaylistEventCopyWithImpl<$Res, $Val extends PlaylistEvent>
    implements $PlaylistEventCopyWith<$Res> {
  _$PlaylistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RemoveplaylistImplCopyWith<$Res> {
  factory _$$RemoveplaylistImplCopyWith(_$RemoveplaylistImpl value,
          $Res Function(_$RemoveplaylistImpl) then) =
      __$$RemoveplaylistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playlistid, String playlistname});
}

/// @nodoc
class __$$RemoveplaylistImplCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res, _$RemoveplaylistImpl>
    implements _$$RemoveplaylistImplCopyWith<$Res> {
  __$$RemoveplaylistImplCopyWithImpl(
      _$RemoveplaylistImpl _value, $Res Function(_$RemoveplaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlistid = null,
    Object? playlistname = null,
  }) {
    return _then(_$RemoveplaylistImpl(
      null == playlistid
          ? _value.playlistid
          : playlistid // ignore: cast_nullable_to_non_nullable
              as String,
      null == playlistname
          ? _value.playlistname
          : playlistname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveplaylistImpl implements _Removeplaylist {
  const _$RemoveplaylistImpl(this.playlistid, this.playlistname);

  @override
  final String playlistid;
  @override
  final String playlistname;

  @override
  String toString() {
    return 'PlaylistEvent.removePlaylist(playlistid: $playlistid, playlistname: $playlistname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveplaylistImpl &&
            (identical(other.playlistid, playlistid) ||
                other.playlistid == playlistid) &&
            (identical(other.playlistname, playlistname) ||
                other.playlistname == playlistname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistid, playlistname);

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveplaylistImplCopyWith<_$RemoveplaylistImpl> get copyWith =>
      __$$RemoveplaylistImplCopyWithImpl<_$RemoveplaylistImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistid, String playlistname)
        removePlaylist,
    required TResult Function(String tbname, AlbumElements song) addtoplaylist,
    required TResult Function() getallplaylist,
    required TResult Function(String playlistname) createplaylist,
    required TResult Function() started,
  }) {
    return removePlaylist(playlistid, playlistname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistid, String playlistname)? removePlaylist,
    TResult? Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult? Function()? getallplaylist,
    TResult? Function(String playlistname)? createplaylist,
    TResult? Function()? started,
  }) {
    return removePlaylist?.call(playlistid, playlistname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistid, String playlistname)? removePlaylist,
    TResult Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult Function()? getallplaylist,
    TResult Function(String playlistname)? createplaylist,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (removePlaylist != null) {
      return removePlaylist(playlistid, playlistname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Removeplaylist value) removePlaylist,
    required TResult Function(_Addtoplaylist value) addtoplaylist,
    required TResult Function(_Getallplaylist value) getallplaylist,
    required TResult Function(_Createplaylist value) createplaylist,
    required TResult Function(_Started value) started,
  }) {
    return removePlaylist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removeplaylist value)? removePlaylist,
    TResult? Function(_Addtoplaylist value)? addtoplaylist,
    TResult? Function(_Getallplaylist value)? getallplaylist,
    TResult? Function(_Createplaylist value)? createplaylist,
    TResult? Function(_Started value)? started,
  }) {
    return removePlaylist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removeplaylist value)? removePlaylist,
    TResult Function(_Addtoplaylist value)? addtoplaylist,
    TResult Function(_Getallplaylist value)? getallplaylist,
    TResult Function(_Createplaylist value)? createplaylist,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (removePlaylist != null) {
      return removePlaylist(this);
    }
    return orElse();
  }
}

abstract class _Removeplaylist implements PlaylistEvent {
  const factory _Removeplaylist(
          final String playlistid, final String playlistname) =
      _$RemoveplaylistImpl;

  String get playlistid;
  String get playlistname;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveplaylistImplCopyWith<_$RemoveplaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddtoplaylistImplCopyWith<$Res> {
  factory _$$AddtoplaylistImplCopyWith(
          _$AddtoplaylistImpl value, $Res Function(_$AddtoplaylistImpl) then) =
      __$$AddtoplaylistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tbname, AlbumElements song});
}

/// @nodoc
class __$$AddtoplaylistImplCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res, _$AddtoplaylistImpl>
    implements _$$AddtoplaylistImplCopyWith<$Res> {
  __$$AddtoplaylistImplCopyWithImpl(
      _$AddtoplaylistImpl _value, $Res Function(_$AddtoplaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tbname = null,
    Object? song = null,
  }) {
    return _then(_$AddtoplaylistImpl(
      null == tbname
          ? _value.tbname
          : tbname // ignore: cast_nullable_to_non_nullable
              as String,
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as AlbumElements,
    ));
  }
}

/// @nodoc

class _$AddtoplaylistImpl implements _Addtoplaylist {
  const _$AddtoplaylistImpl(this.tbname, this.song);

  @override
  final String tbname;
  @override
  final AlbumElements song;

  @override
  String toString() {
    return 'PlaylistEvent.addtoplaylist(tbname: $tbname, song: $song)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddtoplaylistImpl &&
            (identical(other.tbname, tbname) || other.tbname == tbname) &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tbname, song);

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddtoplaylistImplCopyWith<_$AddtoplaylistImpl> get copyWith =>
      __$$AddtoplaylistImplCopyWithImpl<_$AddtoplaylistImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistid, String playlistname)
        removePlaylist,
    required TResult Function(String tbname, AlbumElements song) addtoplaylist,
    required TResult Function() getallplaylist,
    required TResult Function(String playlistname) createplaylist,
    required TResult Function() started,
  }) {
    return addtoplaylist(tbname, song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistid, String playlistname)? removePlaylist,
    TResult? Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult? Function()? getallplaylist,
    TResult? Function(String playlistname)? createplaylist,
    TResult? Function()? started,
  }) {
    return addtoplaylist?.call(tbname, song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistid, String playlistname)? removePlaylist,
    TResult Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult Function()? getallplaylist,
    TResult Function(String playlistname)? createplaylist,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (addtoplaylist != null) {
      return addtoplaylist(tbname, song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Removeplaylist value) removePlaylist,
    required TResult Function(_Addtoplaylist value) addtoplaylist,
    required TResult Function(_Getallplaylist value) getallplaylist,
    required TResult Function(_Createplaylist value) createplaylist,
    required TResult Function(_Started value) started,
  }) {
    return addtoplaylist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removeplaylist value)? removePlaylist,
    TResult? Function(_Addtoplaylist value)? addtoplaylist,
    TResult? Function(_Getallplaylist value)? getallplaylist,
    TResult? Function(_Createplaylist value)? createplaylist,
    TResult? Function(_Started value)? started,
  }) {
    return addtoplaylist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removeplaylist value)? removePlaylist,
    TResult Function(_Addtoplaylist value)? addtoplaylist,
    TResult Function(_Getallplaylist value)? getallplaylist,
    TResult Function(_Createplaylist value)? createplaylist,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (addtoplaylist != null) {
      return addtoplaylist(this);
    }
    return orElse();
  }
}

abstract class _Addtoplaylist implements PlaylistEvent {
  const factory _Addtoplaylist(final String tbname, final AlbumElements song) =
      _$AddtoplaylistImpl;

  String get tbname;
  AlbumElements get song;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddtoplaylistImplCopyWith<_$AddtoplaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetallplaylistImplCopyWith<$Res> {
  factory _$$GetallplaylistImplCopyWith(_$GetallplaylistImpl value,
          $Res Function(_$GetallplaylistImpl) then) =
      __$$GetallplaylistImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetallplaylistImplCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res, _$GetallplaylistImpl>
    implements _$$GetallplaylistImplCopyWith<$Res> {
  __$$GetallplaylistImplCopyWithImpl(
      _$GetallplaylistImpl _value, $Res Function(_$GetallplaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetallplaylistImpl implements _Getallplaylist {
  const _$GetallplaylistImpl();

  @override
  String toString() {
    return 'PlaylistEvent.getallplaylist()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetallplaylistImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playlistid, String playlistname)
        removePlaylist,
    required TResult Function(String tbname, AlbumElements song) addtoplaylist,
    required TResult Function() getallplaylist,
    required TResult Function(String playlistname) createplaylist,
    required TResult Function() started,
  }) {
    return getallplaylist();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistid, String playlistname)? removePlaylist,
    TResult? Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult? Function()? getallplaylist,
    TResult? Function(String playlistname)? createplaylist,
    TResult? Function()? started,
  }) {
    return getallplaylist?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistid, String playlistname)? removePlaylist,
    TResult Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult Function()? getallplaylist,
    TResult Function(String playlistname)? createplaylist,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (getallplaylist != null) {
      return getallplaylist();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Removeplaylist value) removePlaylist,
    required TResult Function(_Addtoplaylist value) addtoplaylist,
    required TResult Function(_Getallplaylist value) getallplaylist,
    required TResult Function(_Createplaylist value) createplaylist,
    required TResult Function(_Started value) started,
  }) {
    return getallplaylist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removeplaylist value)? removePlaylist,
    TResult? Function(_Addtoplaylist value)? addtoplaylist,
    TResult? Function(_Getallplaylist value)? getallplaylist,
    TResult? Function(_Createplaylist value)? createplaylist,
    TResult? Function(_Started value)? started,
  }) {
    return getallplaylist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removeplaylist value)? removePlaylist,
    TResult Function(_Addtoplaylist value)? addtoplaylist,
    TResult Function(_Getallplaylist value)? getallplaylist,
    TResult Function(_Createplaylist value)? createplaylist,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (getallplaylist != null) {
      return getallplaylist(this);
    }
    return orElse();
  }
}

abstract class _Getallplaylist implements PlaylistEvent {
  const factory _Getallplaylist() = _$GetallplaylistImpl;
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
    extends _$PlaylistEventCopyWithImpl<$Res, _$CreateplaylistImpl>
    implements _$$CreateplaylistImplCopyWith<$Res> {
  __$$CreateplaylistImplCopyWithImpl(
      _$CreateplaylistImpl _value, $Res Function(_$CreateplaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistEvent
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

class _$CreateplaylistImpl implements _Createplaylist {
  const _$CreateplaylistImpl(this.playlistname);

  @override
  final String playlistname;

  @override
  String toString() {
    return 'PlaylistEvent.createplaylist(playlistname: $playlistname)';
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

  /// Create a copy of PlaylistEvent
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
    required TResult Function(String playlistid, String playlistname)
        removePlaylist,
    required TResult Function(String tbname, AlbumElements song) addtoplaylist,
    required TResult Function() getallplaylist,
    required TResult Function(String playlistname) createplaylist,
    required TResult Function() started,
  }) {
    return createplaylist(playlistname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistid, String playlistname)? removePlaylist,
    TResult? Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult? Function()? getallplaylist,
    TResult? Function(String playlistname)? createplaylist,
    TResult? Function()? started,
  }) {
    return createplaylist?.call(playlistname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistid, String playlistname)? removePlaylist,
    TResult Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult Function()? getallplaylist,
    TResult Function(String playlistname)? createplaylist,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (createplaylist != null) {
      return createplaylist(playlistname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Removeplaylist value) removePlaylist,
    required TResult Function(_Addtoplaylist value) addtoplaylist,
    required TResult Function(_Getallplaylist value) getallplaylist,
    required TResult Function(_Createplaylist value) createplaylist,
    required TResult Function(_Started value) started,
  }) {
    return createplaylist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removeplaylist value)? removePlaylist,
    TResult? Function(_Addtoplaylist value)? addtoplaylist,
    TResult? Function(_Getallplaylist value)? getallplaylist,
    TResult? Function(_Createplaylist value)? createplaylist,
    TResult? Function(_Started value)? started,
  }) {
    return createplaylist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removeplaylist value)? removePlaylist,
    TResult Function(_Addtoplaylist value)? addtoplaylist,
    TResult Function(_Getallplaylist value)? getallplaylist,
    TResult Function(_Createplaylist value)? createplaylist,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (createplaylist != null) {
      return createplaylist(this);
    }
    return orElse();
  }
}

abstract class _Createplaylist implements PlaylistEvent {
  const factory _Createplaylist(final String playlistname) =
      _$CreateplaylistImpl;

  String get playlistname;

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateplaylistImplCopyWith<_$CreateplaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PlaylistEvent.started()';
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
    required TResult Function(String playlistid, String playlistname)
        removePlaylist,
    required TResult Function(String tbname, AlbumElements song) addtoplaylist,
    required TResult Function() getallplaylist,
    required TResult Function(String playlistname) createplaylist,
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playlistid, String playlistname)? removePlaylist,
    TResult? Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult? Function()? getallplaylist,
    TResult? Function(String playlistname)? createplaylist,
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playlistid, String playlistname)? removePlaylist,
    TResult Function(String tbname, AlbumElements song)? addtoplaylist,
    TResult Function()? getallplaylist,
    TResult Function(String playlistname)? createplaylist,
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
    required TResult Function(_Removeplaylist value) removePlaylist,
    required TResult Function(_Addtoplaylist value) addtoplaylist,
    required TResult Function(_Getallplaylist value) getallplaylist,
    required TResult Function(_Createplaylist value) createplaylist,
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removeplaylist value)? removePlaylist,
    TResult? Function(_Addtoplaylist value)? addtoplaylist,
    TResult? Function(_Getallplaylist value)? getallplaylist,
    TResult? Function(_Createplaylist value)? createplaylist,
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removeplaylist value)? removePlaylist,
    TResult Function(_Addtoplaylist value)? addtoplaylist,
    TResult Function(_Getallplaylist value)? getallplaylist,
    TResult Function(_Createplaylist value)? createplaylist,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PlaylistEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$PlaylistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> playlists)
        allplaylists,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> playlists)? allplaylists,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> playlists)? allplaylists,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Allplaylist value) allplaylists,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Allplaylist value)? allplaylists,
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Allplaylist value)? allplaylists,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistStateCopyWith<$Res> {
  factory $PlaylistStateCopyWith(
          PlaylistState value, $Res Function(PlaylistState) then) =
      _$PlaylistStateCopyWithImpl<$Res, PlaylistState>;
}

/// @nodoc
class _$PlaylistStateCopyWithImpl<$Res, $Val extends PlaylistState>
    implements $PlaylistStateCopyWith<$Res> {
  _$PlaylistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AllplaylistImplCopyWith<$Res> {
  factory _$$AllplaylistImplCopyWith(
          _$AllplaylistImpl value, $Res Function(_$AllplaylistImpl) then) =
      __$$AllplaylistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> playlists});
}

/// @nodoc
class __$$AllplaylistImplCopyWithImpl<$Res>
    extends _$PlaylistStateCopyWithImpl<$Res, _$AllplaylistImpl>
    implements _$$AllplaylistImplCopyWith<$Res> {
  __$$AllplaylistImplCopyWithImpl(
      _$AllplaylistImpl _value, $Res Function(_$AllplaylistImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlists = null,
  }) {
    return _then(_$AllplaylistImpl(
      null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$AllplaylistImpl implements _Allplaylist {
  const _$AllplaylistImpl(final List<Map<String, dynamic>> playlists)
      : _playlists = playlists;

  final List<Map<String, dynamic>> _playlists;
  @override
  List<Map<String, dynamic>> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  @override
  String toString() {
    return 'PlaylistState.allplaylists(playlists: $playlists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllplaylistImpl &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_playlists));

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllplaylistImplCopyWith<_$AllplaylistImpl> get copyWith =>
      __$$AllplaylistImplCopyWithImpl<_$AllplaylistImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> playlists)
        allplaylists,
    required TResult Function() initial,
  }) {
    return allplaylists(playlists);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> playlists)? allplaylists,
    TResult? Function()? initial,
  }) {
    return allplaylists?.call(playlists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> playlists)? allplaylists,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (allplaylists != null) {
      return allplaylists(playlists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Allplaylist value) allplaylists,
    required TResult Function(_Initial value) initial,
  }) {
    return allplaylists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Allplaylist value)? allplaylists,
    TResult? Function(_Initial value)? initial,
  }) {
    return allplaylists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Allplaylist value)? allplaylists,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (allplaylists != null) {
      return allplaylists(this);
    }
    return orElse();
  }
}

abstract class _Allplaylist implements PlaylistState {
  const factory _Allplaylist(final List<Map<String, dynamic>> playlists) =
      _$AllplaylistImpl;

  List<Map<String, dynamic>> get playlists;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllplaylistImplCopyWith<_$AllplaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PlaylistStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PlaylistState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> playlists)
        allplaylists,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> playlists)? allplaylists,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> playlists)? allplaylists,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Allplaylist value) allplaylists,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Allplaylist value)? allplaylists,
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Allplaylist value)? allplaylists,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PlaylistState {
  const factory _Initial() = _$InitialImpl;
}
