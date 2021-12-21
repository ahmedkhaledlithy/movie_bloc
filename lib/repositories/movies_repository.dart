import 'package:movie_app/data/models/cast.dart';
import 'package:movie_app/data/models/genre.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/models/movie_details_response.dart';
import 'package:movie_app/data/models/trending_persons.dart';
import 'package:movie_app/data/models/video.dart';
import 'package:movie_app/data/services/movies_service_api.dart';

class MoviesRepositories{
  final MoviesApiService moviesApiService;
  MoviesRepositories({ required this.moviesApiService});

  Future<Movie> getTopRatedMovies() async {
    return await moviesApiService.getTopRatedMovies();
  }

  Future<Movie> getNowPlayingMovies() async {
    return await moviesApiService.getNowPlayingMovies();

  }

  Future<Movie> getSimilarMovie(int id) async {
    return await moviesApiService.getSimilarMovie(id);
  }

  Future<Genre> getGenres() async {
    return await moviesApiService.getGenres();
  }


  Future<Movie> getMoviesByGenre(int id) async {
    return await moviesApiService.getMoviesByGenre(id);
  }

  Future<TrendingPersons> getTrendingPersons() async {
    return await moviesApiService.getTrendingPersons();
  }


  Future<MovieDetailsResponse> getMoviesDetails(int id) async {
    return await moviesApiService.getMoviesDetails(id);
  }

  Future<CastModel> getCasts(int id) async {
    return await moviesApiService.getCasts(id);
  }

  Future<Video> getMoviesVideo(int id) async {
    return await moviesApiService.getMoviesVideo(id);
  }

  Future<Movie> searchByMovieName(String movieName) async {
    return await moviesApiService.searchByMovieName(movieName);
  }

}