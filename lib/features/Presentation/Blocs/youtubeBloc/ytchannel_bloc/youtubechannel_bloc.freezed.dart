// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtubechannel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$YoutubechannelEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(dynamic channelid) getuploadsevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(dynamic channelid)? getuploadsevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(dynamic channelid)? getuploadsevent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getuploads value) getuploadsevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getuploads value)? getuploadsevent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getuploads value)? getuploadsevent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubechannelEventCopyWith<$Res> {
  factory $YoutubechannelEventCopyWith(
          YoutubechannelEvent value, $Res Function(YoutubechannelEvent) then) =
      _$YoutubechannelEventCopyWithImpl<$Res, YoutubechannelEvent>;
}

/// @nodoc
class _$YoutubechannelEventCopyWithImpl<$Res, $Val extends YoutubechannelEvent>
    implements $YoutubechannelEventCopyWith<$Res> {
  _$YoutubechannelEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubechannelEvent
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
    extends _$YoutubechannelEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubechannelEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'YoutubechannelEvent.started()';
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
    required TResult Function(dynamic channelid) getuploadsevent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(dynamic channelid)? getuploadsevent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(dynamic channelid)? getuploadsevent,
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
    required TResult Function(_Getuploads value) getuploadsevent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getuploads value)? getuploadsevent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getuploads value)? getuploadsevent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements YoutubechannelEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetuploadsImplCopyWith<$Res> {
  factory _$$GetuploadsImplCopyWith(
          _$GetuploadsImpl value, $Res Function(_$GetuploadsImpl) then) =
      __$$GetuploadsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic channelid});
}

/// @nodoc
class __$$GetuploadsImplCopyWithImpl<$Res>
    extends _$YoutubechannelEventCopyWithImpl<$Res, _$GetuploadsImpl>
    implements _$$GetuploadsImplCopyWith<$Res> {
  __$$GetuploadsImplCopyWithImpl(
      _$GetuploadsImpl _value, $Res Function(_$GetuploadsImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubechannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelid = freezed,
  }) {
    return _then(_$GetuploadsImpl(
      freezed == channelid
          ? _value.channelid
          : channelid // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$GetuploadsImpl implements _Getuploads {
  const _$GetuploadsImpl(this.channelid);

  @override
  final dynamic channelid;

  @override
  String toString() {
    return 'YoutubechannelEvent.getuploadsevent(channelid: $channelid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetuploadsImpl &&
            const DeepCollectionEquality().equals(other.channelid, channelid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(channelid));

  /// Create a copy of YoutubechannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetuploadsImplCopyWith<_$GetuploadsImpl> get copyWith =>
      __$$GetuploadsImplCopyWithImpl<_$GetuploadsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(dynamic channelid) getuploadsevent,
  }) {
    return getuploadsevent(channelid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(dynamic channelid)? getuploadsevent,
  }) {
    return getuploadsevent?.call(channelid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(dynamic channelid)? getuploadsevent,
    required TResult orElse(),
  }) {
    if (getuploadsevent != null) {
      return getuploadsevent(channelid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getuploads value) getuploadsevent,
  }) {
    return getuploadsevent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getuploads value)? getuploadsevent,
  }) {
    return getuploadsevent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getuploads value)? getuploadsevent,
    required TResult orElse(),
  }) {
    if (getuploadsevent != null) {
      return getuploadsevent(this);
    }
    return orElse();
  }
}

abstract class _Getuploads implements YoutubechannelEvent {
  const factory _Getuploads(final dynamic channelid) = _$GetuploadsImpl;

  dynamic get channelid;

  /// Create a copy of YoutubechannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetuploadsImplCopyWith<_$GetuploadsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$YoutubechannelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChannelUploadsList list, bool isloading) uploads,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChannelUploadsList list, bool isloading)? uploads,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChannelUploadsList list, bool isloading)? uploads,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Uploads value) uploads,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Uploads value)? uploads,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Uploads value)? uploads,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubechannelStateCopyWith<$Res> {
  factory $YoutubechannelStateCopyWith(
          YoutubechannelState value, $Res Function(YoutubechannelState) then) =
      _$YoutubechannelStateCopyWithImpl<$Res, YoutubechannelState>;
}

/// @nodoc
class _$YoutubechannelStateCopyWithImpl<$Res, $Val extends YoutubechannelState>
    implements $YoutubechannelStateCopyWith<$Res> {
  _$YoutubechannelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubechannelState
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
    extends _$YoutubechannelStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubechannelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'YoutubechannelState.initial()';
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
    required TResult Function(ChannelUploadsList list, bool isloading) uploads,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChannelUploadsList list, bool isloading)? uploads,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChannelUploadsList list, bool isloading)? uploads,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Uploads value) uploads,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Uploads value)? uploads,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Uploads value)? uploads,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements YoutubechannelState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$YoutubechannelStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubechannelState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'YoutubechannelState.loading()';
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
    required TResult Function() loading,
    required TResult Function(ChannelUploadsList list, bool isloading) uploads,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChannelUploadsList list, bool isloading)? uploads,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChannelUploadsList list, bool isloading)? uploads,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Uploads value) uploads,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Uploads value)? uploads,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Uploads value)? uploads,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements YoutubechannelState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$UploadsImplCopyWith<$Res> {
  factory _$$UploadsImplCopyWith(
          _$UploadsImpl value, $Res Function(_$UploadsImpl) then) =
      __$$UploadsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChannelUploadsList list, bool isloading});
}

/// @nodoc
class __$$UploadsImplCopyWithImpl<$Res>
    extends _$YoutubechannelStateCopyWithImpl<$Res, _$UploadsImpl>
    implements _$$UploadsImplCopyWith<$Res> {
  __$$UploadsImplCopyWithImpl(
      _$UploadsImpl _value, $Res Function(_$UploadsImpl) _then)
      : super(_value, _then);

  /// Create a copy of YoutubechannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? isloading = null,
  }) {
    return _then(_$UploadsImpl(
      null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ChannelUploadsList,
      null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UploadsImpl implements _Uploads {
  const _$UploadsImpl(this.list, this.isloading);

  @override
  final ChannelUploadsList list;
  @override
  final bool isloading;

  @override
  String toString() {
    return 'YoutubechannelState.uploads(list: $list, isloading: $isloading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadsImpl &&
            const DeepCollectionEquality().equals(other.list, list) &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(list), isloading);

  /// Create a copy of YoutubechannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadsImplCopyWith<_$UploadsImpl> get copyWith =>
      __$$UploadsImplCopyWithImpl<_$UploadsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ChannelUploadsList list, bool isloading) uploads,
  }) {
    return uploads(list, isloading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ChannelUploadsList list, bool isloading)? uploads,
  }) {
    return uploads?.call(list, isloading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ChannelUploadsList list, bool isloading)? uploads,
    required TResult orElse(),
  }) {
    if (uploads != null) {
      return uploads(list, isloading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Uploads value) uploads,
  }) {
    return uploads(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Uploads value)? uploads,
  }) {
    return uploads?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Uploads value)? uploads,
    required TResult orElse(),
  }) {
    if (uploads != null) {
      return uploads(this);
    }
    return orElse();
  }
}

abstract class _Uploads implements YoutubechannelState {
  const factory _Uploads(final ChannelUploadsList list, final bool isloading) =
      _$UploadsImpl;

  ChannelUploadsList get list;
  bool get isloading;

  /// Create a copy of YoutubechannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadsImplCopyWith<_$UploadsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
