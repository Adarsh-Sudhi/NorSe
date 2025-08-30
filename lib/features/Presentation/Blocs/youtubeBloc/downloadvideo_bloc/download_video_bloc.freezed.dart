// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_video_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadVideoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url, String id, String qualitylebal,
            double size, String author, String title)
        downloadvideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url, String id, String qualitylebal, double size,
            String author, String title)?
        downloadvideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url, String id, String qualitylebal, double size,
            String author, String title)?
        downloadvideo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DownloadVideo value) downloadvideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DownloadVideo value)? downloadvideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DownloadVideo value)? downloadvideo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadVideoEventCopyWith<$Res> {
  factory $DownloadVideoEventCopyWith(
          DownloadVideoEvent value, $Res Function(DownloadVideoEvent) then) =
      _$DownloadVideoEventCopyWithImpl<$Res, DownloadVideoEvent>;
}

/// @nodoc
class _$DownloadVideoEventCopyWithImpl<$Res, $Val extends DownloadVideoEvent>
    implements $DownloadVideoEventCopyWith<$Res> {
  _$DownloadVideoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DownloadVideoEvent
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
    extends _$DownloadVideoEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DownloadVideoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'DownloadVideoEvent.started()';
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
    required TResult Function(String url, String id, String qualitylebal,
            double size, String author, String title)
        downloadvideo,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url, String id, String qualitylebal, double size,
            String author, String title)?
        downloadvideo,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url, String id, String qualitylebal, double size,
            String author, String title)?
        downloadvideo,
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
    required TResult Function(_DownloadVideo value) downloadvideo,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DownloadVideo value)? downloadvideo,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DownloadVideo value)? downloadvideo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DownloadVideoEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$DownloadVideoImplCopyWith<$Res> {
  factory _$$DownloadVideoImplCopyWith(
          _$DownloadVideoImpl value, $Res Function(_$DownloadVideoImpl) then) =
      __$$DownloadVideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String url,
      String id,
      String qualitylebal,
      double size,
      String author,
      String title});
}

/// @nodoc
class __$$DownloadVideoImplCopyWithImpl<$Res>
    extends _$DownloadVideoEventCopyWithImpl<$Res, _$DownloadVideoImpl>
    implements _$$DownloadVideoImplCopyWith<$Res> {
  __$$DownloadVideoImplCopyWithImpl(
      _$DownloadVideoImpl _value, $Res Function(_$DownloadVideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DownloadVideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? id = null,
    Object? qualitylebal = null,
    Object? size = null,
    Object? author = null,
    Object? title = null,
  }) {
    return _then(_$DownloadVideoImpl(
      null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == qualitylebal
          ? _value.qualitylebal
          : qualitylebal // ignore: cast_nullable_to_non_nullable
              as String,
      null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownloadVideoImpl implements _DownloadVideo {
  const _$DownloadVideoImpl(
      this.url, this.id, this.qualitylebal, this.size, this.author, this.title);

  @override
  final String url;
  @override
  final String id;
  @override
  final String qualitylebal;
  @override
  final double size;
  @override
  final String author;
  @override
  final String title;

  @override
  String toString() {
    return 'DownloadVideoEvent.downloadvideo(url: $url, id: $id, qualitylebal: $qualitylebal, size: $size, author: $author, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadVideoImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.qualitylebal, qualitylebal) ||
                other.qualitylebal == qualitylebal) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, url, id, qualitylebal, size, author, title);

  /// Create a copy of DownloadVideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadVideoImplCopyWith<_$DownloadVideoImpl> get copyWith =>
      __$$DownloadVideoImplCopyWithImpl<_$DownloadVideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String url, String id, String qualitylebal,
            double size, String author, String title)
        downloadvideo,
  }) {
    return downloadvideo(url, id, qualitylebal, size, author, title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String url, String id, String qualitylebal, double size,
            String author, String title)?
        downloadvideo,
  }) {
    return downloadvideo?.call(url, id, qualitylebal, size, author, title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String url, String id, String qualitylebal, double size,
            String author, String title)?
        downloadvideo,
    required TResult orElse(),
  }) {
    if (downloadvideo != null) {
      return downloadvideo(url, id, qualitylebal, size, author, title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DownloadVideo value) downloadvideo,
  }) {
    return downloadvideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DownloadVideo value)? downloadvideo,
  }) {
    return downloadvideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DownloadVideo value)? downloadvideo,
    required TResult orElse(),
  }) {
    if (downloadvideo != null) {
      return downloadvideo(this);
    }
    return orElse();
  }
}

abstract class _DownloadVideo implements DownloadVideoEvent {
  const factory _DownloadVideo(
      final String url,
      final String id,
      final String qualitylebal,
      final double size,
      final String author,
      final String title) = _$DownloadVideoImpl;

  String get url;
  String get id;
  String get qualitylebal;
  double get size;
  String get author;
  String get title;

  /// Create a copy of DownloadVideoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadVideoImplCopyWith<_$DownloadVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DownloadVideoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String id, bool isloading, bool iscomplete,
            String process, BehaviorSubject<int> progresscontroller)
        downloadstarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String id, bool isloading, bool iscomplete,
            String process, BehaviorSubject<int> progresscontroller)?
        downloadstarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String id, bool isloading, bool iscomplete, String process,
            BehaviorSubject<int> progresscontroller)?
        downloadstarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DownloadStarted value) downloadstarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DownloadStarted value)? downloadstarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DownloadStarted value)? downloadstarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadVideoStateCopyWith<$Res> {
  factory $DownloadVideoStateCopyWith(
          DownloadVideoState value, $Res Function(DownloadVideoState) then) =
      _$DownloadVideoStateCopyWithImpl<$Res, DownloadVideoState>;
}

/// @nodoc
class _$DownloadVideoStateCopyWithImpl<$Res, $Val extends DownloadVideoState>
    implements $DownloadVideoStateCopyWith<$Res> {
  _$DownloadVideoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DownloadVideoState
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
    extends _$DownloadVideoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DownloadVideoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DownloadVideoState.initial()';
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
    required TResult Function(String id, bool isloading, bool iscomplete,
            String process, BehaviorSubject<int> progresscontroller)
        downloadstarted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String id, bool isloading, bool iscomplete,
            String process, BehaviorSubject<int> progresscontroller)?
        downloadstarted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String id, bool isloading, bool iscomplete, String process,
            BehaviorSubject<int> progresscontroller)?
        downloadstarted,
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
    required TResult Function(_DownloadStarted value) downloadstarted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DownloadStarted value)? downloadstarted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DownloadStarted value)? downloadstarted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DownloadVideoState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$DownloadStartedImplCopyWith<$Res> {
  factory _$$DownloadStartedImplCopyWith(_$DownloadStartedImpl value,
          $Res Function(_$DownloadStartedImpl) then) =
      __$$DownloadStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String id,
      bool isloading,
      bool iscomplete,
      String process,
      BehaviorSubject<int> progresscontroller});
}

/// @nodoc
class __$$DownloadStartedImplCopyWithImpl<$Res>
    extends _$DownloadVideoStateCopyWithImpl<$Res, _$DownloadStartedImpl>
    implements _$$DownloadStartedImplCopyWith<$Res> {
  __$$DownloadStartedImplCopyWithImpl(
      _$DownloadStartedImpl _value, $Res Function(_$DownloadStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DownloadVideoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isloading = null,
    Object? iscomplete = null,
    Object? process = null,
    Object? progresscontroller = null,
  }) {
    return _then(_$DownloadStartedImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      null == iscomplete
          ? _value.iscomplete
          : iscomplete // ignore: cast_nullable_to_non_nullable
              as bool,
      null == process
          ? _value.process
          : process // ignore: cast_nullable_to_non_nullable
              as String,
      null == progresscontroller
          ? _value.progresscontroller
          : progresscontroller // ignore: cast_nullable_to_non_nullable
              as BehaviorSubject<int>,
    ));
  }
}

/// @nodoc

class _$DownloadStartedImpl implements _DownloadStarted {
  const _$DownloadStartedImpl(this.id, this.isloading, this.iscomplete,
      this.process, this.progresscontroller);

  @override
  final String id;
  @override
  final bool isloading;
  @override
  final bool iscomplete;
  @override
  final String process;
  @override
  final BehaviorSubject<int> progresscontroller;

  @override
  String toString() {
    return 'DownloadVideoState.downloadstarted(id: $id, isloading: $isloading, iscomplete: $iscomplete, process: $process, progresscontroller: $progresscontroller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadStartedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            (identical(other.iscomplete, iscomplete) ||
                other.iscomplete == iscomplete) &&
            (identical(other.process, process) || other.process == process) &&
            (identical(other.progresscontroller, progresscontroller) ||
                other.progresscontroller == progresscontroller));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, isloading, iscomplete, process, progresscontroller);

  /// Create a copy of DownloadVideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadStartedImplCopyWith<_$DownloadStartedImpl> get copyWith =>
      __$$DownloadStartedImplCopyWithImpl<_$DownloadStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String id, bool isloading, bool iscomplete,
            String process, BehaviorSubject<int> progresscontroller)
        downloadstarted,
  }) {
    return downloadstarted(
        id, isloading, iscomplete, process, progresscontroller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String id, bool isloading, bool iscomplete,
            String process, BehaviorSubject<int> progresscontroller)?
        downloadstarted,
  }) {
    return downloadstarted?.call(
        id, isloading, iscomplete, process, progresscontroller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String id, bool isloading, bool iscomplete, String process,
            BehaviorSubject<int> progresscontroller)?
        downloadstarted,
    required TResult orElse(),
  }) {
    if (downloadstarted != null) {
      return downloadstarted(
          id, isloading, iscomplete, process, progresscontroller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DownloadStarted value) downloadstarted,
  }) {
    return downloadstarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DownloadStarted value)? downloadstarted,
  }) {
    return downloadstarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DownloadStarted value)? downloadstarted,
    required TResult orElse(),
  }) {
    if (downloadstarted != null) {
      return downloadstarted(this);
    }
    return orElse();
  }
}

abstract class _DownloadStarted implements DownloadVideoState {
  const factory _DownloadStarted(
      final String id,
      final bool isloading,
      final bool iscomplete,
      final String process,
      final BehaviorSubject<int> progresscontroller) = _$DownloadStartedImpl;

  String get id;
  bool get isloading;
  bool get iscomplete;
  String get process;
  BehaviorSubject<int> get progresscontroller;

  /// Create a copy of DownloadVideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadStartedImplCopyWith<_$DownloadStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
