part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();
}

class VideoEventStarted extends VideoEvent {

 final int movieId;
 const VideoEventStarted({required this.movieId});

  @override
  List<Object> get props => [movieId];
}