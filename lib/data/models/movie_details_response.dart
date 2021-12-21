import 'package:movie_app/data/models/movie_details.dart';

class MovieDetailsResponse {
  final MovieDetails movieDetails;

  MovieDetailsResponse(this.movieDetails,);

  MovieDetailsResponse.fromJson(dynamic json)
      : movieDetails = MovieDetails.fromJson(json);


}