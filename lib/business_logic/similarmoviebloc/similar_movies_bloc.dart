import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'similar_movies_event.dart';
part 'similar_movies_state.dart';

class SimilarMoviesBloc extends Bloc<SimilarMoviesEvent, SimilarMoviesState> {
  final MoviesRepositories moviesRepositories;

  SimilarMoviesBloc({required this.moviesRepositories}) : super(SimilarMoviesInitial()) {
    on<SimilarMoviesEvent>((event, emit) async{
      if (event is SimilarMoviesEventStarted) {
        try {
          emit(SimilarMoviesLoading());
          final Movie movie = await moviesRepositories.getSimilarMovie(
              event.movieId);
          emit(SimilarMoviesLoaded(movie: movie));
        } catch (e) {
          emit(SimilarMoviesError(errorMessage: e.toString()));
        }
      }
    });
  }
}
