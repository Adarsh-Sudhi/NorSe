part of 'songlike_bloc.dart';

@freezed
class SonglikeState with _$SonglikeState {
  const factory SonglikeState.initial() = _Initial;
  const factory SonglikeState.ispresent(
    bool ispresent,
  ) = _Ispresent;
  const factory SonglikeState.added() = _Added;
  const factory SonglikeState.removed() = _Removed;
}
