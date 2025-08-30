// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlistsongs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaylistsongsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String playlistid) getplaylistsongs,
    required TResult Function(String playlistid, String songid) deletesong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String playlistid)? getplaylistsongs,
    TResult? Function(String playlistid, String songid)? deletesong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String playlistid)? getplaylistsongs,
    TResult Function(String playlistid, String songid)? deletesong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getallsongs value) getplaylistsongs,
    required TResult Function(_Deletesong value) deletesong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getallsongs value)? getplaylistsongs,
    TResult? Function(_Deletesong value)? deletesong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getallsongs value)? getplaylistsongs,
    TResult Function(_Deletesong value)? deletesong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistsongsEventCopyWith<$Res> {
  factory $PlaylistsongsEventCopyWith(
          PlaylistsongsEvent value, $Res Function(PlaylistsongsEvent) then) =
      _$PlaylistsongsEventCopyWithImpl<$Res, PlaylistsongsEvent>;
}

/// @nodoc
class _$PlaylistsongsEventCopyWithImpl<$Res, $Val extends PlaylistsongsEvent>
    implements $PlaylistsongsEventCopyWith<$Res> {
  _$PlaylistsongsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaylistsongsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$PlaylistsongsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistsongsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PlaylistsongsEvent.started()';
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
    required TResult Function() started,
    required TResult Function(String playlistid) getplaylistsongs,
    required TResult Function(String playlistid, String songid) deletesong,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String playlistid)? getplaylistsongs,
    TResult? Function(String playlistid, String songid)? deletesong,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String playlistid)? getplaylistsongs,
    TResult Function(String playlistid, String songid)? deletesong,
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
    required TResult Function(_Started value) started,
    required TResult Function(_Getallsongs value) getplaylistsongs,
    required TResult Function(_Deletesong value) deletesong,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getallsongs value)? getplaylistsongs,
    TResult? Function(_Deletesong value)? deletesong,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getallsongs value)? getplaylistsongs,
    TResult Function(_Deletesong value)? deletesong,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PlaylistsongsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetallsongsImplCopyWith<$Res> {
  factory _$$GetallsongsImplCopyWith(
          _$GetallsongsImpl value, $Res Function(_$GetallsongsImpl) then) =
      __$$GetallsongsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playlistid});
}

/// @nodoc
class __$$GetallsongsImplCopyWithImpl<$Res>
    extends _$PlaylistsongsEventCopyWithImpl<$Res, _$GetallsongsImpl>
    implements _$$GetallsongsImplCopyWith<$Res> {
  __$$GetallsongsImplCopyWithImpl(
      _$GetallsongsImpl _value, $Res Function(_$GetallsongsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlistid = null,
  }) {
    return _then(_$GetallsongsImpl(
      null == playlistid
          ? _value.playlistid
          : playlistid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetallsongsImpl implements _Getallsongs {
  const _$GetallsongsImpl(this.playlistid);

  @override
  final String playlistid;

  @override
  String toString() {
    return 'PlaylistsongsEvent.getplaylistsongs(playlistid: $playlistid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetallsongsImpl &&
            (identical(other.playlistid, playlistid) ||
                other.playlistid == playlistid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistid);

  /// Create a copy of PlaylistsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetallsongsImplCopyWith<_$GetallsongsImpl> get copyWith =>
      __$$GetallsongsImplCopyWithImpl<_$GetallsongsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String playlistid) getplaylistsongs,
    required TResult Function(String playlistid, String songid) deletesong,
  }) {
    return getplaylistsongs(playlistid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String playlistid)? getplaylistsongs,
    TResult? Function(String playlistid, String songid)? deletesong,
  }) {
    return getplaylistsongs?.call(playlistid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String playlistid)? getplaylistsongs,
    TResult Function(String playlistid, String songid)? deletesong,
    required TResult orElse(),
  }) {
    if (getplaylistsongs != null) {
      return getplaylistsongs(playlistid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getallsongs value) getplaylistsongs,
    required TResult Function(_Deletesong value) deletesong,
  }) {
    return getplaylistsongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getallsongs value)? getplaylistsongs,
    TResult? Function(_Deletesong value)? deletesong,
  }) {
    return getplaylistsongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getallsongs value)? getplaylistsongs,
    TResult Function(_Deletesong value)? deletesong,
    required TResult orElse(),
  }) {
    if (getplaylistsongs != null) {
      return getplaylistsongs(this);
    }
    return orElse();
  }
}

abstract class _Getallsongs implements PlaylistsongsEvent {
  const factory _Getallsongs(final String playlistid) = _$GetallsongsImpl;

  String get playlistid;

  /// Create a copy of PlaylistsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetallsongsImplCopyWith<_$GetallsongsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletesongImplCopyWith<$Res> {
  factory _$$DeletesongImplCopyWith(
          _$DeletesongImpl value, $Res Function(_$DeletesongImpl) then) =
      __$$DeletesongImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playlistid, String songid});
}

/// @nodoc
class __$$DeletesongImplCopyWithImpl<$Res>
    extends _$PlaylistsongsEventCopyWithImpl<$Res, _$DeletesongImpl>
    implements _$$DeletesongImplCopyWith<$Res> {
  __$$DeletesongImplCopyWithImpl(
      _$DeletesongImpl _value, $Res Function(_$DeletesongImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playlistid = null,
    Object? songid = null,
  }) {
    return _then(_$DeletesongImpl(
      null == playlistid
          ? _value.playlistid
          : playlistid // ignore: cast_nullable_to_non_nullable
              as String,
      null == songid
          ? _value.songid
          : songid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeletesongImpl implements _Deletesong {
  const _$DeletesongImpl(this.playlistid, this.songid);

  @override
  final String playlistid;
  @override
  final String songid;

  @override
  String toString() {
    return 'PlaylistsongsEvent.deletesong(playlistid: $playlistid, songid: $songid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletesongImpl &&
            (identical(other.playlistid, playlistid) ||
                other.playlistid == playlistid) &&
            (identical(other.songid, songid) || other.songid == songid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playlistid, songid);

  /// Create a copy of PlaylistsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletesongImplCopyWith<_$DeletesongImpl> get copyWith =>
      __$$DeletesongImplCopyWithImpl<_$DeletesongImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String playlistid) getplaylistsongs,
    required TResult Function(String playlistid, String songid) deletesong,
  }) {
    return deletesong(playlistid, songid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String playlistid)? getplaylistsongs,
    TResult? Function(String playlistid, String songid)? deletesong,
  }) {
    return deletesong?.call(playlistid, songid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String playlistid)? getplaylistsongs,
    TResult Function(String playlistid, String songid)? deletesong,
    required TResult orElse(),
  }) {
    if (deletesong != null) {
      return deletesong(playlistid, songid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getallsongs value) getplaylistsongs,
    required TResult Function(_Deletesong value) deletesong,
  }) {
    return deletesong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getallsongs value)? getplaylistsongs,
    TResult? Function(_Deletesong value)? deletesong,
  }) {
    return deletesong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getallsongs value)? getplaylistsongs,
    TResult Function(_Deletesong value)? deletesong,
    required TResult orElse(),
  }) {
    if (deletesong != null) {
      return deletesong(this);
    }
    return orElse();
  }
}

abstract class _Deletesong implements PlaylistsongsEvent {
  const factory _Deletesong(final String playlistid, final String songid) =
      _$DeletesongImpl;

  String get playlistid;
  String get songid;

  /// Create a copy of PlaylistsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletesongImplCopyWith<_$DeletesongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlaylistsongsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Map<String, dynamic>> songs) songs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> songs)? songs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> songs)? songs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Songs value) songs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Songs value)? songs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Songs value)? songs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistsongsStateCopyWith<$Res> {
  factory $PlaylistsongsStateCopyWith(
          PlaylistsongsState value, $Res Function(PlaylistsongsState) then) =
      _$PlaylistsongsStateCopyWithImpl<$Res, PlaylistsongsState>;
}

/// @nodoc
class _$PlaylistsongsStateCopyWithImpl<$Res, $Val extends PlaylistsongsState>
    implements $PlaylistsongsStateCopyWith<$Res> {
  _$PlaylistsongsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaylistsongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PlaylistsongsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistsongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PlaylistsongsState.initial()';
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
    required TResult Function() initial,
    required TResult Function(List<Map<String, dynamic>> songs) songs,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> songs)? songs,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> songs)? songs,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Songs value) songs,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Songs value)? songs,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Songs value)? songs,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PlaylistsongsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SongsImplCopyWith<$Res> {
  factory _$$SongsImplCopyWith(
          _$SongsImpl value, $Res Function(_$SongsImpl) then) =
      __$$SongsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> songs});
}

/// @nodoc
class __$$SongsImplCopyWithImpl<$Res>
    extends _$PlaylistsongsStateCopyWithImpl<$Res, _$SongsImpl>
    implements _$$SongsImplCopyWith<$Res> {
  __$$SongsImplCopyWithImpl(
      _$SongsImpl _value, $Res Function(_$SongsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaylistsongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$SongsImpl(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$SongsImpl implements _Songs {
  const _$SongsImpl(final List<Map<String, dynamic>> songs) : _songs = songs;

  final List<Map<String, dynamic>> _songs;
  @override
  List<Map<String, dynamic>> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'PlaylistsongsState.songs(songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongsImpl &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  /// Create a copy of PlaylistsongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SongsImplCopyWith<_$SongsImpl> get copyWith =>
      __$$SongsImplCopyWithImpl<_$SongsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Map<String, dynamic>> songs) songs,
  }) {
    return songs(this.songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> songs)? songs,
  }) {
    return songs?.call(this.songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> songs)? songs,
    required TResult orElse(),
  }) {
    if (songs != null) {
      return songs(this.songs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Songs value) songs,
  }) {
    return songs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Songs value)? songs,
  }) {
    return songs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Songs value)? songs,
    required TResult orElse(),
  }) {
    if (songs != null) {
      return songs(this);
    }
    return orElse();
  }
}

abstract class _Songs implements PlaylistsongsState {
  const factory _Songs(final List<Map<String, dynamic>> songs) = _$SongsImpl;

  List<Map<String, dynamic>> get songs;

  /// Create a copy of PlaylistsongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SongsImplCopyWith<_$SongsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
