import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/genre.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  final MoviesRepositories moviesRepositories;
  GenresBloc({required this.moviesRepositories}) : super(GenresInitial()) {

    on<GenresEvent>((event, emit) async{
      if (event is GenresEventStarted) {
        try {
          emit(GenresLoading());
          final genre = await moviesRepositories.getGenres();
          emit(GenresLoaded(genre: genre));
        }  catch (e) {
          emit(GenresError(error: e.toString()));
        }
      }
    });
  }
}
