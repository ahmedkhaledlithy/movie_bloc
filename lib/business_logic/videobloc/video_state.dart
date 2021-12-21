part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();
}

class VideoInitial extends VideoState {
  @override
  List<Object> get props => [];
}

class VideoLoading extends VideoState {
  @override
  List<Object> get props => [];
}

class VideoError extends VideoState {
  final String errorMessage;

  const VideoError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class VideoLoaded extends VideoState {
  final Video video;

  const VideoLoaded({required this.video});

  @override
  List<Object> get props => [video];
}

