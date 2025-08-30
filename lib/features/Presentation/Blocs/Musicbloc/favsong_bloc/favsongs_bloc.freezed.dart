// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favsongs_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavsongsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String songid) checkforfav,
    required TResult Function(AlbumElements song, bool isadded) addtofav,
    required TResult Function(String id) removefromfav,
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String songid)? checkforfav,
    TResult? Function(AlbumElements song, bool isadded)? addtofav,
    TResult? Function(String id)? removefromfav,
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String songid)? checkforfav,
    TResult Function(AlbumElements song, bool isadded)? addtofav,
    TResult Function(String id)? removefromfav,
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Checkforfavsong value) checkforfav,
    required TResult Function(_Addtofav value) addtofav,
    required TResult Function(_Removefromfav value) removefromfav,
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Checkforfavsong value)? checkforfav,
    TResult? Function(_Addtofav value)? addtofav,
    TResult? Function(_Removefromfav value)? removefromfav,
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Checkforfavsong value)? checkforfav,
    TResult Function(_Addtofav value)? addtofav,
    TResult Function(_Removefromfav value)? removefromfav,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavsongsEventCopyWith<$Res> {
  factory $FavsongsEventCopyWith(
          FavsongsEvent value, $Res Function(FavsongsEvent) then) =
      _$FavsongsEventCopyWithImpl<$Res, FavsongsEvent>;
}

/// @nodoc
class _$FavsongsEventCopyWithImpl<$Res, $Val extends FavsongsEvent>
    implements $FavsongsEventCopyWith<$Res> {
  _$FavsongsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckforfavsongImplCopyWith<$Res> {
  factory _$$CheckforfavsongImplCopyWith(_$CheckforfavsongImpl value,
          $Res Function(_$CheckforfavsongImpl) then) =
      __$$CheckforfavsongImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String songid});
}

/// @nodoc
class __$$CheckforfavsongImplCopyWithImpl<$Res>
    extends _$FavsongsEventCopyWithImpl<$Res, _$CheckforfavsongImpl>
    implements _$$CheckforfavsongImplCopyWith<$Res> {
  __$$CheckforfavsongImplCopyWithImpl(
      _$CheckforfavsongImpl _value, $Res Function(_$CheckforfavsongImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songid = null,
  }) {
    return _then(_$CheckforfavsongImpl(
      null == songid
          ? _value.songid
          : songid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckforfavsongImpl implements _Checkforfavsong {
  const _$CheckforfavsongImpl(this.songid);

  @override
  final String songid;

  @override
  String toString() {
    return 'FavsongsEvent.checkforfav(songid: $songid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckforfavsongImpl &&
            (identical(other.songid, songid) || other.songid == songid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, songid);

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckforfavsongImplCopyWith<_$CheckforfavsongImpl> get copyWith =>
      __$$CheckforfavsongImplCopyWithImpl<_$CheckforfavsongImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String songid) checkforfav,
    required TResult Function(AlbumElements song, bool isadded) addtofav,
    required TResult Function(String id) removefromfav,
    required TResult Function() started,
  }) {
    return checkforfav(songid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String songid)? checkforfav,
    TResult? Function(AlbumElements song, bool isadded)? addtofav,
    TResult? Function(String id)? removefromfav,
    TResult? Function()? started,
  }) {
    return checkforfav?.call(songid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String songid)? checkforfav,
    TResult Function(AlbumElements song, bool isadded)? addtofav,
    TResult Function(String id)? removefromfav,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (checkforfav != null) {
      return checkforfav(songid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Checkforfavsong value) checkforfav,
    required TResult Function(_Addtofav value) addtofav,
    required TResult Function(_Removefromfav value) removefromfav,
    required TResult Function(_Started value) started,
  }) {
    return checkforfav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Checkforfavsong value)? checkforfav,
    TResult? Function(_Addtofav value)? addtofav,
    TResult? Function(_Removefromfav value)? removefromfav,
    TResult? Function(_Started value)? started,
  }) {
    return checkforfav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Checkforfavsong value)? checkforfav,
    TResult Function(_Addtofav value)? addtofav,
    TResult Function(_Removefromfav value)? removefromfav,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (checkforfav != null) {
      return checkforfav(this);
    }
    return orElse();
  }
}

abstract class _Checkforfavsong implements FavsongsEvent {
  const factory _Checkforfavsong(final String songid) = _$CheckforfavsongImpl;

  String get songid;

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckforfavsongImplCopyWith<_$CheckforfavsongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddtofavImplCopyWith<$Res> {
  factory _$$AddtofavImplCopyWith(
          _$AddtofavImpl value, $Res Function(_$AddtofavImpl) then) =
      __$$AddtofavImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AlbumElements song, bool isadded});
}

/// @nodoc
class __$$AddtofavImplCopyWithImpl<$Res>
    extends _$FavsongsEventCopyWithImpl<$Res, _$AddtofavImpl>
    implements _$$AddtofavImplCopyWith<$Res> {
  __$$AddtofavImplCopyWithImpl(
      _$AddtofavImpl _value, $Res Function(_$AddtofavImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
    Object? isadded = null,
  }) {
    return _then(_$AddtofavImpl(
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as AlbumElements,
      null == isadded
          ? _value.isadded
          : isadded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddtofavImpl implements _Addtofav {
  const _$AddtofavImpl(this.song, this.isadded);

  @override
  final AlbumElements song;
  @override
  final bool isadded;

  @override
  String toString() {
    return 'FavsongsEvent.addtofav(song: $song, isadded: $isadded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddtofavImpl &&
            (identical(other.song, song) || other.song == song) &&
            (identical(other.isadded, isadded) || other.isadded == isadded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, song, isadded);

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddtofavImplCopyWith<_$AddtofavImpl> get copyWith =>
      __$$AddtofavImplCopyWithImpl<_$AddtofavImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String songid) checkforfav,
    required TResult Function(AlbumElements song, bool isadded) addtofav,
    required TResult Function(String id) removefromfav,
    required TResult Function() started,
  }) {
    return addtofav(song, isadded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String songid)? checkforfav,
    TResult? Function(AlbumElements song, bool isadded)? addtofav,
    TResult? Function(String id)? removefromfav,
    TResult? Function()? started,
  }) {
    return addtofav?.call(song, isadded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String songid)? checkforfav,
    TResult Function(AlbumElements song, bool isadded)? addtofav,
    TResult Function(String id)? removefromfav,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (addtofav != null) {
      return addtofav(song, isadded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Checkforfavsong value) checkforfav,
    required TResult Function(_Addtofav value) addtofav,
    required TResult Function(_Removefromfav value) removefromfav,
    required TResult Function(_Started value) started,
  }) {
    return addtofav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Checkforfavsong value)? checkforfav,
    TResult? Function(_Addtofav value)? addtofav,
    TResult? Function(_Removefromfav value)? removefromfav,
    TResult? Function(_Started value)? started,
  }) {
    return addtofav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Checkforfavsong value)? checkforfav,
    TResult Function(_Addtofav value)? addtofav,
    TResult Function(_Removefromfav value)? removefromfav,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (addtofav != null) {
      return addtofav(this);
    }
    return orElse();
  }
}

abstract class _Addtofav implements FavsongsEvent {
  const factory _Addtofav(final AlbumElements song, final bool isadded) =
      _$AddtofavImpl;

  AlbumElements get song;
  bool get isadded;

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddtofavImplCopyWith<_$AddtofavImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovefromfavImplCopyWith<$Res> {
  factory _$$RemovefromfavImplCopyWith(
          _$RemovefromfavImpl value, $Res Function(_$RemovefromfavImpl) then) =
      __$$RemovefromfavImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemovefromfavImplCopyWithImpl<$Res>
    extends _$FavsongsEventCopyWithImpl<$Res, _$RemovefromfavImpl>
    implements _$$RemovefromfavImplCopyWith<$Res> {
  __$$RemovefromfavImplCopyWithImpl(
      _$RemovefromfavImpl _value, $Res Function(_$RemovefromfavImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemovefromfavImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemovefromfavImpl implements _Removefromfav {
  const _$RemovefromfavImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'FavsongsEvent.removefromfav(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovefromfavImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovefromfavImplCopyWith<_$RemovefromfavImpl> get copyWith =>
      __$$RemovefromfavImplCopyWithImpl<_$RemovefromfavImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String songid) checkforfav,
    required TResult Function(AlbumElements song, bool isadded) addtofav,
    required TResult Function(String id) removefromfav,
    required TResult Function() started,
  }) {
    return removefromfav(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String songid)? checkforfav,
    TResult? Function(AlbumElements song, bool isadded)? addtofav,
    TResult? Function(String id)? removefromfav,
    TResult? Function()? started,
  }) {
    return removefromfav?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String songid)? checkforfav,
    TResult Function(AlbumElements song, bool isadded)? addtofav,
    TResult Function(String id)? removefromfav,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (removefromfav != null) {
      return removefromfav(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Checkforfavsong value) checkforfav,
    required TResult Function(_Addtofav value) addtofav,
    required TResult Function(_Removefromfav value) removefromfav,
    required TResult Function(_Started value) started,
  }) {
    return removefromfav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Checkforfavsong value)? checkforfav,
    TResult? Function(_Addtofav value)? addtofav,
    TResult? Function(_Removefromfav value)? removefromfav,
    TResult? Function(_Started value)? started,
  }) {
    return removefromfav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Checkforfavsong value)? checkforfav,
    TResult Function(_Addtofav value)? addtofav,
    TResult Function(_Removefromfav value)? removefromfav,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (removefromfav != null) {
      return removefromfav(this);
    }
    return orElse();
  }
}

abstract class _Removefromfav implements FavsongsEvent {
  const factory _Removefromfav(final String id) = _$RemovefromfavImpl;

  String get id;

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemovefromfavImplCopyWith<_$RemovefromfavImpl> get copyWith =>
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
    extends _$FavsongsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavsongsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'FavsongsEvent.started()';
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
    required TResult Function(String songid) checkforfav,
    required TResult Function(AlbumElements song, bool isadded) addtofav,
    required TResult Function(String id) removefromfav,
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String songid)? checkforfav,
    TResult? Function(AlbumElements song, bool isadded)? addtofav,
    TResult? Function(String id)? removefromfav,
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String songid)? checkforfav,
    TResult Function(AlbumElements song, bool isadded)? addtofav,
    TResult Function(String id)? removefromfav,
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
    required TResult Function(_Checkforfavsong value) checkforfav,
    required TResult Function(_Addtofav value) addtofav,
    required TResult Function(_Removefromfav value) removefromfav,
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Checkforfavsong value)? checkforfav,
    TResult? Function(_Addtofav value)? addtofav,
    TResult? Function(_Removefromfav value)? removefromfav,
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Checkforfavsong value)? checkforfav,
    TResult Function(_Addtofav value)? addtofav,
    TResult Function(_Removefromfav value)? removefromfav,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements FavsongsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$FavsongsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notpresent,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() initial,
    required TResult Function() added,
    required TResult Function() removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notpresent,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notpresent,
    TResult Function(bool ispresent)? ispresent,
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? removed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Notpresent value) notpresent,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Notpresent value)? notpresent,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Notpresent value)? notpresent,
    TResult Function(_Ispresent value)? ispresent,
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Removed value)? removed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavsongsStateCopyWith<$Res> {
  factory $FavsongsStateCopyWith(
          FavsongsState value, $Res Function(FavsongsState) then) =
      _$FavsongsStateCopyWithImpl<$Res, FavsongsState>;
}

/// @nodoc
class _$FavsongsStateCopyWithImpl<$Res, $Val extends FavsongsState>
    implements $FavsongsStateCopyWith<$Res> {
  _$FavsongsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavsongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NotpresentImplCopyWith<$Res> {
  factory _$$NotpresentImplCopyWith(
          _$NotpresentImpl value, $Res Function(_$NotpresentImpl) then) =
      __$$NotpresentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotpresentImplCopyWithImpl<$Res>
    extends _$FavsongsStateCopyWithImpl<$Res, _$NotpresentImpl>
    implements _$$NotpresentImplCopyWith<$Res> {
  __$$NotpresentImplCopyWithImpl(
      _$NotpresentImpl _value, $Res Function(_$NotpresentImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavsongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotpresentImpl implements _Notpresent {
  const _$NotpresentImpl();

  @override
  String toString() {
    return 'FavsongsState.notpresent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotpresentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notpresent,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() initial,
    required TResult Function() added,
    required TResult Function() removed,
  }) {
    return notpresent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notpresent,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) {
    return notpresent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notpresent,
    TResult Function(bool ispresent)? ispresent,
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? removed,
    required TResult orElse(),
  }) {
    if (notpresent != null) {
      return notpresent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Notpresent value) notpresent,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) {
    return notpresent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Notpresent value)? notpresent,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) {
    return notpresent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Notpresent value)? notpresent,
    TResult Function(_Ispresent value)? ispresent,
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Removed value)? removed,
    required TResult orElse(),
  }) {
    if (notpresent != null) {
      return notpresent(this);
    }
    return orElse();
  }
}

abstract class _Notpresent implements FavsongsState {
  const factory _Notpresent() = _$NotpresentImpl;
}

/// @nodoc
abstract class _$$IspresentImplCopyWith<$Res> {
  factory _$$IspresentImplCopyWith(
          _$IspresentImpl value, $Res Function(_$IspresentImpl) then) =
      __$$IspresentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool ispresent});
}

/// @nodoc
class __$$IspresentImplCopyWithImpl<$Res>
    extends _$FavsongsStateCopyWithImpl<$Res, _$IspresentImpl>
    implements _$$IspresentImplCopyWith<$Res> {
  __$$IspresentImplCopyWithImpl(
      _$IspresentImpl _value, $Res Function(_$IspresentImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavsongsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ispresent = null,
  }) {
    return _then(_$IspresentImpl(
      null == ispresent
          ? _value.ispresent
          : ispresent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IspresentImpl implements _Ispresent {
  const _$IspresentImpl(this.ispresent);

  @override
  final bool ispresent;

  @override
  String toString() {
    return 'FavsongsState.ispresent(ispresent: $ispresent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IspresentImpl &&
            (identical(other.ispresent, ispresent) ||
                other.ispresent == ispresent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ispresent);

  /// Create a copy of FavsongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IspresentImplCopyWith<_$IspresentImpl> get copyWith =>
      __$$IspresentImplCopyWithImpl<_$IspresentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notpresent,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() initial,
    required TResult Function() added,
    required TResult Function() removed,
  }) {
    return ispresent(this.ispresent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notpresent,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) {
    return ispresent?.call(this.ispresent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notpresent,
    TResult Function(bool ispresent)? ispresent,
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? removed,
    required TResult orElse(),
  }) {
    if (ispresent != null) {
      return ispresent(this.ispresent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Notpresent value) notpresent,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) {
    return ispresent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Notpresent value)? notpresent,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) {
    return ispresent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Notpresent value)? notpresent,
    TResult Function(_Ispresent value)? ispresent,
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Removed value)? removed,
    required TResult orElse(),
  }) {
    if (ispresent != null) {
      return ispresent(this);
    }
    return orElse();
  }
}

abstract class _Ispresent implements FavsongsState {
  const factory _Ispresent(final bool ispresent) = _$IspresentImpl;

  bool get ispresent;

  /// Create a copy of FavsongsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IspresentImplCopyWith<_$IspresentImpl> get copyWith =>
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
    extends _$FavsongsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavsongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FavsongsState.initial()';
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
    required TResult Function() notpresent,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() initial,
    required TResult Function() added,
    required TResult Function() removed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notpresent,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notpresent,
    TResult Function(bool ispresent)? ispresent,
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? removed,
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
    required TResult Function(_Notpresent value) notpresent,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Notpresent value)? notpresent,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Notpresent value)? notpresent,
    TResult Function(_Ispresent value)? ispresent,
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Removed value)? removed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FavsongsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddedImplCopyWith<$Res> {
  factory _$$AddedImplCopyWith(
          _$AddedImpl value, $Res Function(_$AddedImpl) then) =
      __$$AddedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddedImplCopyWithImpl<$Res>
    extends _$FavsongsStateCopyWithImpl<$Res, _$AddedImpl>
    implements _$$AddedImplCopyWith<$Res> {
  __$$AddedImplCopyWithImpl(
      _$AddedImpl _value, $Res Function(_$AddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavsongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddedImpl implements _Added {
  const _$AddedImpl();

  @override
  String toString() {
    return 'FavsongsState.added()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notpresent,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() initial,
    required TResult Function() added,
    required TResult Function() removed,
  }) {
    return added();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notpresent,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) {
    return added?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notpresent,
    TResult Function(bool ispresent)? ispresent,
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? removed,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Notpresent value) notpresent,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Notpresent value)? notpresent,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Notpresent value)? notpresent,
    TResult Function(_Ispresent value)? ispresent,
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Removed value)? removed,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _Added implements FavsongsState {
  const factory _Added() = _$AddedImpl;
}

/// @nodoc
abstract class _$$RemovedImplCopyWith<$Res> {
  factory _$$RemovedImplCopyWith(
          _$RemovedImpl value, $Res Function(_$RemovedImpl) then) =
      __$$RemovedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemovedImplCopyWithImpl<$Res>
    extends _$FavsongsStateCopyWithImpl<$Res, _$RemovedImpl>
    implements _$$RemovedImplCopyWith<$Res> {
  __$$RemovedImplCopyWithImpl(
      _$RemovedImpl _value, $Res Function(_$RemovedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavsongsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RemovedImpl implements _Removed {
  const _$RemovedImpl();

  @override
  String toString() {
    return 'FavsongsState.removed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RemovedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notpresent,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() initial,
    required TResult Function() added,
    required TResult Function() removed,
  }) {
    return removed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notpresent,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? initial,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) {
    return removed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notpresent,
    TResult Function(bool ispresent)? ispresent,
    TResult Function()? initial,
    TResult Function()? added,
    TResult Function()? removed,
    required TResult orElse(),
  }) {
    if (removed != null) {
      return removed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Notpresent value) notpresent,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) {
    return removed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Notpresent value)? notpresent,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) {
    return removed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Notpresent value)? notpresent,
    TResult Function(_Ispresent value)? ispresent,
    TResult Function(_Initial value)? initial,
    TResult Function(_Added value)? added,
    TResult Function(_Removed value)? removed,
    required TResult orElse(),
  }) {
    if (removed != null) {
      return removed(this);
    }
    return orElse();
  }
}

abstract class _Removed implements FavsongsState {
  const factory _Removed() = _$RemovedImpl;
}
