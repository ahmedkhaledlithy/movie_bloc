import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MoviesRepositories moviesRepositories;

  MovieBloc({required this.moviesRepositories}) : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      if (event is MovieEventStarted) {
        try {
          emit(MovieLoading());
             final movie = await moviesRepositories.getNowPlayingMovies();
             emit(MovieLoaded(movie: movie));

        } catch (e) {
          emit(MovieError(errorMessage: e.toString()));
        }
      }
    });
  }
}
