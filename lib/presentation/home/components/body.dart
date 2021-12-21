import 'package:flutter/material.dart';
import 'package:movie_app/presentation/home/components/genres_list.dart';
import 'package:movie_app/presentation/home/components/movie_carsoul.dart';
import 'package:movie_app/presentation/home/components/now_playing.dart';
import 'package:movie_app/presentation/home/components/persons.dart';
import 'package:movie_app/presentation/home/components/top_rated_movies.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          NowPlaying(),
          GenresList(),
          MovieCarousel(),
          PersonsList(),
          TopMovies(),
        ],
      ),
    );
  }
}
