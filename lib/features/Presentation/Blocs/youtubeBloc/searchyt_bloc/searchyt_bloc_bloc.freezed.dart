// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searchyt_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchytBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) getsearchdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? getsearchdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? getsearchdetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getsearch value) getsearchdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getsearch value)? getsearchdetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getsearch value)? getsearchdetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchytBlocEventCopyWith<$Res> {
  factory $SearchytBlocEventCopyWith(
          SearchytBlocEvent value, $Res Function(SearchytBlocEvent) then) =
      _$SearchytBlocEventCopyWithImpl<$Res, SearchytBlocEvent>;
}

/// @nodoc
class _$SearchytBlocEventCopyWithImpl<$Res, $Val extends SearchytBlocEvent>
    implements $SearchytBlocEventCopyWith<$Res> {
  _$SearchytBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchytBlocEvent
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
    extends _$SearchytBlocEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchytBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SearchytBlocEvent.started()';
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
    required TResult Function(String query) getsearchdetails,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? getsearchdetails,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? getsearchdetails,
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
    required TResult Function(_Getsearch value) getsearchdetails,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getsearch value)? getsearchdetails,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getsearch value)? getsearchdetails,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SearchytBlocEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetsearchImplCopyWith<$Res> {
  factory _$$GetsearchImplCopyWith(
          _$GetsearchImpl value, $Res Function(_$GetsearchImpl) then) =
      __$$GetsearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetsearchImplCopyWithImpl<$Res>
    extends _$SearchytBlocEventCopyWithImpl<$Res, _$GetsearchImpl>
    implements _$$GetsearchImplCopyWith<$Res> {
  __$$GetsearchImplCopyWithImpl(
      _$GetsearchImpl _value, $Res Function(_$GetsearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchytBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetsearchImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetsearchImpl implements _Getsearch {
  const _$GetsearchImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SearchytBlocEvent.getsearchdetails(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetsearchImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SearchytBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetsearchImplCopyWith<_$GetsearchImpl> get copyWith =>
      __$$GetsearchImplCopyWithImpl<_$GetsearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) getsearchdetails,
  }) {
    return getsearchdetails(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? getsearchdetails,
  }) {
    return getsearchdetails?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? getsearchdetails,
    required TResult orElse(),
  }) {
    if (getsearchdetails != null) {
      return getsearchdetails(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Getsearch value) getsearchdetails,
  }) {
    return getsearchdetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Getsearch value)? getsearchdetails,
  }) {
    return getsearchdetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Getsearch value)? getsearchdetails,
    required TResult orElse(),
  }) {
    if (getsearchdetails != null) {
      return getsearchdetails(this);
    }
    return orElse();
  }
}

abstract class _Getsearch implements SearchytBlocEvent {
  const factory _Getsearch(final String query) = _$GetsearchImpl;

  String get query;

  /// Create a copy of SearchytBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetsearchImplCopyWith<_$GetsearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchytBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)
        searchedvideo,
    required TResult Function() loader,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)?
        searchedvideo,
    TResult? Function()? loader,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)?
        searchedvideo,
    TResult Function()? loader,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Searchedvideo value) searchedvideo,
    required TResult Function(_Loading value) loader,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Searchedvideo value)? searchedvideo,
    TResult? Function(_Loading value)? loader,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Searchedvideo value)? searchedvideo,
    TResult Function(_Loading value)? loader,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchytBlocStateCopyWith<$Res> {
  factory $SearchytBlocStateCopyWith(
          SearchytBlocState value, $Res Function(SearchytBlocState) then) =
      _$SearchytBlocStateCopyWithImpl<$Res, SearchytBlocState>;
}

/// @nodoc
class _$SearchytBlocStateCopyWithImpl<$Res, $Val extends SearchytBlocState>
    implements $SearchytBlocStateCopyWith<$Res> {
  _$SearchytBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchytBlocState
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
    extends _$SearchytBlocStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchytBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SearchytBlocState.initial()';
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
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)
        searchedvideo,
    required TResult Function() loader,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)?
        searchedvideo,
    TResult? Function()? loader,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)?
        searchedvideo,
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
    required TResult Function(_Searchedvideo value) searchedvideo,
    required TResult Function(_Loading value) loader,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Searchedvideo value)? searchedvideo,
    TResult? Function(_Loading value)? loader,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Searchedvideo value)? searchedvideo,
    TResult Function(_Loading value)? loader,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchytBlocState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SearchedvideoImplCopyWith<$Res> {
  factory _$$SearchedvideoImplCopyWith(
          _$SearchedvideoImpl value, $Res Function(_$SearchedvideoImpl) then) =
      __$$SearchedvideoImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {VideoSearchList videos,
      List<SongDetailed> songs,
      List<PlaylistDetailed> playlists,
      List<AlbumDetailed> albums,
      bool isloading,
      bool isfailed});
}

/// @nodoc
class __$$SearchedvideoImplCopyWithImpl<$Res>
    extends _$SearchytBlocStateCopyWithImpl<$Res, _$SearchedvideoImpl>
    implements _$$SearchedvideoImplCopyWith<$Res> {
  __$$SearchedvideoImplCopyWithImpl(
      _$SearchedvideoImpl _value, $Res Function(_$SearchedvideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchytBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videos = null,
    Object? songs = null,
    Object? playlists = null,
    Object? albums = null,
    Object? isloading = null,
    Object? isfailed = null,
  }) {
    return _then(_$SearchedvideoImpl(
      null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as VideoSearchList,
      null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongDetailed>,
      null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<PlaylistDetailed>,
      null == albums
          ? _value._albums
          : albums // ignore: cast_nullable_to_non_nullable
              as List<AlbumDetailed>,
      null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isfailed
          ? _value.isfailed
          : isfailed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchedvideoImpl implements _Searchedvideo {
  const _$SearchedvideoImpl(
      this.videos,
      final List<SongDetailed> songs,
      final List<PlaylistDetailed> playlists,
      final List<AlbumDetailed> albums,
      this.isloading,
      this.isfailed)
      : _songs = songs,
        _playlists = playlists,
        _albums = albums;

  @override
  final VideoSearchList videos;
  final List<SongDetailed> _songs;
  @override
  List<SongDetailed> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  final List<PlaylistDetailed> _playlists;
  @override
  List<PlaylistDetailed> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  final List<AlbumDetailed> _albums;
  @override
  List<AlbumDetailed> get albums {
    if (_albums is EqualUnmodifiableListView) return _albums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_albums);
  }

  @override
  final bool isloading;
  @override
  final bool isfailed;

  @override
  String toString() {
    return 'SearchytBlocState.searchedvideo(videos: $videos, songs: $songs, playlists: $playlists, albums: $albums, isloading: $isloading, isfailed: $isfailed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchedvideoImpl &&
            const DeepCollectionEquality().equals(other.videos, videos) &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            const DeepCollectionEquality().equals(other._albums, _albums) &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            (identical(other.isfailed, isfailed) ||
                other.isfailed == isfailed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(videos),
      const DeepCollectionEquality().hash(_songs),
      const DeepCollectionEquality().hash(_playlists),
      const DeepCollectionEquality().hash(_albums),
      isloading,
      isfailed);

  /// Create a copy of SearchytBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchedvideoImplCopyWith<_$SearchedvideoImpl> get copyWith =>
      __$$SearchedvideoImplCopyWithImpl<_$SearchedvideoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)
        searchedvideo,
    required TResult Function() loader,
  }) {
    return searchedvideo(videos, songs, playlists, albums, isloading, isfailed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)?
        searchedvideo,
    TResult? Function()? loader,
  }) {
    return searchedvideo?.call(
        videos, songs, playlists, albums, isloading, isfailed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)?
        searchedvideo,
    TResult Function()? loader,
    required TResult orElse(),
  }) {
    if (searchedvideo != null) {
      return searchedvideo(
          videos, songs, playlists, albums, isloading, isfailed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Searchedvideo value) searchedvideo,
    required TResult Function(_Loading value) loader,
  }) {
    return searchedvideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Searchedvideo value)? searchedvideo,
    TResult? Function(_Loading value)? loader,
  }) {
    return searchedvideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Searchedvideo value)? searchedvideo,
    TResult Function(_Loading value)? loader,
    required TResult orElse(),
  }) {
    if (searchedvideo != null) {
      return searchedvideo(this);
    }
    return orElse();
  }
}

abstract class _Searchedvideo implements SearchytBlocState {
  const factory _Searchedvideo(
      final VideoSearchList videos,
      final List<SongDetailed> songs,
      final List<PlaylistDetailed> playlists,
      final List<AlbumDetailed> albums,
      final bool isloading,
      final bool isfailed) = _$SearchedvideoImpl;

  VideoSearchList get videos;
  List<SongDetailed> get songs;
  List<PlaylistDetailed> get playlists;
  List<AlbumDetailed> get albums;
  bool get isloading;
  bool get isfailed;

  /// Create a copy of SearchytBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchedvideoImplCopyWith<_$SearchedvideoImpl> get copyWith =>
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
    extends _$SearchytBlocStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchytBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SearchytBlocState.loader()';
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
    required TResult Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)
        searchedvideo,
    required TResult Function() loader,
  }) {
    return loader();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)?
        searchedvideo,
    TResult? Function()? loader,
  }) {
    return loader?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            VideoSearchList videos,
            List<SongDetailed> songs,
            List<PlaylistDetailed> playlists,
            List<AlbumDetailed> albums,
            bool isloading,
            bool isfailed)?
        searchedvideo,
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
    required TResult Function(_Searchedvideo value) searchedvideo,
    required TResult Function(_Loading value) loader,
  }) {
    return loader(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Searchedvideo value)? searchedvideo,
    TResult? Function(_Loading value)? loader,
  }) {
    return loader?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Searchedvideo value)? searchedvideo,
    TResult Function(_Loading value)? loader,
    required TResult orElse(),
  }) {
    if (loader != null) {
      return loader(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SearchytBlocState {
  const factory _Loading() = _$LoadingImpl;
}
