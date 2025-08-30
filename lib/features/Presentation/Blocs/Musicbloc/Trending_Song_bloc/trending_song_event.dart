// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trending_song_bloc.dart';

sealed class TrendingSongEvent extends Equatable {
  const TrendingSongEvent();

  @override
  List<Object> get props => [];
}

class TrendingSongs extends TrendingSongEvent {
  final String mode;

  const TrendingSongs({required this.mode});
}
