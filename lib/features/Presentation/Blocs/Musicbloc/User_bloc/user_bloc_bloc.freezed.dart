// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Usermodel user, String mode) userdetails,
    required TResult Function(Usermodel user, String mode) updateuserdetails,
    required TResult Function() getuserdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Usermodel user, String mode)? userdetails,
    TResult? Function(Usermodel user, String mode)? updateuserdetails,
    TResult? Function()? getuserdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Usermodel user, String mode)? userdetails,
    TResult Function(Usermodel user, String mode)? updateuserdetails,
    TResult Function()? getuserdetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Userdetails value) userdetails,
    required TResult Function(_Updateuserdetails value) updateuserdetails,
    required TResult Function(_Getuserdetails value) getuserdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Userdetails value)? userdetails,
    TResult? Function(_Updateuserdetails value)? updateuserdetails,
    TResult? Function(_Getuserdetails value)? getuserdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Userdetails value)? userdetails,
    TResult Function(_Updateuserdetails value)? updateuserdetails,
    TResult Function(_Getuserdetails value)? getuserdetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlocEventCopyWith<$Res> {
  factory $UserBlocEventCopyWith(
          UserBlocEvent value, $Res Function(UserBlocEvent) then) =
      _$UserBlocEventCopyWithImpl<$Res, UserBlocEvent>;
}

/// @nodoc
class _$UserBlocEventCopyWithImpl<$Res, $Val extends UserBlocEvent>
    implements $UserBlocEventCopyWith<$Res> {
  _$UserBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlocEvent
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
    extends _$UserBlocEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UserBlocEvent.started()';
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
    required TResult Function(Usermodel user, String mode) userdetails,
    required TResult Function(Usermodel user, String mode) updateuserdetails,
    required TResult Function() getuserdetails,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Usermodel user, String mode)? userdetails,
    TResult? Function(Usermodel user, String mode)? updateuserdetails,
    TResult? Function()? getuserdetails,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Usermodel user, String mode)? userdetails,
    TResult Function(Usermodel user, String mode)? updateuserdetails,
    TResult Function()? getuserdetails,
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
    required TResult Function(_Userdetails value) userdetails,
    required TResult Function(_Updateuserdetails value) updateuserdetails,
    required TResult Function(_Getuserdetails value) getuserdetails,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Userdetails value)? userdetails,
    TResult? Function(_Updateuserdetails value)? updateuserdetails,
    TResult? Function(_Getuserdetails value)? getuserdetails,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Userdetails value)? userdetails,
    TResult Function(_Updateuserdetails value)? updateuserdetails,
    TResult Function(_Getuserdetails value)? getuserdetails,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UserBlocEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$UserdetailsImplCopyWith<$Res> {
  factory _$$UserdetailsImplCopyWith(
          _$UserdetailsImpl value, $Res Function(_$UserdetailsImpl) then) =
      __$$UserdetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Usermodel user, String mode});
}

/// @nodoc
class __$$UserdetailsImplCopyWithImpl<$Res>
    extends _$UserBlocEventCopyWithImpl<$Res, _$UserdetailsImpl>
    implements _$$UserdetailsImplCopyWith<$Res> {
  __$$UserdetailsImplCopyWithImpl(
      _$UserdetailsImpl _value, $Res Function(_$UserdetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? mode = null,
  }) {
    return _then(_$UserdetailsImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Usermodel,
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserdetailsImpl implements _Userdetails {
  const _$UserdetailsImpl(this.user, this.mode);

  @override
  final Usermodel user;
  @override
  final String mode;

  @override
  String toString() {
    return 'UserBlocEvent.userdetails(user: $user, mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserdetailsImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, mode);

  /// Create a copy of UserBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserdetailsImplCopyWith<_$UserdetailsImpl> get copyWith =>
      __$$UserdetailsImplCopyWithImpl<_$UserdetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Usermodel user, String mode) userdetails,
    required TResult Function(Usermodel user, String mode) updateuserdetails,
    required TResult Function() getuserdetails,
  }) {
    return userdetails(user, mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Usermodel user, String mode)? userdetails,
    TResult? Function(Usermodel user, String mode)? updateuserdetails,
    TResult? Function()? getuserdetails,
  }) {
    return userdetails?.call(user, mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Usermodel user, String mode)? userdetails,
    TResult Function(Usermodel user, String mode)? updateuserdetails,
    TResult Function()? getuserdetails,
    required TResult orElse(),
  }) {
    if (userdetails != null) {
      return userdetails(user, mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Userdetails value) userdetails,
    required TResult Function(_Updateuserdetails value) updateuserdetails,
    required TResult Function(_Getuserdetails value) getuserdetails,
  }) {
    return userdetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Userdetails value)? userdetails,
    TResult? Function(_Updateuserdetails value)? updateuserdetails,
    TResult? Function(_Getuserdetails value)? getuserdetails,
  }) {
    return userdetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Userdetails value)? userdetails,
    TResult Function(_Updateuserdetails value)? updateuserdetails,
    TResult Function(_Getuserdetails value)? getuserdetails,
    required TResult orElse(),
  }) {
    if (userdetails != null) {
      return userdetails(this);
    }
    return orElse();
  }
}

abstract class _Userdetails implements UserBlocEvent {
  const factory _Userdetails(final Usermodel user, final String mode) =
      _$UserdetailsImpl;

  Usermodel get user;
  String get mode;

  /// Create a copy of UserBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserdetailsImplCopyWith<_$UserdetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateuserdetailsImplCopyWith<$Res> {
  factory _$$UpdateuserdetailsImplCopyWith(_$UpdateuserdetailsImpl value,
          $Res Function(_$UpdateuserdetailsImpl) then) =
      __$$UpdateuserdetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Usermodel user, String mode});
}

/// @nodoc
class __$$UpdateuserdetailsImplCopyWithImpl<$Res>
    extends _$UserBlocEventCopyWithImpl<$Res, _$UpdateuserdetailsImpl>
    implements _$$UpdateuserdetailsImplCopyWith<$Res> {
  __$$UpdateuserdetailsImplCopyWithImpl(_$UpdateuserdetailsImpl _value,
      $Res Function(_$UpdateuserdetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? mode = null,
  }) {
    return _then(_$UpdateuserdetailsImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Usermodel,
      null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateuserdetailsImpl implements _Updateuserdetails {
  const _$UpdateuserdetailsImpl(this.user, this.mode);

  @override
  final Usermodel user;
  @override
  final String mode;

  @override
  String toString() {
    return 'UserBlocEvent.updateuserdetails(user: $user, mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateuserdetailsImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.mode, mode) || other.mode == mode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, mode);

  /// Create a copy of UserBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateuserdetailsImplCopyWith<_$UpdateuserdetailsImpl> get copyWith =>
      __$$UpdateuserdetailsImplCopyWithImpl<_$UpdateuserdetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Usermodel user, String mode) userdetails,
    required TResult Function(Usermodel user, String mode) updateuserdetails,
    required TResult Function() getuserdetails,
  }) {
    return updateuserdetails(user, mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Usermodel user, String mode)? userdetails,
    TResult? Function(Usermodel user, String mode)? updateuserdetails,
    TResult? Function()? getuserdetails,
  }) {
    return updateuserdetails?.call(user, mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Usermodel user, String mode)? userdetails,
    TResult Function(Usermodel user, String mode)? updateuserdetails,
    TResult Function()? getuserdetails,
    required TResult orElse(),
  }) {
    if (updateuserdetails != null) {
      return updateuserdetails(user, mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Userdetails value) userdetails,
    required TResult Function(_Updateuserdetails value) updateuserdetails,
    required TResult Function(_Getuserdetails value) getuserdetails,
  }) {
    return updateuserdetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Userdetails value)? userdetails,
    TResult? Function(_Updateuserdetails value)? updateuserdetails,
    TResult? Function(_Getuserdetails value)? getuserdetails,
  }) {
    return updateuserdetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Userdetails value)? userdetails,
    TResult Function(_Updateuserdetails value)? updateuserdetails,
    TResult Function(_Getuserdetails value)? getuserdetails,
    required TResult orElse(),
  }) {
    if (updateuserdetails != null) {
      return updateuserdetails(this);
    }
    return orElse();
  }
}

abstract class _Updateuserdetails implements UserBlocEvent {
  const factory _Updateuserdetails(final Usermodel user, final String mode) =
      _$UpdateuserdetailsImpl;

  Usermodel get user;
  String get mode;

  /// Create a copy of UserBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateuserdetailsImplCopyWith<_$UpdateuserdetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetuserdetailsImplCopyWith<$Res> {
  factory _$$GetuserdetailsImplCopyWith(_$GetuserdetailsImpl value,
          $Res Function(_$GetuserdetailsImpl) then) =
      __$$GetuserdetailsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetuserdetailsImplCopyWithImpl<$Res>
    extends _$UserBlocEventCopyWithImpl<$Res, _$GetuserdetailsImpl>
    implements _$$GetuserdetailsImplCopyWith<$Res> {
  __$$GetuserdetailsImplCopyWithImpl(
      _$GetuserdetailsImpl _value, $Res Function(_$GetuserdetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetuserdetailsImpl implements _Getuserdetails {
  const _$GetuserdetailsImpl();

  @override
  String toString() {
    return 'UserBlocEvent.getuserdetails()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetuserdetailsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Usermodel user, String mode) userdetails,
    required TResult Function(Usermodel user, String mode) updateuserdetails,
    required TResult Function() getuserdetails,
  }) {
    return getuserdetails();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Usermodel user, String mode)? userdetails,
    TResult? Function(Usermodel user, String mode)? updateuserdetails,
    TResult? Function()? getuserdetails,
  }) {
    return getuserdetails?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Usermodel user, String mode)? userdetails,
    TResult Function(Usermodel user, String mode)? updateuserdetails,
    TResult Function()? getuserdetails,
    required TResult orElse(),
  }) {
    if (getuserdetails != null) {
      return getuserdetails();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Userdetails value) userdetails,
    required TResult Function(_Updateuserdetails value) updateuserdetails,
    required TResult Function(_Getuserdetails value) getuserdetails,
  }) {
    return getuserdetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Userdetails value)? userdetails,
    TResult? Function(_Updateuserdetails value)? updateuserdetails,
    TResult? Function(_Getuserdetails value)? getuserdetails,
  }) {
    return getuserdetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Userdetails value)? userdetails,
    TResult Function(_Updateuserdetails value)? updateuserdetails,
    TResult Function(_Getuserdetails value)? getuserdetails,
    required TResult orElse(),
  }) {
    if (getuserdetails != null) {
      return getuserdetails(this);
    }
    return orElse();
  }
}

abstract class _Getuserdetails implements UserBlocEvent {
  const factory _Getuserdetails() = _$GetuserdetailsImpl;
}

/// @nodoc
mixin _$UserBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Usermodel user) userdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Usermodel user)? userdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Usermodel user)? userdetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Userdetailstate value) userdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Userdetailstate value)? userdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Userdetailstate value)? userdetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlocStateCopyWith<$Res> {
  factory $UserBlocStateCopyWith(
          UserBlocState value, $Res Function(UserBlocState) then) =
      _$UserBlocStateCopyWithImpl<$Res, UserBlocState>;
}

/// @nodoc
class _$UserBlocStateCopyWithImpl<$Res, $Val extends UserBlocState>
    implements $UserBlocStateCopyWith<$Res> {
  _$UserBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlocState
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
    extends _$UserBlocStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserBlocState.initial()';
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
    required TResult Function(Usermodel user) userdetails,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Usermodel user)? userdetails,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Usermodel user)? userdetails,
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
    required TResult Function(_Userdetailstate value) userdetails,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Userdetailstate value)? userdetails,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Userdetailstate value)? userdetails,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserBlocState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$UserdetailstateImplCopyWith<$Res> {
  factory _$$UserdetailstateImplCopyWith(_$UserdetailstateImpl value,
          $Res Function(_$UserdetailstateImpl) then) =
      __$$UserdetailstateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Usermodel user});
}

/// @nodoc
class __$$UserdetailstateImplCopyWithImpl<$Res>
    extends _$UserBlocStateCopyWithImpl<$Res, _$UserdetailstateImpl>
    implements _$$UserdetailstateImplCopyWith<$Res> {
  __$$UserdetailstateImplCopyWithImpl(
      _$UserdetailstateImpl _value, $Res Function(_$UserdetailstateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UserdetailstateImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Usermodel,
    ));
  }
}

/// @nodoc

class _$UserdetailstateImpl implements _Userdetailstate {
  const _$UserdetailstateImpl(this.user);

  @override
  final Usermodel user;

  @override
  String toString() {
    return 'UserBlocState.userdetails(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserdetailstateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserdetailstateImplCopyWith<_$UserdetailstateImpl> get copyWith =>
      __$$UserdetailstateImplCopyWithImpl<_$UserdetailstateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Usermodel user) userdetails,
  }) {
    return userdetails(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Usermodel user)? userdetails,
  }) {
    return userdetails?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Usermodel user)? userdetails,
    required TResult orElse(),
  }) {
    if (userdetails != null) {
      return userdetails(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Userdetailstate value) userdetails,
  }) {
    return userdetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Userdetailstate value)? userdetails,
  }) {
    return userdetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Userdetailstate value)? userdetails,
    required TResult orElse(),
  }) {
    if (userdetails != null) {
      return userdetails(this);
    }
    return orElse();
  }
}

abstract class _Userdetailstate implements UserBlocState {
  const factory _Userdetailstate(final Usermodel user) = _$UserdetailstateImpl;

  Usermodel get user;

  /// Create a copy of UserBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserdetailstateImplCopyWith<_$UserdetailstateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
