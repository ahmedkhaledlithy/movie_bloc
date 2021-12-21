part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();
}

class SearchMoviesInitial extends SearchMoviesState {
  @override
  List<Object> get props => [];
}

class SearchMoviesLoading extends SearchMoviesState {
  @override
  List<Object> get props => [];
}

class SearchMoviesError extends SearchMoviesState {
 final String errorMessage;
  const SearchMoviesError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SearchMoviesLoaded extends SearchMoviesState {
 final Movie movie;

 const SearchMoviesLoaded({required this.movie});

  @override
  List<Object> get props => [movie];
}
