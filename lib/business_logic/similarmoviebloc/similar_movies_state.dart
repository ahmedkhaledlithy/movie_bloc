part of 'similar_movies_bloc.dart';

abstract class SimilarMoviesState extends Equatable {
  const SimilarMoviesState();
}

class SimilarMoviesInitial extends SimilarMoviesState {
  @override
  List<Object> get props => [];
}

class SimilarMoviesLoading extends SimilarMoviesState {
  @override
  List<Object> get props => [];
}

class SimilarMoviesError extends SimilarMoviesState {
  final String errorMessage;

  const SimilarMoviesError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final Movie movie;
  const SimilarMoviesLoaded({required this.movie});

  @override
  List<Object> get props => [movie];
}
