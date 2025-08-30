// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playerui_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlayeruiEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String type) updateui,
    required TResult Function() initialui,
    required TResult Function() getplayerui,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String type)? updateui,
    TResult? Function()? initialui,
    TResult? Function()? getplayerui,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String type)? updateui,
    TResult Function()? initialui,
    TResult Function()? getplayerui,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Updateui value) updateui,
    required TResult Function(_Intialui value) initialui,
    required TResult Function(_GetplayerUi value) getplayerui,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Updateui value)? updateui,
    TResult? Function(_Intialui value)? initialui,
    TResult? Function(_GetplayerUi value)? getplayerui,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Updateui value)? updateui,
    TResult Function(_Intialui value)? initialui,
    TResult Function(_GetplayerUi value)? getplayerui,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayeruiEventCopyWith<$Res> {
  factory $PlayeruiEventCopyWith(
          PlayeruiEvent value, $Res Function(PlayeruiEvent) then) =
      _$PlayeruiEventCopyWithImpl<$Res, PlayeruiEvent>;
}

/// @nodoc
class _$PlayeruiEventCopyWithImpl<$Res, $Val extends PlayeruiEvent>
    implements $PlayeruiEventCopyWith<$Res> {
  _$PlayeruiEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayeruiEvent
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
    extends _$PlayeruiEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayeruiEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PlayeruiEvent.started()';
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
    required TResult Function(String type) updateui,
    required TResult Function() initialui,
    required TResult Function() getplayerui,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String type)? updateui,
    TResult? Function()? initialui,
    TResult? Function()? getplayerui,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String type)? updateui,
    TResult Function()? initialui,
    TResult Function()? getplayerui,
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
    required TResult Function(_Updateui value) updateui,
    required TResult Function(_Intialui value) initialui,
    required TResult Function(_GetplayerUi value) getplayerui,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Updateui value)? updateui,
    TResult? Function(_Intialui value)? initialui,
    TResult? Function(_GetplayerUi value)? getplayerui,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Updateui value)? updateui,
    TResult Function(_Intialui value)? initialui,
    TResult Function(_GetplayerUi value)? getplayerui,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PlayeruiEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$UpdateuiImplCopyWith<$Res> {
  factory _$$UpdateuiImplCopyWith(
          _$UpdateuiImpl value, $Res Function(_$UpdateuiImpl) then) =
      __$$UpdateuiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String type});
}

/// @nodoc
class __$$UpdateuiImplCopyWithImpl<$Res>
    extends _$PlayeruiEventCopyWithImpl<$Res, _$UpdateuiImpl>
    implements _$$UpdateuiImplCopyWith<$Res> {
  __$$UpdateuiImplCopyWithImpl(
      _$UpdateuiImpl _value, $Res Function(_$UpdateuiImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayeruiEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$UpdateuiImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateuiImpl implements _Updateui {
  const _$UpdateuiImpl(this.type);

  @override
  final String type;

  @override
  String toString() {
    return 'PlayeruiEvent.updateui(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateuiImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of PlayeruiEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateuiImplCopyWith<_$UpdateuiImpl> get copyWith =>
      __$$UpdateuiImplCopyWithImpl<_$UpdateuiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String type) updateui,
    required TResult Function() initialui,
    required TResult Function() getplayerui,
  }) {
    return updateui(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String type)? updateui,
    TResult? Function()? initialui,
    TResult? Function()? getplayerui,
  }) {
    return updateui?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String type)? updateui,
    TResult Function()? initialui,
    TResult Function()? getplayerui,
    required TResult orElse(),
  }) {
    if (updateui != null) {
      return updateui(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Updateui value) updateui,
    required TResult Function(_Intialui value) initialui,
    required TResult Function(_GetplayerUi value) getplayerui,
  }) {
    return updateui(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Updateui value)? updateui,
    TResult? Function(_Intialui value)? initialui,
    TResult? Function(_GetplayerUi value)? getplayerui,
  }) {
    return updateui?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Updateui value)? updateui,
    TResult Function(_Intialui value)? initialui,
    TResult Function(_GetplayerUi value)? getplayerui,
    required TResult orElse(),
  }) {
    if (updateui != null) {
      return updateui(this);
    }
    return orElse();
  }
}

abstract class _Updateui implements PlayeruiEvent {
  const factory _Updateui(final String type) = _$UpdateuiImpl;

  String get type;

  /// Create a copy of PlayeruiEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateuiImplCopyWith<_$UpdateuiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IntialuiImplCopyWith<$Res> {
  factory _$$IntialuiImplCopyWith(
          _$IntialuiImpl value, $Res Function(_$IntialuiImpl) then) =
      __$$IntialuiImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IntialuiImplCopyWithImpl<$Res>
    extends _$PlayeruiEventCopyWithImpl<$Res, _$IntialuiImpl>
    implements _$$IntialuiImplCopyWith<$Res> {
  __$$IntialuiImplCopyWithImpl(
      _$IntialuiImpl _value, $Res Function(_$IntialuiImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayeruiEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IntialuiImpl implements _Intialui {
  const _$IntialuiImpl();

  @override
  String toString() {
    return 'PlayeruiEvent.initialui()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IntialuiImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String type) updateui,
    required TResult Function() initialui,
    required TResult Function() getplayerui,
  }) {
    return initialui();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String type)? updateui,
    TResult? Function()? initialui,
    TResult? Function()? getplayerui,
  }) {
    return initialui?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String type)? updateui,
    TResult Function()? initialui,
    TResult Function()? getplayerui,
    required TResult orElse(),
  }) {
    if (initialui != null) {
      return initialui();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Updateui value) updateui,
    required TResult Function(_Intialui value) initialui,
    required TResult Function(_GetplayerUi value) getplayerui,
  }) {
    return initialui(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Updateui value)? updateui,
    TResult? Function(_Intialui value)? initialui,
    TResult? Function(_GetplayerUi value)? getplayerui,
  }) {
    return initialui?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Updateui value)? updateui,
    TResult Function(_Intialui value)? initialui,
    TResult Function(_GetplayerUi value)? getplayerui,
    required TResult orElse(),
  }) {
    if (initialui != null) {
      return initialui(this);
    }
    return orElse();
  }
}

abstract class _Intialui implements PlayeruiEvent {
  const factory _Intialui() = _$IntialuiImpl;
}

/// @nodoc
abstract class _$$GetplayerUiImplCopyWith<$Res> {
  factory _$$GetplayerUiImplCopyWith(
          _$GetplayerUiImpl value, $Res Function(_$GetplayerUiImpl) then) =
      __$$GetplayerUiImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetplayerUiImplCopyWithImpl<$Res>
    extends _$PlayeruiEventCopyWithImpl<$Res, _$GetplayerUiImpl>
    implements _$$GetplayerUiImplCopyWith<$Res> {
  __$$GetplayerUiImplCopyWithImpl(
      _$GetplayerUiImpl _value, $Res Function(_$GetplayerUiImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayeruiEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetplayerUiImpl implements _GetplayerUi {
  const _$GetplayerUiImpl();

  @override
  String toString() {
    return 'PlayeruiEvent.getplayerui()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetplayerUiImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String type) updateui,
    required TResult Function() initialui,
    required TResult Function() getplayerui,
  }) {
    return getplayerui();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String type)? updateui,
    TResult? Function()? initialui,
    TResult? Function()? getplayerui,
  }) {
    return getplayerui?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String type)? updateui,
    TResult Function()? initialui,
    TResult Function()? getplayerui,
    required TResult orElse(),
  }) {
    if (getplayerui != null) {
      return getplayerui();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Updateui value) updateui,
    required TResult Function(_Intialui value) initialui,
    required TResult Function(_GetplayerUi value) getplayerui,
  }) {
    return getplayerui(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Updateui value)? updateui,
    TResult? Function(_Intialui value)? initialui,
    TResult? Function(_GetplayerUi value)? getplayerui,
  }) {
    return getplayerui?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Updateui value)? updateui,
    TResult Function(_Intialui value)? initialui,
    TResult Function(_GetplayerUi value)? getplayerui,
    required TResult orElse(),
  }) {
    if (getplayerui != null) {
      return getplayerui(this);
    }
    return orElse();
  }
}

abstract class _GetplayerUi implements PlayeruiEvent {
  const factory _GetplayerUi() = _$GetplayerUiImpl;
}

/// @nodoc
mixin _$PlayeruiState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, dynamic> ui) playerui,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, dynamic> ui)? playerui,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, dynamic> ui)? playerui,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Playerui value) playerui,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Playerui value)? playerui,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Playerui value)? playerui,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayeruiStateCopyWith<$Res> {
  factory $PlayeruiStateCopyWith(
          PlayeruiState value, $Res Function(PlayeruiState) then) =
      _$PlayeruiStateCopyWithImpl<$Res, PlayeruiState>;
}

/// @nodoc
class _$PlayeruiStateCopyWithImpl<$Res, $Val extends PlayeruiState>
    implements $PlayeruiStateCopyWith<$Res> {
  _$PlayeruiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayeruiState
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
    extends _$PlayeruiStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayeruiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PlayeruiState.initial()';
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
    required TResult Function(Map<String, dynamic> ui) playerui,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, dynamic> ui)? playerui,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, dynamic> ui)? playerui,
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
    required TResult Function(_Playerui value) playerui,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Playerui value)? playerui,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Playerui value)? playerui,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PlayeruiState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$PlayeruiImplCopyWith<$Res> {
  factory _$$PlayeruiImplCopyWith(
          _$PlayeruiImpl value, $Res Function(_$PlayeruiImpl) then) =
      __$$PlayeruiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> ui});
}

/// @nodoc
class __$$PlayeruiImplCopyWithImpl<$Res>
    extends _$PlayeruiStateCopyWithImpl<$Res, _$PlayeruiImpl>
    implements _$$PlayeruiImplCopyWith<$Res> {
  __$$PlayeruiImplCopyWithImpl(
      _$PlayeruiImpl _value, $Res Function(_$PlayeruiImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayeruiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ui = null,
  }) {
    return _then(_$PlayeruiImpl(
      null == ui
          ? _value._ui
          : ui // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$PlayeruiImpl implements _Playerui {
  const _$PlayeruiImpl(final Map<String, dynamic> ui) : _ui = ui;

  final Map<String, dynamic> _ui;
  @override
  Map<String, dynamic> get ui {
    if (_ui is EqualUnmodifiableMapView) return _ui;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ui);
  }

  @override
  String toString() {
    return 'PlayeruiState.playerui(ui: $ui)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayeruiImpl &&
            const DeepCollectionEquality().equals(other._ui, _ui));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ui));

  /// Create a copy of PlayeruiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayeruiImplCopyWith<_$PlayeruiImpl> get copyWith =>
      __$$PlayeruiImplCopyWithImpl<_$PlayeruiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, dynamic> ui) playerui,
  }) {
    return playerui(ui);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, dynamic> ui)? playerui,
  }) {
    return playerui?.call(ui);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, dynamic> ui)? playerui,
    required TResult orElse(),
  }) {
    if (playerui != null) {
      return playerui(ui);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Playerui value) playerui,
  }) {
    return playerui(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Playerui value)? playerui,
  }) {
    return playerui?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Playerui value)? playerui,
    required TResult orElse(),
  }) {
    if (playerui != null) {
      return playerui(this);
    }
    return orElse();
  }
}

abstract class _Playerui implements PlayeruiState {
  const factory _Playerui(final Map<String, dynamic> ui) = _$PlayeruiImpl;

  Map<String, dynamic> get ui;

  /// Create a copy of PlayeruiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayeruiImplCopyWith<_$PlayeruiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
