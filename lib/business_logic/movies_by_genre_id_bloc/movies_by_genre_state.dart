part of 'movies_by_genre_bloc.dart';

abstract class MoviesByGenreState extends Equatable {
  const MoviesByGenreState();
}

class MoviesByGenreInitial extends MoviesByGenreState {
  @override
  List<Object> get props => [];
}


class MoviesByGenreLoading extends MoviesByGenreState {
  @override
  List<Object> get props => [];
}

class MoviesByGenreError extends MoviesByGenreState {
  final String errorMessage;

  const MoviesByGenreError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class MoviesByGenreLoaded extends MoviesByGenreState {
  final Movie movie;

  const MoviesByGenreLoaded({required this.movie});

  @override
  List<Object> get props => [movie];
}
