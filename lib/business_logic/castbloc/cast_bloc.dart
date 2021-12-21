import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/cast.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final MoviesRepositories moviesRepositories;

  CastBloc({required this.moviesRepositories}) : super(CastInitial()) {
    on<CastEvent>((event, emit) async{
      if (event is CastEventStarted) {
        try {
          emit(CastLoading());
          final cast = await moviesRepositories.getCasts(event.movieId);
          emit(CastLoaded(cast: cast));

        } catch (e) {
          emit(CastError(errorMessage: e.toString()));
        }
      }
    });
  }
}
