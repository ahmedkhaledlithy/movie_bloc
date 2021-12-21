import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie_details.dart';

class OverView extends StatelessWidget {
  final MovieDetails movie;
  const OverView({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  kDefaultPadding / 2,horizontal: kDefaultPadding) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OverView",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 10),
          Text(
            movie.overview!,
            style: const TextStyle(
              color: Color(0xFF737599),
            ),
          ),
        ],
      ),
    );
  }
}
