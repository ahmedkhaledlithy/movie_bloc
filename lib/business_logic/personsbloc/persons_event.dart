part of 'persons_bloc.dart';

abstract class PersonsEvent extends Equatable {
  const PersonsEvent();
}

class PersonEventStarted extends PersonsEvent {

  @override
  List<Object> get props => [];
}
