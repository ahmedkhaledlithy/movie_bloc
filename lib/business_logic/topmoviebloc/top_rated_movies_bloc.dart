import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {

  final MoviesRepositories moviesRepositories;

  TopRatedMoviesBloc({required this.moviesRepositories}) : super(TopRatedMoviesInitial()) {
    on<TopRatedMoviesEvent>((event, emit) async{
      if (event is TopRatedMoviesEventStarted) {
        try {
          emit(TopRatedMoviesLoading());
          final movie = await moviesRepositories.getTopRatedMovies();
          emit(TopRatedMoviesLoaded(movie: movie));

        } catch (e) {
          emit(TopRatedMoviesError(errorMessage: e.toString()));
        }
      }
    });
  }
}
