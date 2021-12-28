import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/data/models/movie.dart';


class MovieCard extends StatelessWidget {
  final Results movie;

  const MovieCard({Key? key,required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final orientation=MediaQuery.of(context).orientation;
    final height=MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, detailsScreen,arguments: movie.id);
            },
            child: Container(
              height:orientation==Orientation.portrait? height * 0.55 : height * 0.85,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: const [kDefaultShadow],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: movie.posterPath !=null ?
                  NetworkImage("https://image.tmdb.org/t/p/original/${movie.posterPath}"):
                  const AssetImage("assets/images/found2.png")as ImageProvider,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              movie.title!,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star,color: kFillStarColor,),
              const SizedBox(width: kDefaultPadding / 2),
              Text(
                "${movie.voteAverage} / 10",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ],
      ),

    );


  }
}