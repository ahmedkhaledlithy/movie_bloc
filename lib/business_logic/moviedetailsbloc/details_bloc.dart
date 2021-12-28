import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie_details.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {

  final MoviesRepositories repositories;


  DetailsBloc({required this.repositories}) : super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) async{
      if (event is DetailsEventStarted) {
        try {
          emit(DetailsLoading());
          MovieDetails details = await repositories.getMoviesDetails(event.movieId);
          emit(DetailsLoaded(movieDetails: details));

        }catch (e) {
          emit(DetailsError(errorMessage: e.toString()));
        }
      }
    });
  }
}
