part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesEvent extends Equatable {
  const TopRatedMoviesEvent();
}

class TopRatedMoviesEventStarted extends TopRatedMoviesEvent {

  @override
  List<Object> get props => [];
}