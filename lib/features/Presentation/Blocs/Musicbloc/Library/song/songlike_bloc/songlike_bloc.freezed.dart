// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songlike_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SonglikeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id) checkifpresent,
    required TResult Function(String type, AlbumElements song) addtolibray,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id)? checkifpresent,
    TResult? Function(String type, AlbumElements song)? addtolibray,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? checkifpresent,
    TResult Function(String type, AlbumElements song)? addtolibray,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_checkifpresent value) checkifpresent,
    required TResult Function(_Addtolibrary value) addtolibray,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_checkifpresent value)? checkifpresent,
    TResult? Function(_Addtolibrary value)? addtolibray,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_checkifpresent value)? checkifpresent,
    TResult Function(_Addtolibrary value)? addtolibray,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SonglikeEventCopyWith<$Res> {
  factory $SonglikeEventCopyWith(
          SonglikeEvent value, $Res Function(SonglikeEvent) then) =
      _$SonglikeEventCopyWithImpl<$Res, SonglikeEvent>;
}

/// @nodoc
class _$SonglikeEventCopyWithImpl<$Res, $Val extends SonglikeEvent>
    implements $SonglikeEventCopyWith<$Res> {
  _$SonglikeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SonglikeEvent
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
    extends _$SonglikeEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SonglikeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SonglikeEvent.started()';
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
    required TResult Function(String id) checkifpresent,
    required TResult Function(String type, AlbumElements song) addtolibray,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id)? checkifpresent,
    TResult? Function(String type, AlbumElements song)? addtolibray,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? checkifpresent,
    TResult Function(String type, AlbumElements song)? addtolibray,
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
    required TResult Function(_checkifpresent value) checkifpresent,
    required TResult Function(_Addtolibrary value) addtolibray,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_checkifpresent value)? checkifpresent,
    TResult? Function(_Addtolibrary value)? addtolibray,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_checkifpresent value)? checkifpresent,
    TResult Function(_Addtolibrary value)? addtolibray,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SonglikeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$checkifpresentImplCopyWith<$Res> {
  factory _$$checkifpresentImplCopyWith(_$checkifpresentImpl value,
          $Res Function(_$checkifpresentImpl) then) =
      __$$checkifpresentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$checkifpresentImplCopyWithImpl<$Res>
    extends _$SonglikeEventCopyWithImpl<$Res, _$checkifpresentImpl>
    implements _$$checkifpresentImplCopyWith<$Res> {
  __$$checkifpresentImplCopyWithImpl(
      _$checkifpresentImpl _value, $Res Function(_$checkifpresentImpl) _then)
      : super(_value, _then);

  /// Create a copy of SonglikeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$checkifpresentImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$checkifpresentImpl implements _checkifpresent {
  const _$checkifpresentImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'SonglikeEvent.checkifpresent(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$checkifpresentImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of SonglikeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$checkifpresentImplCopyWith<_$checkifpresentImpl> get copyWith =>
      __$$checkifpresentImplCopyWithImpl<_$checkifpresentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id) checkifpresent,
    required TResult Function(String type, AlbumElements song) addtolibray,
  }) {
    return checkifpresent(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id)? checkifpresent,
    TResult? Function(String type, AlbumElements song)? addtolibray,
  }) {
    return checkifpresent?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? checkifpresent,
    TResult Function(String type, AlbumElements song)? addtolibray,
    required TResult orElse(),
  }) {
    if (checkifpresent != null) {
      return checkifpresent(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_checkifpresent value) checkifpresent,
    required TResult Function(_Addtolibrary value) addtolibray,
  }) {
    return checkifpresent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_checkifpresent value)? checkifpresent,
    TResult? Function(_Addtolibrary value)? addtolibray,
  }) {
    return checkifpresent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_checkifpresent value)? checkifpresent,
    TResult Function(_Addtolibrary value)? addtolibray,
    required TResult orElse(),
  }) {
    if (checkifpresent != null) {
      return checkifpresent(this);
    }
    return orElse();
  }
}

abstract class _checkifpresent implements SonglikeEvent {
  const factory _checkifpresent(final String id) = _$checkifpresentImpl;

  String get id;

  /// Create a copy of SonglikeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$checkifpresentImplCopyWith<_$checkifpresentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddtolibraryImplCopyWith<$Res> {
  factory _$$AddtolibraryImplCopyWith(
          _$AddtolibraryImpl value, $Res Function(_$AddtolibraryImpl) then) =
      __$$AddtolibraryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String type, AlbumElements song});
}

/// @nodoc
class __$$AddtolibraryImplCopyWithImpl<$Res>
    extends _$SonglikeEventCopyWithImpl<$Res, _$AddtolibraryImpl>
    implements _$$AddtolibraryImplCopyWith<$Res> {
  __$$AddtolibraryImplCopyWithImpl(
      _$AddtolibraryImpl _value, $Res Function(_$AddtolibraryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SonglikeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? song = null,
  }) {
    return _then(_$AddtolibraryImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as AlbumElements,
    ));
  }
}

/// @nodoc

class _$AddtolibraryImpl implements _Addtolibrary {
  const _$AddtolibraryImpl(this.type, this.song);

  @override
  final String type;
  @override
  final AlbumElements song;

  @override
  String toString() {
    return 'SonglikeEvent.addtolibray(type: $type, song: $song)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddtolibraryImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.song, song) || other.song == song));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, song);

  /// Create a copy of SonglikeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddtolibraryImplCopyWith<_$AddtolibraryImpl> get copyWith =>
      __$$AddtolibraryImplCopyWithImpl<_$AddtolibraryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id) checkifpresent,
    required TResult Function(String type, AlbumElements song) addtolibray,
  }) {
    return addtolibray(type, song);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id)? checkifpresent,
    TResult? Function(String type, AlbumElements song)? addtolibray,
  }) {
    return addtolibray?.call(type, song);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? checkifpresent,
    TResult Function(String type, AlbumElements song)? addtolibray,
    required TResult orElse(),
  }) {
    if (addtolibray != null) {
      return addtolibray(type, song);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_checkifpresent value) checkifpresent,
    required TResult Function(_Addtolibrary value) addtolibray,
  }) {
    return addtolibray(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_checkifpresent value)? checkifpresent,
    TResult? Function(_Addtolibrary value)? addtolibray,
  }) {
    return addtolibray?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_checkifpresent value)? checkifpresent,
    TResult Function(_Addtolibrary value)? addtolibray,
    required TResult orElse(),
  }) {
    if (addtolibray != null) {
      return addtolibray(this);
    }
    return orElse();
  }
}

abstract class _Addtolibrary implements SonglikeEvent {
  const factory _Addtolibrary(final String type, final AlbumElements song) =
      _$AddtolibraryImpl;

  String get type;
  AlbumElements get song;

  /// Create a copy of SonglikeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddtolibraryImplCopyWith<_$AddtolibraryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SonglikeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() added,
    required TResult Function() removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool ispresent)? ispresent,
    TResult Function()? added,
    TResult Function()? removed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ispresent value)? ispresent,
    TResult Function(_Added value)? added,
    TResult Function(_Removed value)? removed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SonglikeStateCopyWith<$Res> {
  factory $SonglikeStateCopyWith(
          SonglikeState value, $Res Function(SonglikeState) then) =
      _$SonglikeStateCopyWithImpl<$Res, SonglikeState>;
}

/// @nodoc
class _$SonglikeStateCopyWithImpl<$Res, $Val extends SonglikeState>
    implements $SonglikeStateCopyWith<$Res> {
  _$SonglikeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SonglikeState
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
    extends _$SonglikeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SonglikeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SonglikeState.initial()';
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
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() added,
    required TResult Function() removed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool ispresent)? ispresent,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ispresent value)? ispresent,
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

abstract class _Initial implements SonglikeState {
  const factory _Initial() = _$InitialImpl;
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
    extends _$SonglikeStateCopyWithImpl<$Res, _$IspresentImpl>
    implements _$$IspresentImplCopyWith<$Res> {
  __$$IspresentImplCopyWithImpl(
      _$IspresentImpl _value, $Res Function(_$IspresentImpl) _then)
      : super(_value, _then);

  /// Create a copy of SonglikeState
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
    return 'SonglikeState.ispresent(ispresent: $ispresent)';
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

  /// Create a copy of SonglikeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IspresentImplCopyWith<_$IspresentImpl> get copyWith =>
      __$$IspresentImplCopyWithImpl<_$IspresentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() added,
    required TResult Function() removed,
  }) {
    return ispresent(this.ispresent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) {
    return ispresent?.call(this.ispresent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool ispresent)? ispresent,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) {
    return ispresent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) {
    return ispresent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ispresent value)? ispresent,
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

abstract class _Ispresent implements SonglikeState {
  const factory _Ispresent(final bool ispresent) = _$IspresentImpl;

  bool get ispresent;

  /// Create a copy of SonglikeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IspresentImplCopyWith<_$IspresentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddedImplCopyWith<$Res> {
  factory _$$AddedImplCopyWith(
          _$AddedImpl value, $Res Function(_$AddedImpl) then) =
      __$$AddedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddedImplCopyWithImpl<$Res>
    extends _$SonglikeStateCopyWithImpl<$Res, _$AddedImpl>
    implements _$$AddedImplCopyWith<$Res> {
  __$$AddedImplCopyWithImpl(
      _$AddedImpl _value, $Res Function(_$AddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SonglikeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddedImpl implements _Added {
  const _$AddedImpl();

  @override
  String toString() {
    return 'SonglikeState.added()';
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
    required TResult Function() initial,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() added,
    required TResult Function() removed,
  }) {
    return added();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) {
    return added?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool ispresent)? ispresent,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ispresent value)? ispresent,
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

abstract class _Added implements SonglikeState {
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
    extends _$SonglikeStateCopyWithImpl<$Res, _$RemovedImpl>
    implements _$$RemovedImplCopyWith<$Res> {
  __$$RemovedImplCopyWithImpl(
      _$RemovedImpl _value, $Res Function(_$RemovedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SonglikeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RemovedImpl implements _Removed {
  const _$RemovedImpl();

  @override
  String toString() {
    return 'SonglikeState.removed()';
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
    required TResult Function() initial,
    required TResult Function(bool ispresent) ispresent,
    required TResult Function() added,
    required TResult Function() removed,
  }) {
    return removed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool ispresent)? ispresent,
    TResult? Function()? added,
    TResult? Function()? removed,
  }) {
    return removed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool ispresent)? ispresent,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ispresent value) ispresent,
    required TResult Function(_Added value) added,
    required TResult Function(_Removed value) removed,
  }) {
    return removed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ispresent value)? ispresent,
    TResult? Function(_Added value)? added,
    TResult? Function(_Removed value)? removed,
  }) {
    return removed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ispresent value)? ispresent,
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

abstract class _Removed implements SonglikeState {
  const factory _Removed() = _$RemovedImpl;
}
