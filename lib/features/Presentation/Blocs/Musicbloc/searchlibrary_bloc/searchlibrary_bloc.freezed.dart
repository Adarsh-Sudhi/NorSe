// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searchlibrary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchlibraryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) querylibrarysongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? querylibrarysongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? querylibrarysongs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LibraryQuery value) querylibrarysongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LibraryQuery value)? querylibrarysongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LibraryQuery value)? querylibrarysongs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchlibraryEventCopyWith<$Res> {
  factory $SearchlibraryEventCopyWith(
          SearchlibraryEvent value, $Res Function(SearchlibraryEvent) then) =
      _$SearchlibraryEventCopyWithImpl<$Res, SearchlibraryEvent>;
}

/// @nodoc
class _$SearchlibraryEventCopyWithImpl<$Res, $Val extends SearchlibraryEvent>
    implements $SearchlibraryEventCopyWith<$Res> {
  _$SearchlibraryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchlibraryEvent
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
    extends _$SearchlibraryEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchlibraryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SearchlibraryEvent.started()';
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
    required TResult Function(String query) querylibrarysongs,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? querylibrarysongs,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? querylibrarysongs,
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
    required TResult Function(_LibraryQuery value) querylibrarysongs,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LibraryQuery value)? querylibrarysongs,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LibraryQuery value)? querylibrarysongs,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SearchlibraryEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$LibraryQueryImplCopyWith<$Res> {
  factory _$$LibraryQueryImplCopyWith(
          _$LibraryQueryImpl value, $Res Function(_$LibraryQueryImpl) then) =
      __$$LibraryQueryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$LibraryQueryImplCopyWithImpl<$Res>
    extends _$SearchlibraryEventCopyWithImpl<$Res, _$LibraryQueryImpl>
    implements _$$LibraryQueryImplCopyWith<$Res> {
  __$$LibraryQueryImplCopyWithImpl(
      _$LibraryQueryImpl _value, $Res Function(_$LibraryQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchlibraryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$LibraryQueryImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LibraryQueryImpl implements _LibraryQuery {
  const _$LibraryQueryImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SearchlibraryEvent.querylibrarysongs(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryQueryImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SearchlibraryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryQueryImplCopyWith<_$LibraryQueryImpl> get copyWith =>
      __$$LibraryQueryImplCopyWithImpl<_$LibraryQueryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) querylibrarysongs,
  }) {
    return querylibrarysongs(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? querylibrarysongs,
  }) {
    return querylibrarysongs?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? querylibrarysongs,
    required TResult orElse(),
  }) {
    if (querylibrarysongs != null) {
      return querylibrarysongs(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LibraryQuery value) querylibrarysongs,
  }) {
    return querylibrarysongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LibraryQuery value)? querylibrarysongs,
  }) {
    return querylibrarysongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LibraryQuery value)? querylibrarysongs,
    required TResult orElse(),
  }) {
    if (querylibrarysongs != null) {
      return querylibrarysongs(this);
    }
    return orElse();
  }
}

abstract class _LibraryQuery implements SearchlibraryEvent {
  const factory _LibraryQuery(final String query) = _$LibraryQueryImpl;

  String get query;

  /// Create a copy of SearchlibraryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LibraryQueryImplCopyWith<_$LibraryQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchlibraryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Stream<List<List<Map<String, dynamic>>>> stream)
        onRearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Stream<List<List<Map<String, dynamic>>>> stream)?
        onRearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<List<List<Map<String, dynamic>>>> stream)? onRearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Onsearch value) onRearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Onsearch value)? onRearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onsearch value)? onRearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchlibraryStateCopyWith<$Res> {
  factory $SearchlibraryStateCopyWith(
          SearchlibraryState value, $Res Function(SearchlibraryState) then) =
      _$SearchlibraryStateCopyWithImpl<$Res, SearchlibraryState>;
}

/// @nodoc
class _$SearchlibraryStateCopyWithImpl<$Res, $Val extends SearchlibraryState>
    implements $SearchlibraryStateCopyWith<$Res> {
  _$SearchlibraryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchlibraryState
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
    extends _$SearchlibraryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchlibraryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SearchlibraryState.initial()';
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
    required TResult Function(Stream<List<List<Map<String, dynamic>>>> stream)
        onRearch,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Stream<List<List<Map<String, dynamic>>>> stream)?
        onRearch,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<List<List<Map<String, dynamic>>>> stream)? onRearch,
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
    required TResult Function(_Onsearch value) onRearch,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Onsearch value)? onRearch,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onsearch value)? onRearch,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchlibraryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$OnsearchImplCopyWith<$Res> {
  factory _$$OnsearchImplCopyWith(
          _$OnsearchImpl value, $Res Function(_$OnsearchImpl) then) =
      __$$OnsearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Stream<List<List<Map<String, dynamic>>>> stream});
}

/// @nodoc
class __$$OnsearchImplCopyWithImpl<$Res>
    extends _$SearchlibraryStateCopyWithImpl<$Res, _$OnsearchImpl>
    implements _$$OnsearchImplCopyWith<$Res> {
  __$$OnsearchImplCopyWithImpl(
      _$OnsearchImpl _value, $Res Function(_$OnsearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchlibraryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stream = null,
  }) {
    return _then(_$OnsearchImpl(
      null == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<List<List<Map<String, dynamic>>>>,
    ));
  }
}

/// @nodoc

class _$OnsearchImpl implements _Onsearch {
  const _$OnsearchImpl(this.stream);

  @override
  final Stream<List<List<Map<String, dynamic>>>> stream;

  @override
  String toString() {
    return 'SearchlibraryState.onRearch(stream: $stream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnsearchImpl &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stream);

  /// Create a copy of SearchlibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnsearchImplCopyWith<_$OnsearchImpl> get copyWith =>
      __$$OnsearchImplCopyWithImpl<_$OnsearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Stream<List<List<Map<String, dynamic>>>> stream)
        onRearch,
  }) {
    return onRearch(stream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Stream<List<List<Map<String, dynamic>>>> stream)?
        onRearch,
  }) {
    return onRearch?.call(stream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Stream<List<List<Map<String, dynamic>>>> stream)? onRearch,
    required TResult orElse(),
  }) {
    if (onRearch != null) {
      return onRearch(stream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Onsearch value) onRearch,
  }) {
    return onRearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Onsearch value)? onRearch,
  }) {
    return onRearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Onsearch value)? onRearch,
    required TResult orElse(),
  }) {
    if (onRearch != null) {
      return onRearch(this);
    }
    return orElse();
  }
}

abstract class _Onsearch implements SearchlibraryState {
  const factory _Onsearch(
      final Stream<List<List<Map<String, dynamic>>>> stream) = _$OnsearchImpl;

  Stream<List<List<Map<String, dynamic>>>> get stream;

  /// Create a copy of SearchlibraryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnsearchImplCopyWith<_$OnsearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
