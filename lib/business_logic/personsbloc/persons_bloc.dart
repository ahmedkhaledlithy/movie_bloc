import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/trending_persons.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'persons_event.dart';
part 'persons_state.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  final MoviesRepositories moviesRepositories;

  PersonsBloc({required this.moviesRepositories}) : super(PersonsInitial()) {
    on<PersonsEvent>((event, emit) async{
      if (event is PersonEventStarted) {
        try {
          emit(PersonsLoading());
          final persons = await moviesRepositories.getTrendingPersons();
          emit(PersonsLoaded(persons: persons));

        } catch (e) {
          emit(PersonsError(errorMessage: e.toString()));
        }
      }
    });
  }
}
