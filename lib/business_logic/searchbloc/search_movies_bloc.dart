import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final MoviesRepositories moviesRepositories;

  SearchMoviesBloc({required this.moviesRepositories}) : super(SearchMoviesInitial()) {
    on<SearchMoviesEvent>((event, emit) async{
      if (event is SearchMovieEventStarted) {
        try {
          emit(SearchMoviesLoading());
          final movie = await moviesRepositories.searchByMovieName(event.movieName);
          emit(SearchMoviesLoaded(movie: movie));

        } catch (e) {
          emit(SearchMoviesError(errorMessage: e.toString()));
        }
      }
    });
  }
}
