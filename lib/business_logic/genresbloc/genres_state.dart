part of 'genres_bloc.dart';

abstract class GenresState extends Equatable {
  const GenresState();
}

class GenresInitial extends GenresState {
  @override
  List<Object> get props => [];
}

class GenresLoading extends GenresState {
  @override
  List<Object> get props => [];
}

class GenresError extends GenresState {
  final String error;
  const GenresError({required this.error});
  @override
  List<Object> get props => [error];
}

class GenresLoaded extends GenresState {
  final Genre genre;
  const GenresLoaded({required this.genre});

  @override
  List<Object> get props => [genre];
}
