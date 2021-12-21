part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();
}

class SearchMovieEventStarted extends SearchMoviesEvent {

 final String movieName;
 const SearchMovieEventStarted({required this.movieName});

  @override
  List<Object> get props => [movieName];
}
