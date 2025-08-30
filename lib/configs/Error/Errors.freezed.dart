// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failures {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clientfailure,
    required TResult Function() serverfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clientfailure,
    TResult? Function()? serverfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clientfailure,
    TResult Function()? serverfailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_clientfail value) clientfailure,
    required TResult Function(_serverfail value) serverfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_clientfail value)? clientfailure,
    TResult? Function(_serverfail value)? serverfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_clientfail value)? clientfailure,
    TResult Function(_serverfail value)? serverfailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailuresCopyWith<$Res> {
  factory $FailuresCopyWith(Failures value, $Res Function(Failures) then) =
      _$FailuresCopyWithImpl<$Res, Failures>;
}

/// @nodoc
class _$FailuresCopyWithImpl<$Res, $Val extends Failures>
    implements $FailuresCopyWith<$Res> {
  _$FailuresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failures
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$clientfailImplCopyWith<$Res> {
  factory _$$clientfailImplCopyWith(
          _$clientfailImpl value, $Res Function(_$clientfailImpl) then) =
      __$$clientfailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$clientfailImplCopyWithImpl<$Res>
    extends _$FailuresCopyWithImpl<$Res, _$clientfailImpl>
    implements _$$clientfailImplCopyWith<$Res> {
  __$$clientfailImplCopyWithImpl(
      _$clientfailImpl _value, $Res Function(_$clientfailImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failures
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$clientfailImpl implements _clientfail {
  const _$clientfailImpl();

  @override
  String toString() {
    return 'Failures.clientfailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$clientfailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clientfailure,
    required TResult Function() serverfailure,
  }) {
    return clientfailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clientfailure,
    TResult? Function()? serverfailure,
  }) {
    return clientfailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clientfailure,
    TResult Function()? serverfailure,
    required TResult orElse(),
  }) {
    if (clientfailure != null) {
      return clientfailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_clientfail value) clientfailure,
    required TResult Function(_serverfail value) serverfailure,
  }) {
    return clientfailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_clientfail value)? clientfailure,
    TResult? Function(_serverfail value)? serverfailure,
  }) {
    return clientfailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_clientfail value)? clientfailure,
    TResult Function(_serverfail value)? serverfailure,
    required TResult orElse(),
  }) {
    if (clientfailure != null) {
      return clientfailure(this);
    }
    return orElse();
  }
}

abstract class _clientfail implements Failures {
  const factory _clientfail() = _$clientfailImpl;
}

/// @nodoc
abstract class _$$serverfailImplCopyWith<$Res> {
  factory _$$serverfailImplCopyWith(
          _$serverfailImpl value, $Res Function(_$serverfailImpl) then) =
      __$$serverfailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$serverfailImplCopyWithImpl<$Res>
    extends _$FailuresCopyWithImpl<$Res, _$serverfailImpl>
    implements _$$serverfailImplCopyWith<$Res> {
  __$$serverfailImplCopyWithImpl(
      _$serverfailImpl _value, $Res Function(_$serverfailImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failures
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$serverfailImpl implements _serverfail {
  const _$serverfailImpl();

  @override
  String toString() {
    return 'Failures.serverfailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$serverfailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clientfailure,
    required TResult Function() serverfailure,
  }) {
    return serverfailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clientfailure,
    TResult? Function()? serverfailure,
  }) {
    return serverfailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clientfailure,
    TResult Function()? serverfailure,
    required TResult orElse(),
  }) {
    if (serverfailure != null) {
      return serverfailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_clientfail value) clientfailure,
    required TResult Function(_serverfail value) serverfailure,
  }) {
    return serverfailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_clientfail value)? clientfailure,
    TResult? Function(_serverfail value)? serverfailure,
  }) {
    return serverfailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_clientfail value)? clientfailure,
    TResult Function(_serverfail value)? serverfailure,
    required TResult orElse(),
  }) {
    if (serverfailure != null) {
      return serverfailure(this);
    }
    return orElse();
  }
}

abstract class _serverfail implements Failures {
  const factory _serverfail() = _$serverfailImpl;
}
