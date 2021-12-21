part of 'genres_bloc.dart';

abstract class GenresEvent extends Equatable {
  const GenresEvent();
}

class GenresEventStarted extends GenresEvent {

  @override
  List<Object> get props => [];
}
