part of 'similar_movies_bloc.dart';

abstract class SimilarMoviesEvent extends Equatable {
  const SimilarMoviesEvent();
}
class SimilarMoviesEventStarted extends SimilarMoviesEvent {
  final int movieId;
  const SimilarMoviesEventStarted({required this.movieId});
  @override
  List<Object> get props => [];
}