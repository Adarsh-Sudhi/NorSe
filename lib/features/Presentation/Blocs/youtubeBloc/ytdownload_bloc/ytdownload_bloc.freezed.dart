// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ytdownload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$YtdownloadEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            AudioOnlyStreamInfo audiostream, Video info, String id)
        downloadsong,
    required TResult Function(String title, String artists, String arturl)
        downloadsongspotify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AudioOnlyStreamInfo audiostream, Video info, String id)?
        downloadsong,
    TResult? Function(String title, String artists, String arturl)?
        downloadsongspotify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AudioOnlyStreamInfo audiostream, Video info, String id)?
        downloadsong,
    TResult Function(String title, String artists, String arturl)?
        downloadsongspotify,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Download value) downloadsong,
    required TResult Function(_DownloadSpotify value) downloadsongspotify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Download value)? downloadsong,
    TResult? Function(_DownloadSpotify value)? downloadsongspotify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Download value)? downloadsong,
    TResult Function(_DownloadSpotify value)? downloadsongspotify,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YtdownloadEventCopyWith<$Res> {
  factory $YtdownloadEventCopyWith(
          YtdownloadEvent value, $Res Function(YtdownloadEvent) then) =
      _$YtdownloadEventCopyWithImpl<$Res, YtdownloadEvent>;
}

/// @nodoc
class _$YtdownloadEventCopyWithImpl<$Res, $Val extends YtdownloadEvent>
    implements $YtdownloadEventCopyWith<$Res> {
  _$YtdownloadEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YtdownloadEvent
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
    extends _$YtdownloadEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of YtdownloadEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YtdownloadEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'YtdownloadEvent.started'));
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
    required TResult Function(
            AudioOnlyStreamInfo audiostream, Video info, String id)
        downloadsong,
    required TResult Function(String title, String artists, String arturl)
        downloadsongspotify,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AudioOnlyStreamInfo audiostream, Video info, String id)?
        downloadsong,
    TResult? Function(String title, String artists, String arturl)?
        downloadsongspotify,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AudioOnlyStreamInfo audiostream, Video info, String id)?
        downloadsong,
    TResult Function(String title, String artists, String arturl)?
        downloadsongspotify,
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
    required TResult Function(_Download value) downloadsong,
    required TResult Function(_DownloadSpotify value) downloadsongspotify,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Download value)? downloadsong,
    TResult? Function(_DownloadSpotify value)? downloadsongspotify,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Download value)? downloadsong,
    TResult Function(_DownloadSpotify value)? downloadsongspotify,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements YtdownloadEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$DownloadImplCopyWith<$Res> {
  factory _$$DownloadImplCopyWith(
          _$DownloadImpl value, $Res Function(_$DownloadImpl) then) =
      __$$DownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AudioOnlyStreamInfo audiostream, Video info, String id});

  $VideoCopyWith<$Res> get info;
}

/// @nodoc
class __$$DownloadImplCopyWithImpl<$Res>
    extends _$YtdownloadEventCopyWithImpl<$Res, _$DownloadImpl>
    implements _$$DownloadImplCopyWith<$Res> {
  __$$DownloadImplCopyWithImpl(
      _$DownloadImpl _value, $Res Function(_$DownloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of YtdownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audiostream = null,
    Object? info = null,
    Object? id = null,
  }) {
    return _then(_$DownloadImpl(
      null == audiostream
          ? _value.audiostream
          : audiostream // ignore: cast_nullable_to_non_nullable
              as AudioOnlyStreamInfo,
      null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Video,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of YtdownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoCopyWith<$Res> get info {
    return $VideoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value));
    });
  }
}

/// @nodoc

class _$DownloadImpl with DiagnosticableTreeMixin implements _Download {
  const _$DownloadImpl(this.audiostream, this.info, this.id);

  @override
  final AudioOnlyStreamInfo audiostream;
  @override
  final Video info;
  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YtdownloadEvent.downloadsong(audiostream: $audiostream, info: $info, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'YtdownloadEvent.downloadsong'))
      ..add(DiagnosticsProperty('audiostream', audiostream))
      ..add(DiagnosticsProperty('info', info))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadImpl &&
            (identical(other.audiostream, audiostream) ||
                other.audiostream == audiostream) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audiostream, info, id);

  /// Create a copy of YtdownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadImplCopyWith<_$DownloadImpl> get copyWith =>
      __$$DownloadImplCopyWithImpl<_$DownloadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            AudioOnlyStreamInfo audiostream, Video info, String id)
        downloadsong,
    required TResult Function(String title, String artists, String arturl)
        downloadsongspotify,
  }) {
    return downloadsong(audiostream, info, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AudioOnlyStreamInfo audiostream, Video info, String id)?
        downloadsong,
    TResult? Function(String title, String artists, String arturl)?
        downloadsongspotify,
  }) {
    return downloadsong?.call(audiostream, info, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AudioOnlyStreamInfo audiostream, Video info, String id)?
        downloadsong,
    TResult Function(String title, String artists, String arturl)?
        downloadsongspotify,
    required TResult orElse(),
  }) {
    if (downloadsong != null) {
      return downloadsong(audiostream, info, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Download value) downloadsong,
    required TResult Function(_DownloadSpotify value) downloadsongspotify,
  }) {
    return downloadsong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Download value)? downloadsong,
    TResult? Function(_DownloadSpotify value)? downloadsongspotify,
  }) {
    return downloadsong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Download value)? downloadsong,
    TResult Function(_DownloadSpotify value)? downloadsongspotify,
    required TResult orElse(),
  }) {
    if (downloadsong != null) {
      return downloadsong(this);
    }
    return orElse();
  }
}

abstract class _Download implements YtdownloadEvent {
  const factory _Download(final AudioOnlyStreamInfo audiostream,
      final Video info, final String id) = _$DownloadImpl;

  AudioOnlyStreamInfo get audiostream;
  Video get info;
  String get id;

  /// Create a copy of YtdownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadImplCopyWith<_$DownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadSpotifyImplCopyWith<$Res> {
  factory _$$DownloadSpotifyImplCopyWith(_$DownloadSpotifyImpl value,
          $Res Function(_$DownloadSpotifyImpl) then) =
      __$$DownloadSpotifyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title, String artists, String arturl});
}

/// @nodoc
class __$$DownloadSpotifyImplCopyWithImpl<$Res>
    extends _$YtdownloadEventCopyWithImpl<$Res, _$DownloadSpotifyImpl>
    implements _$$DownloadSpotifyImplCopyWith<$Res> {
  __$$DownloadSpotifyImplCopyWithImpl(
      _$DownloadSpotifyImpl _value, $Res Function(_$DownloadSpotifyImpl) _then)
      : super(_value, _then);

  /// Create a copy of YtdownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? artists = null,
    Object? arturl = null,
  }) {
    return _then(_$DownloadSpotifyImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as String,
      null == arturl
          ? _value.arturl
          : arturl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownloadSpotifyImpl
    with DiagnosticableTreeMixin
    implements _DownloadSpotify {
  const _$DownloadSpotifyImpl(this.title, this.artists, this.arturl);

  @override
  final String title;
  @override
  final String artists;
  @override
  final String arturl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YtdownloadEvent.downloadsongspotify(title: $title, artists: $artists, arturl: $arturl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'YtdownloadEvent.downloadsongspotify'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('artists', artists))
      ..add(DiagnosticsProperty('arturl', arturl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadSpotifyImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artists, artists) || other.artists == artists) &&
            (identical(other.arturl, arturl) || other.arturl == arturl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, artists, arturl);

  /// Create a copy of YtdownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadSpotifyImplCopyWith<_$DownloadSpotifyImpl> get copyWith =>
      __$$DownloadSpotifyImplCopyWithImpl<_$DownloadSpotifyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            AudioOnlyStreamInfo audiostream, Video info, String id)
        downloadsong,
    required TResult Function(String title, String artists, String arturl)
        downloadsongspotify,
  }) {
    return downloadsongspotify(title, artists, arturl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(AudioOnlyStreamInfo audiostream, Video info, String id)?
        downloadsong,
    TResult? Function(String title, String artists, String arturl)?
        downloadsongspotify,
  }) {
    return downloadsongspotify?.call(title, artists, arturl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(AudioOnlyStreamInfo audiostream, Video info, String id)?
        downloadsong,
    TResult Function(String title, String artists, String arturl)?
        downloadsongspotify,
    required TResult orElse(),
  }) {
    if (downloadsongspotify != null) {
      return downloadsongspotify(title, artists, arturl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Download value) downloadsong,
    required TResult Function(_DownloadSpotify value) downloadsongspotify,
  }) {
    return downloadsongspotify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Download value)? downloadsong,
    TResult? Function(_DownloadSpotify value)? downloadsongspotify,
  }) {
    return downloadsongspotify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Download value)? downloadsong,
    TResult Function(_DownloadSpotify value)? downloadsongspotify,
    required TResult orElse(),
  }) {
    if (downloadsongspotify != null) {
      return downloadsongspotify(this);
    }
    return orElse();
  }
}

abstract class _DownloadSpotify implements YtdownloadEvent {
  const factory _DownloadSpotify(
          final String title, final String artists, final String arturl) =
      _$DownloadSpotifyImpl;

  String get title;
  String get artists;
  String get arturl;

  /// Create a copy of YtdownloadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadSpotifyImplCopyWith<_$DownloadSpotifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$YtdownloadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(StreamController<int> progress) downloading,
    required TResult Function() complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StreamController<int> progress)? downloading,
    TResult? Function()? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StreamController<int> progress)? downloading,
    TResult Function()? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loader value) loading,
    required TResult Function(_Downdloading value) downloading,
    required TResult Function(_Complete value) complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loader value)? loading,
    TResult? Function(_Downdloading value)? downloading,
    TResult? Function(_Complete value)? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loader value)? loading,
    TResult Function(_Downdloading value)? downloading,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YtdownloadStateCopyWith<$Res> {
  factory $YtdownloadStateCopyWith(
          YtdownloadState value, $Res Function(YtdownloadState) then) =
      _$YtdownloadStateCopyWithImpl<$Res, YtdownloadState>;
}

/// @nodoc
class _$YtdownloadStateCopyWithImpl<$Res, $Val extends YtdownloadState>
    implements $YtdownloadStateCopyWith<$Res> {
  _$YtdownloadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YtdownloadState
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
    extends _$YtdownloadStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of YtdownloadState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YtdownloadState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'YtdownloadState.initial'));
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
    required TResult Function() loading,
    required TResult Function(StreamController<int> progress) downloading,
    required TResult Function() complete,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StreamController<int> progress)? downloading,
    TResult? Function()? complete,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StreamController<int> progress)? downloading,
    TResult Function()? complete,
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
    required TResult Function(_Loader value) loading,
    required TResult Function(_Downdloading value) downloading,
    required TResult Function(_Complete value) complete,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loader value)? loading,
    TResult? Function(_Downdloading value)? downloading,
    TResult? Function(_Complete value)? complete,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loader value)? loading,
    TResult Function(_Downdloading value)? downloading,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements YtdownloadState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoaderImplCopyWith<$Res> {
  factory _$$LoaderImplCopyWith(
          _$LoaderImpl value, $Res Function(_$LoaderImpl) then) =
      __$$LoaderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoaderImplCopyWithImpl<$Res>
    extends _$YtdownloadStateCopyWithImpl<$Res, _$LoaderImpl>
    implements _$$LoaderImplCopyWith<$Res> {
  __$$LoaderImplCopyWithImpl(
      _$LoaderImpl _value, $Res Function(_$LoaderImpl) _then)
      : super(_value, _then);

  /// Create a copy of YtdownloadState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoaderImpl with DiagnosticableTreeMixin implements _Loader {
  const _$LoaderImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YtdownloadState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'YtdownloadState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoaderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(StreamController<int> progress) downloading,
    required TResult Function() complete,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StreamController<int> progress)? downloading,
    TResult? Function()? complete,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StreamController<int> progress)? downloading,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loader value) loading,
    required TResult Function(_Downdloading value) downloading,
    required TResult Function(_Complete value) complete,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loader value)? loading,
    TResult? Function(_Downdloading value)? downloading,
    TResult? Function(_Complete value)? complete,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loader value)? loading,
    TResult Function(_Downdloading value)? downloading,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loader implements YtdownloadState {
  const factory _Loader() = _$LoaderImpl;
}

/// @nodoc
abstract class _$$DowndloadingImplCopyWith<$Res> {
  factory _$$DowndloadingImplCopyWith(
          _$DowndloadingImpl value, $Res Function(_$DowndloadingImpl) then) =
      __$$DowndloadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StreamController<int> progress});
}

/// @nodoc
class __$$DowndloadingImplCopyWithImpl<$Res>
    extends _$YtdownloadStateCopyWithImpl<$Res, _$DowndloadingImpl>
    implements _$$DowndloadingImplCopyWith<$Res> {
  __$$DowndloadingImplCopyWithImpl(
      _$DowndloadingImpl _value, $Res Function(_$DowndloadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of YtdownloadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$DowndloadingImpl(
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as StreamController<int>,
    ));
  }
}

/// @nodoc

class _$DowndloadingImpl with DiagnosticableTreeMixin implements _Downdloading {
  const _$DowndloadingImpl(this.progress);

  @override
  final StreamController<int> progress;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YtdownloadState.downloading(progress: $progress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'YtdownloadState.downloading'))
      ..add(DiagnosticsProperty('progress', progress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DowndloadingImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  /// Create a copy of YtdownloadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DowndloadingImplCopyWith<_$DowndloadingImpl> get copyWith =>
      __$$DowndloadingImplCopyWithImpl<_$DowndloadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(StreamController<int> progress) downloading,
    required TResult Function() complete,
  }) {
    return downloading(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StreamController<int> progress)? downloading,
    TResult? Function()? complete,
  }) {
    return downloading?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StreamController<int> progress)? downloading,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loader value) loading,
    required TResult Function(_Downdloading value) downloading,
    required TResult Function(_Complete value) complete,
  }) {
    return downloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loader value)? loading,
    TResult? Function(_Downdloading value)? downloading,
    TResult? Function(_Complete value)? complete,
  }) {
    return downloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loader value)? loading,
    TResult Function(_Downdloading value)? downloading,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(this);
    }
    return orElse();
  }
}

abstract class _Downdloading implements YtdownloadState {
  const factory _Downdloading(final StreamController<int> progress) =
      _$DowndloadingImpl;

  StreamController<int> get progress;

  /// Create a copy of YtdownloadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DowndloadingImplCopyWith<_$DowndloadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteImplCopyWith<$Res> {
  factory _$$CompleteImplCopyWith(
          _$CompleteImpl value, $Res Function(_$CompleteImpl) then) =
      __$$CompleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompleteImplCopyWithImpl<$Res>
    extends _$YtdownloadStateCopyWithImpl<$Res, _$CompleteImpl>
    implements _$$CompleteImplCopyWith<$Res> {
  __$$CompleteImplCopyWithImpl(
      _$CompleteImpl _value, $Res Function(_$CompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of YtdownloadState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CompleteImpl with DiagnosticableTreeMixin implements _Complete {
  const _$CompleteImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YtdownloadState.complete()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'YtdownloadState.complete'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompleteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(StreamController<int> progress) downloading,
    required TResult Function() complete,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(StreamController<int> progress)? downloading,
    TResult? Function()? complete,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(StreamController<int> progress)? downloading,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loader value) loading,
    required TResult Function(_Downdloading value) downloading,
    required TResult Function(_Complete value) complete,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loader value)? loading,
    TResult? Function(_Downdloading value)? downloading,
    TResult? Function(_Complete value)? complete,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loader value)? loading,
    TResult Function(_Downdloading value)? downloading,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class _Complete implements YtdownloadState {
  const factory _Complete() = _$CompleteImpl;
}
