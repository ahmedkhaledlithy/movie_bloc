part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();
}

class CastInitial extends CastState {
  @override
  List<Object> get props => [];
}

class CastLoading extends CastState {
  @override
  List<Object> get props => [];
}

class CastError extends CastState {
  final String errorMessage;

  const CastError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class CastLoaded extends CastState {
  final CastModel cast;

  const CastLoaded({required this.cast});

  @override
  List<Object> get props => [cast];
}

