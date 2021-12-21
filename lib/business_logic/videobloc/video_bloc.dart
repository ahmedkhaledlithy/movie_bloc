import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/video.dart';
import 'package:movie_app/repositories/movies_repository.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {

  final MoviesRepositories repositories;


  VideoBloc({required this.repositories}) : super(VideoInitial()) {
    on<VideoEvent>((event, emit) async{
      if (event is VideoEventStarted) {
        try {
          emit(VideoLoading());
          final Video video = await repositories.getMoviesVideo(event.movieId);
          emit(VideoLoaded(video: video));

        } catch (e) {
          emit(VideoError(errorMessage: e.toString()));
        }
      }
    });
  }
}
