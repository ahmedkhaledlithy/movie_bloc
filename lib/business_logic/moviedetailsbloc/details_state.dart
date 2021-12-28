part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();
}

class DetailsInitial extends DetailsState {
  @override
  List<Object> get props => [];
}


class DetailsLoading extends DetailsState {
  @override
  List<Object> get props => [];
}

class DetailsError extends DetailsState {
  final String errorMessage;

  const DetailsError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class DetailsLoaded extends DetailsState {
  final MovieDetails movieDetails;

  const DetailsLoaded({required this.movieDetails});

  @override
  List<Object> get props => [movieDetails];
}

