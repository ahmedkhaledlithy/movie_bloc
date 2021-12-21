part of 'movies_by_genre_bloc.dart';

abstract class MoviesByGenreEvent extends Equatable {
  const MoviesByGenreEvent();
}

class MoviesByGenreEventStarted extends MoviesByGenreEvent {
  final int genreId;

  const MoviesByGenreEventStarted({required this.genreId});

  @override
  List<Object> get props => [genreId];
}
