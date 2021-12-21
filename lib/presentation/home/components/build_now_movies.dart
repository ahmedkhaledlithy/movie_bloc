import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie.dart';

class NowMoviesWidget extends StatelessWidget {
  final Results movie;
  const NowMoviesWidget({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration:  BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image:  DecorationImage(
              image:movie.backdropPath !=null?
              NetworkImage("https://image.tmdb.org/t/p/original/${movie.backdropPath}")
                  :const AssetImage("assets/images/found2.png")as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                darkColor.withOpacity(0.1),
                darkColor.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.8, 0.9],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  movie.title!,
                  style: const TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
