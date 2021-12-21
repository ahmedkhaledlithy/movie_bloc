part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();
}

class TopRatedMoviesInitial extends TopRatedMoviesState {
  @override
  List<Object> get props => [];
}

class TopRatedMoviesLoading extends TopRatedMoviesState {
  @override
  List<Object> get props => [];
}

class TopRatedMoviesError extends TopRatedMoviesState {
  final String errorMessage;

  const TopRatedMoviesError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class TopRatedMoviesLoaded extends TopRatedMoviesState {

  final Movie movie;
  const TopRatedMoviesLoaded({required this.movie});

  @override
  List<Object> get props => [movie];
}
