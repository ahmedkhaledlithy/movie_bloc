import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'movies_by_genre_event.dart';
part 'movies_by_genre_state.dart';

class MoviesByGenreBloc extends Bloc<MoviesByGenreEvent, MoviesByGenreState> {
  final MoviesRepositories moviesRepositories;

  MoviesByGenreBloc({required this.moviesRepositories}) : super(MoviesByGenreInitial()) {
    on<MoviesByGenreEvent>((event, emit) async {
      if (event is MoviesByGenreEventStarted) {
        try {
          emit(MoviesByGenreLoading());

            final movie = await moviesRepositories.getMoviesByGenre(event.genreId);
            emit(MoviesByGenreLoaded(movie: movie));


        }catch (e) {
          emit(MoviesByGenreError(errorMessage: e.toString()));
        }
      }
    });
  }
}
