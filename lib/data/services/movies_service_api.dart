import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/data/models/cast.dart';
import 'package:movie_app/data/models/genre.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/models/movie_details.dart';
import 'package:movie_app/data/models/trending_persons.dart';
import 'package:movie_app/data/models/video.dart';


class MoviesApiService{

  late Dio dio;
  final String apikey = "79d8e95dcbb176a778dea0ef4e8ab5d2";

  final String getPopularUrl = "$baseUrl/movie/top_rated";
  final String getMovieUrl = "$baseUrl/discover/movie";
  final String getPlayingUrl = "$baseUrl/movie/now_playing";
  final String getGenresUrl = "$baseUrl/genre/movie/list";
  final String getPersonsUrl = "$baseUrl/trending/person/week";
  final String movieUrl="$baseUrl/movie";
  final String searchMovieUrl="$baseUrl/search/movie";

  MoviesApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10000,
      receiveTimeout: 5000,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    dio = Dio(options);

  }

  Future<Movie> getTopRatedMovies() async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
      "page": 1,
    };

    try {
      Response response = await dio.get(getPopularUrl, queryParameters: params);
      return Movie.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace: $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      throw error.message;

    }
  }

  Future<Movie> getNowPlayingMovies() async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
      "page": 1,
    };

    try {
      Response response = await dio.get(getPlayingUrl, queryParameters: params);
      return Movie.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace : $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      throw error.message;

    }
  }

  Future<Movie> getSimilarMovie(int id) async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
    };

    try {
      Response response = await dio.get(movieUrl + "/$id" + "/similar", queryParameters: params);
      return Movie.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace: $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      throw error.message;

    }
  }

  Future<Genre> getGenres() async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
      "page": 1,
    };

    try {
      Response response = await dio.get(getGenresUrl, queryParameters: params);
      return Genre.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace: $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      throw error.message;

    }
  }


  Future<Movie> getMoviesByGenre(int id) async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };

    try {
      Response response = await dio.get(getMovieUrl, queryParameters: params);
      return Movie.fromJson(response.data);
    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace: $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      throw error.message;

    }
  }

  Future<TrendingPersons> getTrendingPersons() async {
    var params = {
      "api_key": apikey,
    };

    try {
      Response response = await dio.get(getPersonsUrl, queryParameters: params);
      return TrendingPersons.fromJson(response.data) ;
    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace: $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      throw error.message;

    }
  }



  Future<MovieDetails> getMoviesDetails(int id) async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
    };

    try {

      Response response = await dio.get(movieUrl + "/$id", queryParameters: params);
        return MovieDetails.fromJson(response.data);

    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace: $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      throw error.message;

    }

  }

  Future<CastModel> getCasts(int id) async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
    };

    try {
      Response response = await dio.get(movieUrl + "/$id" + "/credits", queryParameters: params);
      return CastModel.fromJson(response.data) ;
    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace: $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      throw error.message;

    }
  }

  Future<Video> getMoviesVideo(int id) async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
    };

    try {
      Response response = await dio.get(movieUrl + "/$id" + "/videos", queryParameters: params);
      return  Video.fromJson(response.data) ;
    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace: $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      throw error.message;

    }
  }

  Future<Movie> searchByMovieName(String movieName) async {
    var params = {
      "api_key": apikey,
      "language": "en-US",
      "page": 1,
      "query": movieName
    };

    try {
      Response response = await dio.get(searchMovieUrl, queryParameters: params);
     if(response.statusCode == 200){
       return Movie.fromJson(response.data);
     }else{
       throw "";
     }
    } on DioError catch (error, stacktrace) {
      debugPrint("Exception : $error  stackTrace: $stacktrace");
      if(error.type == DioErrorType.connectTimeout){
        throw "Check Your Connection ";
      }
      if(error.type==DioErrorType.other){
        throw "Check Your Internet";
      }
      if(error.type==DioErrorType.response){
        throw "No Results";
      }
      throw error.message;

    }
  }

}