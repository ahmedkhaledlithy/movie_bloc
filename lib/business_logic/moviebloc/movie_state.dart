part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieError extends MovieState {
  final String errorMessage;

const MovieError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class MovieLoaded extends MovieState {
 final Movie movie;

 const MovieLoaded({required this.movie});

  @override
  List<Object> get props => [movie];
}
