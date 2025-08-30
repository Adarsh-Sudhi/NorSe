// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favoriteplaylist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteplaylistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) removesongs,
    required TResult Function(List<Map<String, dynamic>> newlist) updatelist,
    required TResult Function() getallsongs,
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? removesongs,
    TResult? Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult? Function()? getallsongs,
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? removesongs,
    TResult Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult Function()? getallsongs,
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Removesongs value) removesongs,
    required TResult Function(_Updatelist value) updatelist,
    required TResult Function(_Getallsongs value) getallsongs,
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removesongs value)? removesongs,
    TResult? Function(_Updatelist value)? updatelist,
    TResult? Function(_Getallsongs value)? getallsongs,
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removesongs value)? removesongs,
    TResult Function(_Updatelist value)? updatelist,
    TResult Function(_Getallsongs value)? getallsongs,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteplaylistEventCopyWith<$Res> {
  factory $FavoriteplaylistEventCopyWith(FavoriteplaylistEvent value,
          $Res Function(FavoriteplaylistEvent) then) =
      _$FavoriteplaylistEventCopyWithImpl<$Res, FavoriteplaylistEvent>;
}

/// @nodoc
class _$FavoriteplaylistEventCopyWithImpl<$Res,
        $Val extends FavoriteplaylistEvent>
    implements $FavoriteplaylistEventCopyWith<$Res> {
  _$FavoriteplaylistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteplaylistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RemovesongsImplCopyWith<$Res> {
  factory _$$RemovesongsImplCopyWith(
          _$RemovesongsImpl value, $Res Function(_$RemovesongsImpl) then) =
      __$$RemovesongsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemovesongsImplCopyWithImpl<$Res>
    extends _$FavoriteplaylistEventCopyWithImpl<$Res, _$RemovesongsImpl>
    implements _$$RemovesongsImplCopyWith<$Res> {
  __$$RemovesongsImplCopyWithImpl(
      _$RemovesongsImpl _value, $Res Function(_$RemovesongsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteplaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemovesongsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemovesongsImpl implements _Removesongs {
  const _$RemovesongsImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'FavoriteplaylistEvent.removesongs(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovesongsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of FavoriteplaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovesongsImplCopyWith<_$RemovesongsImpl> get copyWith =>
      __$$RemovesongsImplCopyWithImpl<_$RemovesongsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) removesongs,
    required TResult Function(List<Map<String, dynamic>> newlist) updatelist,
    required TResult Function() getallsongs,
    required TResult Function() started,
  }) {
    return removesongs(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? removesongs,
    TResult? Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult? Function()? getallsongs,
    TResult? Function()? started,
  }) {
    return removesongs?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? removesongs,
    TResult Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult Function()? getallsongs,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (removesongs != null) {
      return removesongs(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Removesongs value) removesongs,
    required TResult Function(_Updatelist value) updatelist,
    required TResult Function(_Getallsongs value) getallsongs,
    required TResult Function(_Started value) started,
  }) {
    return removesongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removesongs value)? removesongs,
    TResult? Function(_Updatelist value)? updatelist,
    TResult? Function(_Getallsongs value)? getallsongs,
    TResult? Function(_Started value)? started,
  }) {
    return removesongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removesongs value)? removesongs,
    TResult Function(_Updatelist value)? updatelist,
    TResult Function(_Getallsongs value)? getallsongs,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (removesongs != null) {
      return removesongs(this);
    }
    return orElse();
  }
}

abstract class _Removesongs implements FavoriteplaylistEvent {
  const factory _Removesongs(final String id) = _$RemovesongsImpl;

  String get id;

  /// Create a copy of FavoriteplaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemovesongsImplCopyWith<_$RemovesongsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatelistImplCopyWith<$Res> {
  factory _$$UpdatelistImplCopyWith(
          _$UpdatelistImpl value, $Res Function(_$UpdatelistImpl) then) =
      __$$UpdatelistImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> newlist});
}

/// @nodoc
class __$$UpdatelistImplCopyWithImpl<$Res>
    extends _$FavoriteplaylistEventCopyWithImpl<$Res, _$UpdatelistImpl>
    implements _$$UpdatelistImplCopyWith<$Res> {
  __$$UpdatelistImplCopyWithImpl(
      _$UpdatelistImpl _value, $Res Function(_$UpdatelistImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteplaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newlist = null,
  }) {
    return _then(_$UpdatelistImpl(
      null == newlist
          ? _value._newlist
          : newlist // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$UpdatelistImpl implements _Updatelist {
  const _$UpdatelistImpl(final List<Map<String, dynamic>> newlist)
      : _newlist = newlist;

  final List<Map<String, dynamic>> _newlist;
  @override
  List<Map<String, dynamic>> get newlist {
    if (_newlist is EqualUnmodifiableListView) return _newlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newlist);
  }

  @override
  String toString() {
    return 'FavoriteplaylistEvent.updatelist(newlist: $newlist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatelistImpl &&
            const DeepCollectionEquality().equals(other._newlist, _newlist));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_newlist));

  /// Create a copy of FavoriteplaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatelistImplCopyWith<_$UpdatelistImpl> get copyWith =>
      __$$UpdatelistImplCopyWithImpl<_$UpdatelistImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) removesongs,
    required TResult Function(List<Map<String, dynamic>> newlist) updatelist,
    required TResult Function() getallsongs,
    required TResult Function() started,
  }) {
    return updatelist(newlist);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? removesongs,
    TResult? Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult? Function()? getallsongs,
    TResult? Function()? started,
  }) {
    return updatelist?.call(newlist);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? removesongs,
    TResult Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult Function()? getallsongs,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (updatelist != null) {
      return updatelist(newlist);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Removesongs value) removesongs,
    required TResult Function(_Updatelist value) updatelist,
    required TResult Function(_Getallsongs value) getallsongs,
    required TResult Function(_Started value) started,
  }) {
    return updatelist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removesongs value)? removesongs,
    TResult? Function(_Updatelist value)? updatelist,
    TResult? Function(_Getallsongs value)? getallsongs,
    TResult? Function(_Started value)? started,
  }) {
    return updatelist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removesongs value)? removesongs,
    TResult Function(_Updatelist value)? updatelist,
    TResult Function(_Getallsongs value)? getallsongs,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (updatelist != null) {
      return updatelist(this);
    }
    return orElse();
  }
}

abstract class _Updatelist implements FavoriteplaylistEvent {
  const factory _Updatelist(final List<Map<String, dynamic>> newlist) =
      _$UpdatelistImpl;

  List<Map<String, dynamic>> get newlist;

  /// Create a copy of FavoriteplaylistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatelistImplCopyWith<_$UpdatelistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetallsongsImplCopyWith<$Res> {
  factory _$$GetallsongsImplCopyWith(
          _$GetallsongsImpl value, $Res Function(_$GetallsongsImpl) then) =
      __$$GetallsongsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetallsongsImplCopyWithImpl<$Res>
    extends _$FavoriteplaylistEventCopyWithImpl<$Res, _$GetallsongsImpl>
    implements _$$GetallsongsImplCopyWith<$Res> {
  __$$GetallsongsImplCopyWithImpl(
      _$GetallsongsImpl _value, $Res Function(_$GetallsongsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteplaylistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetallsongsImpl implements _Getallsongs {
  const _$GetallsongsImpl();

  @override
  String toString() {
    return 'FavoriteplaylistEvent.getallsongs()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetallsongsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) removesongs,
    required TResult Function(List<Map<String, dynamic>> newlist) updatelist,
    required TResult Function() getallsongs,
    required TResult Function() started,
  }) {
    return getallsongs();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? removesongs,
    TResult? Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult? Function()? getallsongs,
    TResult? Function()? started,
  }) {
    return getallsongs?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? removesongs,
    TResult Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult Function()? getallsongs,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (getallsongs != null) {
      return getallsongs();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Removesongs value) removesongs,
    required TResult Function(_Updatelist value) updatelist,
    required TResult Function(_Getallsongs value) getallsongs,
    required TResult Function(_Started value) started,
  }) {
    return getallsongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removesongs value)? removesongs,
    TResult? Function(_Updatelist value)? updatelist,
    TResult? Function(_Getallsongs value)? getallsongs,
    TResult? Function(_Started value)? started,
  }) {
    return getallsongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removesongs value)? removesongs,
    TResult Function(_Updatelist value)? updatelist,
    TResult Function(_Getallsongs value)? getallsongs,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (getallsongs != null) {
      return getallsongs(this);
    }
    return orElse();
  }
}

abstract class _Getallsongs implements FavoriteplaylistEvent {
  const factory _Getallsongs() = _$GetallsongsImpl;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$FavoriteplaylistEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteplaylistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'FavoriteplaylistEvent.started()';
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
    required TResult Function(String id) removesongs,
    required TResult Function(List<Map<String, dynamic>> newlist) updatelist,
    required TResult Function() getallsongs,
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? removesongs,
    TResult? Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult? Function()? getallsongs,
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? removesongs,
    TResult Function(List<Map<String, dynamic>> newlist)? updatelist,
    TResult Function()? getallsongs,
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
    required TResult Function(_Removesongs value) removesongs,
    required TResult Function(_Updatelist value) updatelist,
    required TResult Function(_Getallsongs value) getallsongs,
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Removesongs value)? removesongs,
    TResult? Function(_Updatelist value)? updatelist,
    TResult? Function(_Getallsongs value)? getallsongs,
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Removesongs value)? removesongs,
    TResult Function(_Updatelist value)? updatelist,
    TResult Function(_Getallsongs value)? getallsongs,
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements FavoriteplaylistEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$FavoriteplaylistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> songs) favsongs,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> songs)? favsongs,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> songs)? favsongs,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Allsongs value) favsongs,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Allsongs value)? favsongs,
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Allsongs value)? favsongs,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteplaylistStateCopyWith<$Res> {
  factory $FavoriteplaylistStateCopyWith(FavoriteplaylistState value,
          $Res Function(FavoriteplaylistState) then) =
      _$FavoriteplaylistStateCopyWithImpl<$Res, FavoriteplaylistState>;
}

/// @nodoc
class _$FavoriteplaylistStateCopyWithImpl<$Res,
        $Val extends FavoriteplaylistState>
    implements $FavoriteplaylistStateCopyWith<$Res> {
  _$FavoriteplaylistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteplaylistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AllsongsImplCopyWith<$Res> {
  factory _$$AllsongsImplCopyWith(
          _$AllsongsImpl value, $Res Function(_$AllsongsImpl) then) =
      __$$AllsongsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> songs});
}

/// @nodoc
class __$$AllsongsImplCopyWithImpl<$Res>
    extends _$FavoriteplaylistStateCopyWithImpl<$Res, _$AllsongsImpl>
    implements _$$AllsongsImplCopyWith<$Res> {
  __$$AllsongsImplCopyWithImpl(
      _$AllsongsImpl _value, $Res Function(_$AllsongsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteplaylistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songs = null,
  }) {
    return _then(_$AllsongsImpl(
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$AllsongsImpl implements _Allsongs {
  const _$AllsongsImpl(final List<Map<String, dynamic>> songs) : _songs = songs;

  final List<Map<String, dynamic>> _songs;
  @override
  List<Map<String, dynamic>> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  @override
  String toString() {
    return 'FavoriteplaylistState.favsongs(songs: $songs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllsongsImpl &&
            const DeepCollectionEquality().equals(other._songs, _songs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_songs));

  /// Create a copy of FavoriteplaylistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllsongsImplCopyWith<_$AllsongsImpl> get copyWith =>
      __$$AllsongsImplCopyWithImpl<_$AllsongsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Map<String, dynamic>> songs) favsongs,
    required TResult Function() initial,
  }) {
    return favsongs(songs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> songs)? favsongs,
    TResult? Function()? initial,
  }) {
    return favsongs?.call(songs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> songs)? favsongs,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (favsongs != null) {
      return favsongs(songs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Allsongs value) favsongs,
    required TResult Function(_Initial value) initial,
  }) {
    return favsongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Allsongs value)? favsongs,
    TResult? Function(_Initial value)? initial,
  }) {
    return favsongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Allsongs value)? favsongs,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (favsongs != null) {
      return favsongs(this);
    }
    return orElse();
  }
}

abstract class _Allsongs implements FavoriteplaylistState {
  const factory _Allsongs(final List<Map<String, dynamic>> songs) =
      _$AllsongsImpl;

  List<Map<String, dynamic>> get songs;

  /// Create a copy of FavoriteplaylistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllsongsImplCopyWith<_$AllsongsImpl> get copyWith =>
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
    extends _$FavoriteplaylistStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteplaylistState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FavoriteplaylistState.initial()';
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
    required TResult Function(List<Map<String, dynamic>> songs) favsongs,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Map<String, dynamic>> songs)? favsongs,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Map<String, dynamic>> songs)? favsongs,
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
    required TResult Function(_Allsongs value) favsongs,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Allsongs value)? favsongs,
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Allsongs value)? favsongs,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FavoriteplaylistState {
  const factory _Initial() = _$InitialImpl;
}
