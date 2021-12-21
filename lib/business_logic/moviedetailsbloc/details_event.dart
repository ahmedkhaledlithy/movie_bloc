part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class DetailsEventStarted extends DetailsEvent {

 final int movieId;
 const DetailsEventStarted({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
