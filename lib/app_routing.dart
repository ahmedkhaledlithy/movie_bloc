import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/genresbloc/genres_bloc.dart';
import 'package:movie_app/business_logic/movies_by_genre_id_bloc/movies_by_genre_bloc.dart';
import 'package:movie_app/business_logic/personsbloc/persons_bloc.dart';
import 'package:movie_app/business_logic/topmoviebloc/top_rated_movies_bloc.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/presentation/details/details_screen.dart';
import 'package:movie_app/presentation/home/home_screen.dart';
import 'package:movie_app/presentation/video/video_screen.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'business_logic/moviebloc/movie_bloc.dart';
import 'data/services/movies_service_api.dart';

class AppRouting {
  late final MoviesApiService moviesApiService;
  late final MoviesRepositories repositories;

  AppRouting() {
    moviesApiService = MoviesApiService();
    repositories = MoviesRepositories(moviesApiService: moviesApiService);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<MovieBloc>(
                    create: (_) => MovieBloc(moviesRepositories: repositories)
                      ..add(MovieEventStarted()),
                  ),
                  BlocProvider<GenresBloc>(
                    create: (_) =>
                        GenresBloc(moviesRepositories: repositories)
                          ..add(GenresEventStarted()),
                  ),
                  BlocProvider<MoviesByGenreBloc>(
                    create: (_) =>
                        MoviesByGenreBloc(moviesRepositories: repositories)
                          ..add(const MoviesByGenreEventStarted(genreId: 28)),
                  ),
                  BlocProvider<PersonsBloc>(
                    create: (_) =>
                        PersonsBloc(moviesRepositories: repositories)
                          ..add(PersonEventStarted()),
                  ),
                  BlocProvider<TopRatedMoviesBloc>(
                    create: (_) =>
                        TopRatedMoviesBloc(moviesRepositories: repositories)
                          ..add(TopRatedMoviesEventStarted()),
                  ),

                ], child: const HomeScreen()));

      case detailsScreen:
        final movieId = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(movieId: movieId));

      case videoScreen:
        final videoId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => VideoScreen(
            videoUrl: videoId,
          ),
        );
    }
  }
}
