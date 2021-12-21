import 'package:flutter/material.dart';

import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie_details.dart';
import 'package:movie_app/presentation/details/components/cast_and_crew.dart';
import 'package:movie_app/presentation/details/components/genres.dart';
import 'package:movie_app/presentation/details/components/overview.dart';
import 'package:movie_app/presentation/details/components/title_duration_and_fav_btn.dart';
import 'backdrop_rating.dart';


class Body extends StatelessWidget {
  final int movieId;
  final MovieDetails details;
  const Body({Key? key,required this.movieId,required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          BackdropAndRating(movie:details),
          const SizedBox(height: kDefaultPadding / 2),
          TitleDurationAndFabBtn(movie: details),
          GenresWidget(movie: details),
          const SizedBox(height: kDefaultPadding / 2),
          OverView(movie: details,),
          CastAndCrew(movieId: movieId,),
        ],
      ),
    );
  }
}
