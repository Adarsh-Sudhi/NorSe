// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connnectivity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnnectivityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() startSevice,
    required TResult Function(List<ConnectivityResult> data)
        getConnectionstatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? startSevice,
    TResult? Function(List<ConnectivityResult> data)? getConnectionstatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? startSevice,
    TResult Function(List<ConnectivityResult> data)? getConnectionstatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_StartService value) startSevice,
    required TResult Function(_Connectivity value) getConnectionstatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_StartService value)? startSevice,
    TResult? Function(_Connectivity value)? getConnectionstatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_StartService value)? startSevice,
    TResult Function(_Connectivity value)? getConnectionstatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnnectivityEventCopyWith<$Res> {
  factory $ConnnectivityEventCopyWith(
          ConnnectivityEvent value, $Res Function(ConnnectivityEvent) then) =
      _$ConnnectivityEventCopyWithImpl<$Res, ConnnectivityEvent>;
}

/// @nodoc
class _$ConnnectivityEventCopyWithImpl<$Res, $Val extends ConnnectivityEvent>
    implements $ConnnectivityEventCopyWith<$Res> {
  _$ConnnectivityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnnectivityEvent
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
    extends _$ConnnectivityEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ConnnectivityEvent.started()';
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
    required TResult Function() startSevice,
    required TResult Function(List<ConnectivityResult> data)
        getConnectionstatus,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? startSevice,
    TResult? Function(List<ConnectivityResult> data)? getConnectionstatus,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? startSevice,
    TResult Function(List<ConnectivityResult> data)? getConnectionstatus,
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
    required TResult Function(_StartService value) startSevice,
    required TResult Function(_Connectivity value) getConnectionstatus,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_StartService value)? startSevice,
    TResult? Function(_Connectivity value)? getConnectionstatus,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_StartService value)? startSevice,
    TResult Function(_Connectivity value)? getConnectionstatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ConnnectivityEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$StartServiceImplCopyWith<$Res> {
  factory _$$StartServiceImplCopyWith(
          _$StartServiceImpl value, $Res Function(_$StartServiceImpl) then) =
      __$$StartServiceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartServiceImplCopyWithImpl<$Res>
    extends _$ConnnectivityEventCopyWithImpl<$Res, _$StartServiceImpl>
    implements _$$StartServiceImplCopyWith<$Res> {
  __$$StartServiceImplCopyWithImpl(
      _$StartServiceImpl _value, $Res Function(_$StartServiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartServiceImpl implements _StartService {
  const _$StartServiceImpl();

  @override
  String toString() {
    return 'ConnnectivityEvent.startSevice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartServiceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() startSevice,
    required TResult Function(List<ConnectivityResult> data)
        getConnectionstatus,
  }) {
    return startSevice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? startSevice,
    TResult? Function(List<ConnectivityResult> data)? getConnectionstatus,
  }) {
    return startSevice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? startSevice,
    TResult Function(List<ConnectivityResult> data)? getConnectionstatus,
    required TResult orElse(),
  }) {
    if (startSevice != null) {
      return startSevice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_StartService value) startSevice,
    required TResult Function(_Connectivity value) getConnectionstatus,
  }) {
    return startSevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_StartService value)? startSevice,
    TResult? Function(_Connectivity value)? getConnectionstatus,
  }) {
    return startSevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_StartService value)? startSevice,
    TResult Function(_Connectivity value)? getConnectionstatus,
    required TResult orElse(),
  }) {
    if (startSevice != null) {
      return startSevice(this);
    }
    return orElse();
  }
}

abstract class _StartService implements ConnnectivityEvent {
  const factory _StartService() = _$StartServiceImpl;
}

/// @nodoc
abstract class _$$ConnectivityImplCopyWith<$Res> {
  factory _$$ConnectivityImplCopyWith(
          _$ConnectivityImpl value, $Res Function(_$ConnectivityImpl) then) =
      __$$ConnectivityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ConnectivityResult> data});
}

/// @nodoc
class __$$ConnectivityImplCopyWithImpl<$Res>
    extends _$ConnnectivityEventCopyWithImpl<$Res, _$ConnectivityImpl>
    implements _$$ConnectivityImplCopyWith<$Res> {
  __$$ConnectivityImplCopyWithImpl(
      _$ConnectivityImpl _value, $Res Function(_$ConnectivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ConnectivityImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ConnectivityResult>,
    ));
  }
}

/// @nodoc

class _$ConnectivityImpl implements _Connectivity {
  const _$ConnectivityImpl(final List<ConnectivityResult> data) : _data = data;

  final List<ConnectivityResult> _data;
  @override
  List<ConnectivityResult> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ConnnectivityEvent.getConnectionstatus(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectivityImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ConnnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectivityImplCopyWith<_$ConnectivityImpl> get copyWith =>
      __$$ConnectivityImplCopyWithImpl<_$ConnectivityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() startSevice,
    required TResult Function(List<ConnectivityResult> data)
        getConnectionstatus,
  }) {
    return getConnectionstatus(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? startSevice,
    TResult? Function(List<ConnectivityResult> data)? getConnectionstatus,
  }) {
    return getConnectionstatus?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? startSevice,
    TResult Function(List<ConnectivityResult> data)? getConnectionstatus,
    required TResult orElse(),
  }) {
    if (getConnectionstatus != null) {
      return getConnectionstatus(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_StartService value) startSevice,
    required TResult Function(_Connectivity value) getConnectionstatus,
  }) {
    return getConnectionstatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_StartService value)? startSevice,
    TResult? Function(_Connectivity value)? getConnectionstatus,
  }) {
    return getConnectionstatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_StartService value)? startSevice,
    TResult Function(_Connectivity value)? getConnectionstatus,
    required TResult orElse(),
  }) {
    if (getConnectionstatus != null) {
      return getConnectionstatus(this);
    }
    return orElse();
  }
}

abstract class _Connectivity implements ConnnectivityEvent {
  const factory _Connectivity(final List<ConnectivityResult> data) =
      _$ConnectivityImpl;

  List<ConnectivityResult> get data;

  /// Create a copy of ConnnectivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectivityImplCopyWith<_$ConnectivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConnnectivityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isavailable) networkstate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isavailable)? networkstate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isavailable)? networkstate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NetWorkState value) networkstate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NetWorkState value)? networkstate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NetWorkState value)? networkstate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnnectivityStateCopyWith<$Res> {
  factory $ConnnectivityStateCopyWith(
          ConnnectivityState value, $Res Function(ConnnectivityState) then) =
      _$ConnnectivityStateCopyWithImpl<$Res, ConnnectivityState>;
}

/// @nodoc
class _$ConnnectivityStateCopyWithImpl<$Res, $Val extends ConnnectivityState>
    implements $ConnnectivityStateCopyWith<$Res> {
  _$ConnnectivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnnectivityState
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
    extends _$ConnnectivityStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnnectivityState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ConnnectivityState.initial()';
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
    required TResult Function(bool isavailable) networkstate,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isavailable)? networkstate,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isavailable)? networkstate,
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
    required TResult Function(_NetWorkState value) networkstate,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NetWorkState value)? networkstate,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NetWorkState value)? networkstate,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ConnnectivityState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$NetWorkStateImplCopyWith<$Res> {
  factory _$$NetWorkStateImplCopyWith(
          _$NetWorkStateImpl value, $Res Function(_$NetWorkStateImpl) then) =
      __$$NetWorkStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isavailable});
}

/// @nodoc
class __$$NetWorkStateImplCopyWithImpl<$Res>
    extends _$ConnnectivityStateCopyWithImpl<$Res, _$NetWorkStateImpl>
    implements _$$NetWorkStateImplCopyWith<$Res> {
  __$$NetWorkStateImplCopyWithImpl(
      _$NetWorkStateImpl _value, $Res Function(_$NetWorkStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnnectivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isavailable = null,
  }) {
    return _then(_$NetWorkStateImpl(
      null == isavailable
          ? _value.isavailable
          : isavailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NetWorkStateImpl implements _NetWorkState {
  const _$NetWorkStateImpl(this.isavailable);

  @override
  final bool isavailable;

  @override
  String toString() {
    return 'ConnnectivityState.networkstate(isavailable: $isavailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetWorkStateImpl &&
            (identical(other.isavailable, isavailable) ||
                other.isavailable == isavailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isavailable);

  /// Create a copy of ConnnectivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetWorkStateImplCopyWith<_$NetWorkStateImpl> get copyWith =>
      __$$NetWorkStateImplCopyWithImpl<_$NetWorkStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isavailable) networkstate,
  }) {
    return networkstate(isavailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isavailable)? networkstate,
  }) {
    return networkstate?.call(isavailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isavailable)? networkstate,
    required TResult orElse(),
  }) {
    if (networkstate != null) {
      return networkstate(isavailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_NetWorkState value) networkstate,
  }) {
    return networkstate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_NetWorkState value)? networkstate,
  }) {
    return networkstate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_NetWorkState value)? networkstate,
    required TResult orElse(),
  }) {
    if (networkstate != null) {
      return networkstate(this);
    }
    return orElse();
  }
}

abstract class _NetWorkState implements ConnnectivityState {
  const factory _NetWorkState(final bool isavailable) = _$NetWorkStateImpl;

  bool get isavailable;

  /// Create a copy of ConnnectivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetWorkStateImplCopyWith<_$NetWorkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
