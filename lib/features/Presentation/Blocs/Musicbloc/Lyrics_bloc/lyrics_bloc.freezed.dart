// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyrics_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LyricsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, String title) getlyrics,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id, String title)? getlyrics,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String title)? getlyrics,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getlyrics value) getlyrics,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getlyrics value)? getlyrics,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getlyrics value)? getlyrics,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricsEventCopyWith<$Res> {
  factory $LyricsEventCopyWith(
          LyricsEvent value, $Res Function(LyricsEvent) then) =
      _$LyricsEventCopyWithImpl<$Res, LyricsEvent>;
}

/// @nodoc
class _$LyricsEventCopyWithImpl<$Res, $Val extends LyricsEvent>
    implements $LyricsEventCopyWith<$Res> {
  _$LyricsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricsEvent
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
    extends _$LyricsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'LyricsEvent.started()';
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
    required TResult Function(String id, String title) getlyrics,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id, String title)? getlyrics,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String title)? getlyrics,
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
    required TResult Function(_Getlyrics value) getlyrics,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getlyrics value)? getlyrics,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getlyrics value)? getlyrics,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LyricsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetlyricsImplCopyWith<$Res> {
  factory _$$GetlyricsImplCopyWith(
          _$GetlyricsImpl value, $Res Function(_$GetlyricsImpl) then) =
      __$$GetlyricsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$GetlyricsImplCopyWithImpl<$Res>
    extends _$LyricsEventCopyWithImpl<$Res, _$GetlyricsImpl>
    implements _$$GetlyricsImplCopyWith<$Res> {
  __$$GetlyricsImplCopyWithImpl(
      _$GetlyricsImpl _value, $Res Function(_$GetlyricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$GetlyricsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetlyricsImpl implements _Getlyrics {
  const _$GetlyricsImpl(this.id, this.title);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'LyricsEvent.getlyrics(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetlyricsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetlyricsImplCopyWith<_$GetlyricsImpl> get copyWith =>
      __$$GetlyricsImplCopyWithImpl<_$GetlyricsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, String title) getlyrics,
  }) {
    return getlyrics(id, title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String id, String title)? getlyrics,
  }) {
    return getlyrics?.call(id, title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String title)? getlyrics,
    required TResult orElse(),
  }) {
    if (getlyrics != null) {
      return getlyrics(id, title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getlyrics value) getlyrics,
  }) {
    return getlyrics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getlyrics value)? getlyrics,
  }) {
    return getlyrics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getlyrics value)? getlyrics,
    required TResult orElse(),
  }) {
    if (getlyrics != null) {
      return getlyrics(this);
    }
    return orElse();
  }
}

abstract class _Getlyrics implements LyricsEvent {
  const factory _Getlyrics(final String id, final String title) =
      _$GetlyricsImpl;

  String get id;
  String get title;

  /// Create a copy of LyricsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetlyricsImplCopyWith<_$GetlyricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LyricsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, dynamic> lyrics) lyrics,
    required TResult Function() loader,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, dynamic> lyrics)? lyrics,
    TResult? Function()? loader,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, dynamic> lyrics)? lyrics,
    TResult Function()? loader,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Lyrics value) lyrics,
    required TResult Function(_Loading value) loader,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Lyrics value)? lyrics,
    TResult? Function(_Loading value)? loader,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Lyrics value)? lyrics,
    TResult Function(_Loading value)? loader,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LyricsStateCopyWith<$Res> {
  factory $LyricsStateCopyWith(
          LyricsState value, $Res Function(LyricsState) then) =
      _$LyricsStateCopyWithImpl<$Res, LyricsState>;
}

/// @nodoc
class _$LyricsStateCopyWithImpl<$Res, $Val extends LyricsState>
    implements $LyricsStateCopyWith<$Res> {
  _$LyricsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LyricsState
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
    extends _$LyricsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LyricsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LyricsState.initial()';
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
    required TResult Function(Map<String, dynamic> lyrics) lyrics,
    required TResult Function() loader,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, dynamic> lyrics)? lyrics,
    TResult? Function()? loader,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, dynamic> lyrics)? lyrics,
    TResult Function()? loader,
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
    required TResult Function(_Lyrics value) lyrics,
    required TResult Function(_Loading value) loader,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Lyrics value)? lyrics,
    TResult? Function(_Loading value)? loader,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Lyrics value)? lyrics,
    TResult Function(_Loading value)? loader,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LyricsState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LyricsImplCopyWith<$Res> {
  factory _$$LyricsImplCopyWith(
          _$LyricsImpl value, $Res Function(_$LyricsImpl) then) =
      __$$LyricsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> lyrics});
}

/// @nodoc
class __$$LyricsImplCopyWithImpl<$Res>
    extends _$LyricsStateCopyWithImpl<$Res, _$LyricsImpl>
    implements _$$LyricsImplCopyWith<$Res> {
  __$$LyricsImplCopyWithImpl(
      _$LyricsImpl _value, $Res Function(_$LyricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LyricsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lyrics = null,
  }) {
    return _then(_$LyricsImpl(
      null == lyrics
          ? _value._lyrics
          : lyrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$LyricsImpl implements _Lyrics {
  const _$LyricsImpl(final Map<String, dynamic> lyrics) : _lyrics = lyrics;

  final Map<String, dynamic> _lyrics;
  @override
  Map<String, dynamic> get lyrics {
    if (_lyrics is EqualUnmodifiableMapView) return _lyrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lyrics);
  }

  @override
  String toString() {
    return 'LyricsState.lyrics(lyrics: $lyrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LyricsImpl &&
            const DeepCollectionEquality().equals(other._lyrics, _lyrics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lyrics));

  /// Create a copy of LyricsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LyricsImplCopyWith<_$LyricsImpl> get copyWith =>
      __$$LyricsImplCopyWithImpl<_$LyricsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, dynamic> lyrics) lyrics,
    required TResult Function() loader,
  }) {
    return lyrics(this.lyrics);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, dynamic> lyrics)? lyrics,
    TResult? Function()? loader,
  }) {
    return lyrics?.call(this.lyrics);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, dynamic> lyrics)? lyrics,
    TResult Function()? loader,
    required TResult orElse(),
  }) {
    if (lyrics != null) {
      return lyrics(this.lyrics);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Lyrics value) lyrics,
    required TResult Function(_Loading value) loader,
  }) {
    return lyrics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Lyrics value)? lyrics,
    TResult? Function(_Loading value)? loader,
  }) {
    return lyrics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Lyrics value)? lyrics,
    TResult Function(_Loading value)? loader,
    required TResult orElse(),
  }) {
    if (lyrics != null) {
      return lyrics(this);
    }
    return orElse();
  }
}

abstract class _Lyrics implements LyricsState {
  const factory _Lyrics(final Map<String, dynamic> lyrics) = _$LyricsImpl;

  Map<String, dynamic> get lyrics;

  /// Create a copy of LyricsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LyricsImplCopyWith<_$LyricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LyricsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LyricsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LyricsState.loader()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, dynamic> lyrics) lyrics,
    required TResult Function() loader,
  }) {
    return loader();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, dynamic> lyrics)? lyrics,
    TResult? Function()? loader,
  }) {
    return loader?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, dynamic> lyrics)? lyrics,
    TResult Function()? loader,
    required TResult orElse(),
  }) {
    if (loader != null) {
      return loader();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Lyrics value) lyrics,
    required TResult Function(_Loading value) loader,
  }) {
    return loader(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Lyrics value)? lyrics,
    TResult? Function(_Loading value)? loader,
  }) {
    return loader?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Lyrics value)? lyrics,
    TResult Function(_Loading value)? loader,
    required TResult orElse(),
  }) {
    if (loader != null) {
      return loader(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LyricsState {
  const factory _Loading() = _$LoadingImpl;
}
