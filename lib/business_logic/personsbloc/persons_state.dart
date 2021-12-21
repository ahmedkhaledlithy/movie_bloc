part of 'persons_bloc.dart';

abstract class PersonsState extends Equatable {
  const PersonsState();
}

class PersonsInitial extends PersonsState {
  @override
  List<Object> get props => [];
}

class PersonsLoading extends PersonsState {
  @override
  List<Object> get props => [];
}

class PersonsError extends PersonsState {
  final String errorMessage;

  const PersonsError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PersonsLoaded extends PersonsState {
  final TrendingPersons persons;

  const PersonsLoaded({required this.persons});

  @override
  List<Object> get props => [persons];
}

