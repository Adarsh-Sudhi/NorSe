// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_player_background_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$YoutubePlayerBackgroundEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idortitle, String quality) getinitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idortitle, String quality)? getinitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idortitle, String quality)? getinitialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Initialize value) getinitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Initialize value)? getinitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Initialize value)? getinitialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubePlayerBackgroundEventCopyWith<$Res> {
  factory $YoutubePlayerBackgroundEventCopyWith(
          YoutubePlayerBackgroundEvent value,
          $Res Function(YoutubePlayerBackgroundEvent) then) =
      _$YoutubePlayerBackgroundEventCopyWithImpl<$Res,
          YoutubePlayerBackgroundEvent>;
}

/// @nodoc
class _$YoutubePlayerBackgroundEventCopyWithImpl<$Res,
        $Val extends YoutubePlayerBackgroundEvent>
    implements $YoutubePlayerBackgroundEventCopyWith<$Res> {
  _$YoutubePlayerBackgroundEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubePlayerBackgroundEvent
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
    extends _$YoutubePlayerBackgroundEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubePlayerBackgroundEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubePlayerBackgroundEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'YoutubePlayerBackgroundEvent.started'));
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
    required TResult Function(String idortitle, String quality) getinitialized,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idortitle, String quality)? getinitialized,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idortitle, String quality)? getinitialized,
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
    required TResult Function(_Initialize value) getinitialized,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Initialize value)? getinitialized,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Initialize value)? getinitialized,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements YoutubePlayerBackgroundEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String idortitle, String quality});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$YoutubePlayerBackgroundEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubePlayerBackgroundEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idortitle = null,
    Object? quality = null,
  }) {
    return _then(_$InitializeImpl(
      null == idortitle
          ? _value.idortitle
          : idortitle // ignore: cast_nullable_to_non_nullable
              as String,
      null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitializeImpl with DiagnosticableTreeMixin implements _Initialize {
  const _$InitializeImpl(this.idortitle, this.quality);

  @override
  final String idortitle;
  @override
  final String quality;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubePlayerBackgroundEvent.getinitialized(idortitle: $idortitle, quality: $quality)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'YoutubePlayerBackgroundEvent.getinitialized'))
      ..add(DiagnosticsProperty('idortitle', idortitle))
      ..add(DiagnosticsProperty('quality', quality));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.idortitle, idortitle) ||
                other.idortitle == idortitle) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idortitle, quality);

  /// Create a copy of YoutubePlayerBackgroundEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String idortitle, String quality) getinitialized,
  }) {
    return getinitialized(idortitle, quality);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String idortitle, String quality)? getinitialized,
  }) {
    return getinitialized?.call(idortitle, quality);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String idortitle, String quality)? getinitialized,
    required TResult orElse(),
  }) {
    if (getinitialized != null) {
      return getinitialized(idortitle, quality);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Initialize value) getinitialized,
  }) {
    return getinitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Initialize value)? getinitialized,
  }) {
    return getinitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Initialize value)? getinitialized,
    required TResult orElse(),
  }) {
    if (getinitialized != null) {
      return getinitialized(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements YoutubePlayerBackgroundEvent {
  const factory _Initialize(final String idortitle, final String quality) =
      _$InitializeImpl;

  String get idortitle;
  String get quality;

  /// Create a copy of YoutubePlayerBackgroundEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$YoutubePlayerBackgroundState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingBg,
    required TResult Function(
            VideoController controller, Stream<Map<String, Duration>> streams)
        playBgvideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingBg,
    TResult? Function(
            VideoController controller, Stream<Map<String, Duration>> streams)?
        playBgvideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingBg,
    TResult Function(
            VideoController controller, Stream<Map<String, Duration>> streams)?
        playBgvideo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingBg value) loadingBg,
    required TResult Function(_PlayBgvideo value) playBgvideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingBg value)? loadingBg,
    TResult? Function(_PlayBgvideo value)? playBgvideo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingBg value)? loadingBg,
    TResult Function(_PlayBgvideo value)? playBgvideo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubePlayerBackgroundStateCopyWith<$Res> {
  factory $YoutubePlayerBackgroundStateCopyWith(
          YoutubePlayerBackgroundState value,
          $Res Function(YoutubePlayerBackgroundState) then) =
      _$YoutubePlayerBackgroundStateCopyWithImpl<$Res,
          YoutubePlayerBackgroundState>;
}

/// @nodoc
class _$YoutubePlayerBackgroundStateCopyWithImpl<$Res,
        $Val extends YoutubePlayerBackgroundState>
    implements $YoutubePlayerBackgroundStateCopyWith<$Res> {
  _$YoutubePlayerBackgroundStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubePlayerBackgroundState
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
    extends _$YoutubePlayerBackgroundStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubePlayerBackgroundState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubePlayerBackgroundState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'YoutubePlayerBackgroundState.initial'));
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
    required TResult Function() loadingBg,
    required TResult Function(
            VideoController controller, Stream<Map<String, Duration>> streams)
        playBgvideo,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingBg,
    TResult? Function(
            VideoController controller, Stream<Map<String, Duration>> streams)?
        playBgvideo,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingBg,
    TResult Function(
            VideoController controller, Stream<Map<String, Duration>> streams)?
        playBgvideo,
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
    required TResult Function(_LoadingBg value) loadingBg,
    required TResult Function(_PlayBgvideo value) playBgvideo,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingBg value)? loadingBg,
    TResult? Function(_PlayBgvideo value)? playBgvideo,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingBg value)? loadingBg,
    TResult Function(_PlayBgvideo value)? playBgvideo,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements YoutubePlayerBackgroundState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingBgImplCopyWith<$Res> {
  factory _$$LoadingBgImplCopyWith(
          _$LoadingBgImpl value, $Res Function(_$LoadingBgImpl) then) =
      __$$LoadingBgImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingBgImplCopyWithImpl<$Res>
    extends _$YoutubePlayerBackgroundStateCopyWithImpl<$Res, _$LoadingBgImpl>
    implements _$$LoadingBgImplCopyWith<$Res> {
  __$$LoadingBgImplCopyWithImpl(
      _$LoadingBgImpl _value, $Res Function(_$LoadingBgImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubePlayerBackgroundState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingBgImpl with DiagnosticableTreeMixin implements _LoadingBg {
  const _$LoadingBgImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubePlayerBackgroundState.loadingBg()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'YoutubePlayerBackgroundState.loadingBg'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingBgImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingBg,
    required TResult Function(
            VideoController controller, Stream<Map<String, Duration>> streams)
        playBgvideo,
  }) {
    return loadingBg();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingBg,
    TResult? Function(
            VideoController controller, Stream<Map<String, Duration>> streams)?
        playBgvideo,
  }) {
    return loadingBg?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingBg,
    TResult Function(
            VideoController controller, Stream<Map<String, Duration>> streams)?
        playBgvideo,
    required TResult orElse(),
  }) {
    if (loadingBg != null) {
      return loadingBg();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingBg value) loadingBg,
    required TResult Function(_PlayBgvideo value) playBgvideo,
  }) {
    return loadingBg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingBg value)? loadingBg,
    TResult? Function(_PlayBgvideo value)? playBgvideo,
  }) {
    return loadingBg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingBg value)? loadingBg,
    TResult Function(_PlayBgvideo value)? playBgvideo,
    required TResult orElse(),
  }) {
    if (loadingBg != null) {
      return loadingBg(this);
    }
    return orElse();
  }
}

abstract class _LoadingBg implements YoutubePlayerBackgroundState {
  const factory _LoadingBg() = _$LoadingBgImpl;
}

/// @nodoc
abstract class _$$PlayBgvideoImplCopyWith<$Res> {
  factory _$$PlayBgvideoImplCopyWith(
          _$PlayBgvideoImpl value, $Res Function(_$PlayBgvideoImpl) then) =
      __$$PlayBgvideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {VideoController controller, Stream<Map<String, Duration>> streams});
}

/// @nodoc
class __$$PlayBgvideoImplCopyWithImpl<$Res>
    extends _$YoutubePlayerBackgroundStateCopyWithImpl<$Res, _$PlayBgvideoImpl>
    implements _$$PlayBgvideoImplCopyWith<$Res> {
  __$$PlayBgvideoImplCopyWithImpl(
      _$PlayBgvideoImpl _value, $Res Function(_$PlayBgvideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubePlayerBackgroundState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
    Object? streams = null,
  }) {
    return _then(_$PlayBgvideoImpl(
      null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as VideoController,
      null == streams
          ? _value.streams
          : streams // ignore: cast_nullable_to_non_nullable
              as Stream<Map<String, Duration>>,
    ));
  }
}

/// @nodoc

class _$PlayBgvideoImpl with DiagnosticableTreeMixin implements _PlayBgvideo {
  const _$PlayBgvideoImpl(this.controller, this.streams);

  @override
  final VideoController controller;
  @override
  final Stream<Map<String, Duration>> streams;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubePlayerBackgroundState.playBgvideo(controller: $controller, streams: $streams)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'YoutubePlayerBackgroundState.playBgvideo'))
      ..add(DiagnosticsProperty('controller', controller))
      ..add(DiagnosticsProperty('streams', streams));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayBgvideoImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.streams, streams) || other.streams == streams));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, streams);

  /// Create a copy of YoutubePlayerBackgroundState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayBgvideoImplCopyWith<_$PlayBgvideoImpl> get copyWith =>
      __$$PlayBgvideoImplCopyWithImpl<_$PlayBgvideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingBg,
    required TResult Function(
            VideoController controller, Stream<Map<String, Duration>> streams)
        playBgvideo,
  }) {
    return playBgvideo(controller, streams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingBg,
    TResult? Function(
            VideoController controller, Stream<Map<String, Duration>> streams)?
        playBgvideo,
  }) {
    return playBgvideo?.call(controller, streams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingBg,
    TResult Function(
            VideoController controller, Stream<Map<String, Duration>> streams)?
        playBgvideo,
    required TResult orElse(),
  }) {
    if (playBgvideo != null) {
      return playBgvideo(controller, streams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingBg value) loadingBg,
    required TResult Function(_PlayBgvideo value) playBgvideo,
  }) {
    return playBgvideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingBg value)? loadingBg,
    TResult? Function(_PlayBgvideo value)? playBgvideo,
  }) {
    return playBgvideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingBg value)? loadingBg,
    TResult Function(_PlayBgvideo value)? playBgvideo,
    required TResult orElse(),
  }) {
    if (playBgvideo != null) {
      return playBgvideo(this);
    }
    return orElse();
  }
}

abstract class _PlayBgvideo implements YoutubePlayerBackgroundState {
  const factory _PlayBgvideo(final VideoController controller,
      final Stream<Map<String, Duration>> streams) = _$PlayBgvideoImpl;

  VideoController get controller;
  Stream<Map<String, Duration>> get streams;

  /// Create a copy of YoutubePlayerBackgroundState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayBgvideoImplCopyWith<_$PlayBgvideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
