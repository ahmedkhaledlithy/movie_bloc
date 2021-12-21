part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();
}

class CastEventStarted extends CastEvent {
 final int movieId;

 const CastEventStarted({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
