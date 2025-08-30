// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recents_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecentsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getallrecent,
    required TResult Function() clearecents,
    required TResult Function(String id) removesong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getallrecent,
    TResult? Function()? clearecents,
    TResult? Function(String id)? removesong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getallrecent,
    TResult Function()? clearecents,
    TResult Function(String id)? removesong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getallrecents value) getallrecent,
    required TResult Function(_Clearrecent value) clearecents,
    required TResult Function(_Removesong value) removesong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getallrecents value)? getallrecent,
    TResult? Function(_Clearrecent value)? clearecents,
    TResult? Function(_Removesong value)? removesong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getallrecents value)? getallrecent,
    TResult Function(_Clearrecent value)? clearecents,
    TResult Function(_Removesong value)? removesong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentsEventCopyWith<$Res> {
  factory $RecentsEventCopyWith(
          RecentsEvent value, $Res Function(RecentsEvent) then) =
      _$RecentsEventCopyWithImpl<$Res, RecentsEvent>;
}

/// @nodoc
class _$RecentsEventCopyWithImpl<$Res, $Val extends RecentsEvent>
    implements $RecentsEventCopyWith<$Res> {
  _$RecentsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentsEvent
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
    extends _$RecentsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'RecentsEvent.started()';
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
    required TResult Function() getallrecent,
    required TResult Function() clearecents,
    required TResult Function(String id) removesong,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getallrecent,
    TResult? Function()? clearecents,
    TResult? Function(String id)? removesong,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getallrecent,
    TResult Function()? clearecents,
    TResult Function(String id)? removesong,
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
    required TResult Function(_Getallrecents value) getallrecent,
    required TResult Function(_Clearrecent value) clearecents,
    required TResult Function(_Removesong value) removesong,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getallrecents value)? getallrecent,
    TResult? Function(_Clearrecent value)? clearecents,
    TResult? Function(_Removesong value)? removesong,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getallrecents value)? getallrecent,
    TResult Function(_Clearrecent value)? clearecents,
    TResult Function(_Removesong value)? removesong,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RecentsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetallrecentsImplCopyWith<$Res> {
  factory _$$GetallrecentsImplCopyWith(
          _$GetallrecentsImpl value, $Res Function(_$GetallrecentsImpl) then) =
      __$$GetallrecentsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetallrecentsImplCopyWithImpl<$Res>
    extends _$RecentsEventCopyWithImpl<$Res, _$GetallrecentsImpl>
    implements _$$GetallrecentsImplCopyWith<$Res> {
  __$$GetallrecentsImplCopyWithImpl(
      _$GetallrecentsImpl _value, $Res Function(_$GetallrecentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetallrecentsImpl implements _Getallrecents {
  const _$GetallrecentsImpl();

  @override
  String toString() {
    return 'RecentsEvent.getallrecent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetallrecentsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getallrecent,
    required TResult Function() clearecents,
    required TResult Function(String id) removesong,
  }) {
    return getallrecent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getallrecent,
    TResult? Function()? clearecents,
    TResult? Function(String id)? removesong,
  }) {
    return getallrecent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getallrecent,
    TResult Function()? clearecents,
    TResult Function(String id)? removesong,
    required TResult orElse(),
  }) {
    if (getallrecent != null) {
      return getallrecent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getallrecents value) getallrecent,
    required TResult Function(_Clearrecent value) clearecents,
    required TResult Function(_Removesong value) removesong,
  }) {
    return getallrecent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getallrecents value)? getallrecent,
    TResult? Function(_Clearrecent value)? clearecents,
    TResult? Function(_Removesong value)? removesong,
  }) {
    return getallrecent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getallrecents value)? getallrecent,
    TResult Function(_Clearrecent value)? clearecents,
    TResult Function(_Removesong value)? removesong,
    required TResult orElse(),
  }) {
    if (getallrecent != null) {
      return getallrecent(this);
    }
    return orElse();
  }
}

abstract class _Getallrecents implements RecentsEvent {
  const factory _Getallrecents() = _$GetallrecentsImpl;
}

/// @nodoc
abstract class _$$ClearrecentImplCopyWith<$Res> {
  factory _$$ClearrecentImplCopyWith(
          _$ClearrecentImpl value, $Res Function(_$ClearrecentImpl) then) =
      __$$ClearrecentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearrecentImplCopyWithImpl<$Res>
    extends _$RecentsEventCopyWithImpl<$Res, _$ClearrecentImpl>
    implements _$$ClearrecentImplCopyWith<$Res> {
  __$$ClearrecentImplCopyWithImpl(
      _$ClearrecentImpl _value, $Res Function(_$ClearrecentImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearrecentImpl implements _Clearrecent {
  const _$ClearrecentImpl();

  @override
  String toString() {
    return 'RecentsEvent.clearecents()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearrecentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getallrecent,
    required TResult Function() clearecents,
    required TResult Function(String id) removesong,
  }) {
    return clearecents();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getallrecent,
    TResult? Function()? clearecents,
    TResult? Function(String id)? removesong,
  }) {
    return clearecents?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getallrecent,
    TResult Function()? clearecents,
    TResult Function(String id)? removesong,
    required TResult orElse(),
  }) {
    if (clearecents != null) {
      return clearecents();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getallrecents value) getallrecent,
    required TResult Function(_Clearrecent value) clearecents,
    required TResult Function(_Removesong value) removesong,
  }) {
    return clearecents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getallrecents value)? getallrecent,
    TResult? Function(_Clearrecent value)? clearecents,
    TResult? Function(_Removesong value)? removesong,
  }) {
    return clearecents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getallrecents value)? getallrecent,
    TResult Function(_Clearrecent value)? clearecents,
    TResult Function(_Removesong value)? removesong,
    required TResult orElse(),
  }) {
    if (clearecents != null) {
      return clearecents(this);
    }
    return orElse();
  }
}

abstract class _Clearrecent implements RecentsEvent {
  const factory _Clearrecent() = _$ClearrecentImpl;
}

/// @nodoc
abstract class _$$RemovesongImplCopyWith<$Res> {
  factory _$$RemovesongImplCopyWith(
          _$RemovesongImpl value, $Res Function(_$RemovesongImpl) then) =
      __$$RemovesongImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RemovesongImplCopyWithImpl<$Res>
    extends _$RecentsEventCopyWithImpl<$Res, _$RemovesongImpl>
    implements _$$RemovesongImplCopyWith<$Res> {
  __$$RemovesongImplCopyWithImpl(
      _$RemovesongImpl _value, $Res Function(_$RemovesongImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemovesongImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemovesongImpl implements _Removesong {
  const _$RemovesongImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'RecentsEvent.removesong(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovesongImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RecentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovesongImplCopyWith<_$RemovesongImpl> get copyWith =>
      __$$RemovesongImplCopyWithImpl<_$RemovesongImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getallrecent,
    required TResult Function() clearecents,
    required TResult Function(String id) removesong,
  }) {
    return removesong(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getallrecent,
    TResult? Function()? clearecents,
    TResult? Function(String id)? removesong,
  }) {
    return removesong?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getallrecent,
    TResult Function()? clearecents,
    TResult Function(String id)? removesong,
    required TResult orElse(),
  }) {
    if (removesong != null) {
      return removesong(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getallrecents value) getallrecent,
    required TResult Function(_Clearrecent value) clearecents,
    required TResult Function(_Removesong value) removesong,
  }) {
    return removesong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getallrecents value)? getallrecent,
    TResult? Function(_Clearrecent value)? clearecents,
    TResult? Function(_Removesong value)? removesong,
  }) {
    return removesong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getallrecents value)? getallrecent,
    TResult Function(_Clearrecent value)? clearecents,
    TResult Function(_Removesong value)? removesong,
    required TResult orElse(),
  }) {
    if (removesong != null) {
      return removesong(this);
    }
    return orElse();
  }
}

abstract class _Removesong implements RecentsEvent {
  const factory _Removesong(final String id) = _$RemovesongImpl;

  String get id;

  /// Create a copy of RecentsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemovesongImplCopyWith<_$RemovesongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecentsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Map<String, dynamic>> recents) recents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> recents)? recents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> recents)? recents,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Recents value) recents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Recents value)? recents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Recents value)? recents,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentsStateCopyWith<$Res> {
  factory $RecentsStateCopyWith(
          RecentsState value, $Res Function(RecentsState) then) =
      _$RecentsStateCopyWithImpl<$Res, RecentsState>;
}

/// @nodoc
class _$RecentsStateCopyWithImpl<$Res, $Val extends RecentsState>
    implements $RecentsStateCopyWith<$Res> {
  _$RecentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentsState
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
    extends _$RecentsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RecentsState.initial()';
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
    required TResult Function(List<Map<String, dynamic>> recents) recents,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> recents)? recents,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> recents)? recents,
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
    required TResult Function(_Recents value) recents,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Recents value)? recents,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Recents value)? recents,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RecentsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$RecentsImplCopyWith<$Res> {
  factory _$$RecentsImplCopyWith(
          _$RecentsImpl value, $Res Function(_$RecentsImpl) then) =
      __$$RecentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> recents});
}

/// @nodoc
class __$$RecentsImplCopyWithImpl<$Res>
    extends _$RecentsStateCopyWithImpl<$Res, _$RecentsImpl>
    implements _$$RecentsImplCopyWith<$Res> {
  __$$RecentsImplCopyWithImpl(
      _$RecentsImpl _value, $Res Function(_$RecentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recents = null,
  }) {
    return _then(_$RecentsImpl(
      null == recents
          ? _value._recents
          : recents // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$RecentsImpl implements _Recents {
  const _$RecentsImpl(final List<Map<String, dynamic>> recents)
      : _recents = recents;

  final List<Map<String, dynamic>> _recents;
  @override
  List<Map<String, dynamic>> get recents {
    if (_recents is EqualUnmodifiableListView) return _recents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recents);
  }

  @override
  String toString() {
    return 'RecentsState.recents(recents: $recents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentsImpl &&
            const DeepCollectionEquality().equals(other._recents, _recents));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recents));

  /// Create a copy of RecentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentsImplCopyWith<_$RecentsImpl> get copyWith =>
      __$$RecentsImplCopyWithImpl<_$RecentsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Map<String, dynamic>> recents) recents,
  }) {
    return recents(this.recents);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<Map<String, dynamic>> recents)? recents,
  }) {
    return recents?.call(this.recents);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Map<String, dynamic>> recents)? recents,
    required TResult orElse(),
  }) {
    if (recents != null) {
      return recents(this.recents);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Recents value) recents,
  }) {
    return recents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Recents value)? recents,
  }) {
    return recents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Recents value)? recents,
    required TResult orElse(),
  }) {
    if (recents != null) {
      return recents(this);
    }
    return orElse();
  }
}

abstract class _Recents implements RecentsState {
  const factory _Recents(final List<Map<String, dynamic>> recents) =
      _$RecentsImpl;

  List<Map<String, dynamic>> get recents;

  /// Create a copy of RecentsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentsImplCopyWith<_$RecentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
