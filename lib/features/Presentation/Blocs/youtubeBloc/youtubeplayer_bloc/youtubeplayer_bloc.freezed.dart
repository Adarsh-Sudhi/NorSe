// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtubeplayer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$YoutubeplayerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Video> videos, int index) ytplayerevent,
    required TResult Function() switchevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Video> videos, int index)? ytplayerevent,
    TResult? Function()? switchevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Video> videos, int index)? ytplayerevent,
    TResult Function()? switchevent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_YtPlayerEvent value) ytplayerevent,
    required TResult Function(_SwitchEvent value) switchevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_YtPlayerEvent value)? ytplayerevent,
    TResult? Function(_SwitchEvent value)? switchevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_YtPlayerEvent value)? ytplayerevent,
    TResult Function(_SwitchEvent value)? switchevent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeplayerEventCopyWith<$Res> {
  factory $YoutubeplayerEventCopyWith(
          YoutubeplayerEvent value, $Res Function(YoutubeplayerEvent) then) =
      _$YoutubeplayerEventCopyWithImpl<$Res, YoutubeplayerEvent>;
}

/// @nodoc
class _$YoutubeplayerEventCopyWithImpl<$Res, $Val extends YoutubeplayerEvent>
    implements $YoutubeplayerEventCopyWith<$Res> {
  _$YoutubeplayerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubeplayerEvent
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
    extends _$YoutubeplayerEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeplayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl with DiagnosticableTreeMixin implements _Started {
  const _$StartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubeplayerEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'YoutubeplayerEvent.started'));
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
    required TResult Function(List<Video> videos, int index) ytplayerevent,
    required TResult Function() switchevent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Video> videos, int index)? ytplayerevent,
    TResult? Function()? switchevent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Video> videos, int index)? ytplayerevent,
    TResult Function()? switchevent,
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
    required TResult Function(_YtPlayerEvent value) ytplayerevent,
    required TResult Function(_SwitchEvent value) switchevent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_YtPlayerEvent value)? ytplayerevent,
    TResult? Function(_SwitchEvent value)? switchevent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_YtPlayerEvent value)? ytplayerevent,
    TResult Function(_SwitchEvent value)? switchevent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements YoutubeplayerEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$YtPlayerEventImplCopyWith<$Res> {
  factory _$$YtPlayerEventImplCopyWith(
          _$YtPlayerEventImpl value, $Res Function(_$YtPlayerEventImpl) then) =
      __$$YtPlayerEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Video> videos, int index});
}

/// @nodoc
class __$$YtPlayerEventImplCopyWithImpl<$Res>
    extends _$YoutubeplayerEventCopyWithImpl<$Res, _$YtPlayerEventImpl>
    implements _$$YtPlayerEventImplCopyWith<$Res> {
  __$$YtPlayerEventImplCopyWithImpl(
      _$YtPlayerEventImpl _value, $Res Function(_$YtPlayerEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeplayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videos = null,
    Object? index = null,
  }) {
    return _then(_$YtPlayerEventImpl(
      null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$YtPlayerEventImpl
    with DiagnosticableTreeMixin
    implements _YtPlayerEvent {
  const _$YtPlayerEventImpl(final List<Video> videos, this.index)
      : _videos = videos;

  final List<Video> _videos;
  @override
  List<Video> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubeplayerEvent.ytplayerevent(videos: $videos, index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'YoutubeplayerEvent.ytplayerevent'))
      ..add(DiagnosticsProperty('videos', videos))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YtPlayerEventImpl &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_videos), index);

  /// Create a copy of YoutubeplayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YtPlayerEventImplCopyWith<_$YtPlayerEventImpl> get copyWith =>
      __$$YtPlayerEventImplCopyWithImpl<_$YtPlayerEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Video> videos, int index) ytplayerevent,
    required TResult Function() switchevent,
  }) {
    return ytplayerevent(videos, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Video> videos, int index)? ytplayerevent,
    TResult? Function()? switchevent,
  }) {
    return ytplayerevent?.call(videos, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Video> videos, int index)? ytplayerevent,
    TResult Function()? switchevent,
    required TResult orElse(),
  }) {
    if (ytplayerevent != null) {
      return ytplayerevent(videos, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_YtPlayerEvent value) ytplayerevent,
    required TResult Function(_SwitchEvent value) switchevent,
  }) {
    return ytplayerevent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_YtPlayerEvent value)? ytplayerevent,
    TResult? Function(_SwitchEvent value)? switchevent,
  }) {
    return ytplayerevent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_YtPlayerEvent value)? ytplayerevent,
    TResult Function(_SwitchEvent value)? switchevent,
    required TResult orElse(),
  }) {
    if (ytplayerevent != null) {
      return ytplayerevent(this);
    }
    return orElse();
  }
}

abstract class _YtPlayerEvent implements YoutubeplayerEvent {
  const factory _YtPlayerEvent(final List<Video> videos, final int index) =
      _$YtPlayerEventImpl;

  List<Video> get videos;
  int get index;

  /// Create a copy of YoutubeplayerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YtPlayerEventImplCopyWith<_$YtPlayerEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwitchEventImplCopyWith<$Res> {
  factory _$$SwitchEventImplCopyWith(
          _$SwitchEventImpl value, $Res Function(_$SwitchEventImpl) then) =
      __$$SwitchEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchEventImplCopyWithImpl<$Res>
    extends _$YoutubeplayerEventCopyWithImpl<$Res, _$SwitchEventImpl>
    implements _$$SwitchEventImplCopyWith<$Res> {
  __$$SwitchEventImplCopyWithImpl(
      _$SwitchEventImpl _value, $Res Function(_$SwitchEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeplayerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SwitchEventImpl with DiagnosticableTreeMixin implements _SwitchEvent {
  const _$SwitchEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubeplayerEvent.switchevent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'YoutubeplayerEvent.switchevent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Video> videos, int index) ytplayerevent,
    required TResult Function() switchevent,
  }) {
    return switchevent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Video> videos, int index)? ytplayerevent,
    TResult? Function()? switchevent,
  }) {
    return switchevent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Video> videos, int index)? ytplayerevent,
    TResult Function()? switchevent,
    required TResult orElse(),
  }) {
    if (switchevent != null) {
      return switchevent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_YtPlayerEvent value) ytplayerevent,
    required TResult Function(_SwitchEvent value) switchevent,
  }) {
    return switchevent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_YtPlayerEvent value)? ytplayerevent,
    TResult? Function(_SwitchEvent value)? switchevent,
  }) {
    return switchevent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_YtPlayerEvent value)? ytplayerevent,
    TResult Function(_SwitchEvent value)? switchevent,
    required TResult orElse(),
  }) {
    if (switchevent != null) {
      return switchevent(this);
    }
    return orElse();
  }
}

abstract class _SwitchEvent implements YoutubeplayerEvent {
  const factory _SwitchEvent() = _$SwitchEventImpl;
}

/// @nodoc
mixin _$YoutubeplayerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)
        youtubeplayerstate,
    required TResult Function() loading,
    required TResult Function() switchstate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult? Function()? loading,
    TResult? Function()? switchstate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult Function()? loading,
    TResult Function()? switchstate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_YoutubePlayerState value) youtubeplayerstate,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SwitchState value) switchstate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SwitchState value)? switchstate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SwitchState value)? switchstate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeplayerStateCopyWith<$Res> {
  factory $YoutubeplayerStateCopyWith(
          YoutubeplayerState value, $Res Function(YoutubeplayerState) then) =
      _$YoutubeplayerStateCopyWithImpl<$Res, YoutubeplayerState>;
}

/// @nodoc
class _$YoutubeplayerStateCopyWithImpl<$Res, $Val extends YoutubeplayerState>
    implements $YoutubeplayerStateCopyWith<$Res> {
  _$YoutubeplayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubeplayerState
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
    extends _$YoutubeplayerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeplayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubeplayerState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'YoutubeplayerState.initial'));
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
    required TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)
        youtubeplayerstate,
    required TResult Function() loading,
    required TResult Function() switchstate,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult? Function()? loading,
    TResult? Function()? switchstate,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult Function()? loading,
    TResult Function()? switchstate,
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
    required TResult Function(_YoutubePlayerState value) youtubeplayerstate,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SwitchState value) switchstate,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SwitchState value)? switchstate,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SwitchState value)? switchstate,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements YoutubeplayerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$YoutubePlayerStateImplCopyWith<$Res> {
  factory _$$YoutubePlayerStateImplCopyWith(_$YoutubePlayerStateImpl value,
          $Res Function(_$YoutubePlayerStateImpl) then) =
      __$$YoutubePlayerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Map<String, dynamic> info,
      int index,
      List<Video> videos,
      bool isloading,
      bool isfailed,
      vid.VideoController controller,
      Stream<Map<String, Duration>> streams});
}

/// @nodoc
class __$$YoutubePlayerStateImplCopyWithImpl<$Res>
    extends _$YoutubeplayerStateCopyWithImpl<$Res, _$YoutubePlayerStateImpl>
    implements _$$YoutubePlayerStateImplCopyWith<$Res> {
  __$$YoutubePlayerStateImplCopyWithImpl(_$YoutubePlayerStateImpl _value,
      $Res Function(_$YoutubePlayerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeplayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? index = null,
    Object? videos = null,
    Object? isloading = null,
    Object? isfailed = null,
    Object? controller = null,
    Object? streams = null,
  }) {
    return _then(_$YoutubePlayerStateImpl(
      null == info
          ? _value._info
          : info // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isfailed
          ? _value.isfailed
          : isfailed // ignore: cast_nullable_to_non_nullable
              as bool,
      null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as vid.VideoController,
      null == streams
          ? _value.streams
          : streams // ignore: cast_nullable_to_non_nullable
              as Stream<Map<String, Duration>>,
    ));
  }
}

/// @nodoc

class _$YoutubePlayerStateImpl
    with DiagnosticableTreeMixin
    implements _YoutubePlayerState {
  const _$YoutubePlayerStateImpl(
      final Map<String, dynamic> info,
      this.index,
      final List<Video> videos,
      this.isloading,
      this.isfailed,
      this.controller,
      this.streams)
      : _info = info,
        _videos = videos;

  final Map<String, dynamic> _info;
  @override
  Map<String, dynamic> get info {
    if (_info is EqualUnmodifiableMapView) return _info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_info);
  }

  @override
  final int index;
  final List<Video> _videos;
  @override
  List<Video> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  @override
  final bool isloading;
  @override
  final bool isfailed;
  @override
  final vid.VideoController controller;
  @override
  final Stream<Map<String, Duration>> streams;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubeplayerState.youtubeplayerstate(info: $info, index: $index, videos: $videos, isloading: $isloading, isfailed: $isfailed, controller: $controller, streams: $streams)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'YoutubeplayerState.youtubeplayerstate'))
      ..add(DiagnosticsProperty('info', info))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('videos', videos))
      ..add(DiagnosticsProperty('isloading', isloading))
      ..add(DiagnosticsProperty('isfailed', isfailed))
      ..add(DiagnosticsProperty('controller', controller))
      ..add(DiagnosticsProperty('streams', streams));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubePlayerStateImpl &&
            const DeepCollectionEquality().equals(other._info, _info) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            (identical(other.isfailed, isfailed) ||
                other.isfailed == isfailed) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.streams, streams) || other.streams == streams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_info),
      index,
      const DeepCollectionEquality().hash(_videos),
      isloading,
      isfailed,
      controller,
      streams);

  /// Create a copy of YoutubeplayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubePlayerStateImplCopyWith<_$YoutubePlayerStateImpl> get copyWith =>
      __$$YoutubePlayerStateImplCopyWithImpl<_$YoutubePlayerStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)
        youtubeplayerstate,
    required TResult Function() loading,
    required TResult Function() switchstate,
  }) {
    return youtubeplayerstate(
        info, index, videos, isloading, isfailed, controller, streams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult? Function()? loading,
    TResult? Function()? switchstate,
  }) {
    return youtubeplayerstate?.call(
        info, index, videos, isloading, isfailed, controller, streams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult Function()? loading,
    TResult Function()? switchstate,
    required TResult orElse(),
  }) {
    if (youtubeplayerstate != null) {
      return youtubeplayerstate(
          info, index, videos, isloading, isfailed, controller, streams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_YoutubePlayerState value) youtubeplayerstate,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SwitchState value) switchstate,
  }) {
    return youtubeplayerstate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SwitchState value)? switchstate,
  }) {
    return youtubeplayerstate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SwitchState value)? switchstate,
    required TResult orElse(),
  }) {
    if (youtubeplayerstate != null) {
      return youtubeplayerstate(this);
    }
    return orElse();
  }
}

abstract class _YoutubePlayerState implements YoutubeplayerState {
  const factory _YoutubePlayerState(
      final Map<String, dynamic> info,
      final int index,
      final List<Video> videos,
      final bool isloading,
      final bool isfailed,
      final vid.VideoController controller,
      final Stream<Map<String, Duration>> streams) = _$YoutubePlayerStateImpl;

  Map<String, dynamic> get info;
  int get index;
  List<Video> get videos;
  bool get isloading;
  bool get isfailed;
  vid.VideoController get controller;
  Stream<Map<String, Duration>> get streams;

  /// Create a copy of YoutubeplayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YoutubePlayerStateImplCopyWith<_$YoutubePlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$YoutubeplayerStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeplayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStateImpl with DiagnosticableTreeMixin implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubeplayerState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'YoutubeplayerState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)
        youtubeplayerstate,
    required TResult Function() loading,
    required TResult Function() switchstate,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult? Function()? loading,
    TResult? Function()? switchstate,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult Function()? loading,
    TResult Function()? switchstate,
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
    required TResult Function(_YoutubePlayerState value) youtubeplayerstate,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SwitchState value) switchstate,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SwitchState value)? switchstate,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SwitchState value)? switchstate,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements YoutubeplayerState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$SwitchStateImplCopyWith<$Res> {
  factory _$$SwitchStateImplCopyWith(
          _$SwitchStateImpl value, $Res Function(_$SwitchStateImpl) then) =
      __$$SwitchStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchStateImplCopyWithImpl<$Res>
    extends _$YoutubeplayerStateCopyWithImpl<$Res, _$SwitchStateImpl>
    implements _$$SwitchStateImplCopyWith<$Res> {
  __$$SwitchStateImplCopyWithImpl(
      _$SwitchStateImpl _value, $Res Function(_$SwitchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubeplayerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SwitchStateImpl with DiagnosticableTreeMixin implements _SwitchState {
  const _$SwitchStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YoutubeplayerState.switchstate()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'YoutubeplayerState.switchstate'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)
        youtubeplayerstate,
    required TResult Function() loading,
    required TResult Function() switchstate,
  }) {
    return switchstate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult? Function()? loading,
    TResult? Function()? switchstate,
  }) {
    return switchstate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            Map<String, dynamic> info,
            int index,
            List<Video> videos,
            bool isloading,
            bool isfailed,
            vid.VideoController controller,
            Stream<Map<String, Duration>> streams)?
        youtubeplayerstate,
    TResult Function()? loading,
    TResult Function()? switchstate,
    required TResult orElse(),
  }) {
    if (switchstate != null) {
      return switchstate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_YoutubePlayerState value) youtubeplayerstate,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_SwitchState value) switchstate,
  }) {
    return switchstate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_SwitchState value)? switchstate,
  }) {
    return switchstate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_YoutubePlayerState value)? youtubeplayerstate,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_SwitchState value)? switchstate,
    required TResult orElse(),
  }) {
    if (switchstate != null) {
      return switchstate(this);
    }
    return orElse();
  }
}

abstract class _SwitchState implements YoutubeplayerState {
  const factory _SwitchState() = _$SwitchStateImpl;
}
