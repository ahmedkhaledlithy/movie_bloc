import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/data/models/movie.dart';

class SimilarTopRatedMovies extends StatelessWidget {
  final List<Results> movies;
  const SimilarTopRatedMovies({Key? key,required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, detailsScreen,arguments: movies[index].id);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  movies[index].posterPath != null? Container(
                    width: 130,
                    height: 180,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage("https://image.tmdb.org/t/p/w500/" + movies[index].posterPath!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ): Container(
                    width: 130,
                    height: 180,
                    decoration:  const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        shape: BoxShape.rectangle,
                        color: kSecondaryColor
                    ),
                    child: const Text("NO IMAGE",style: TextStyle(color: Colors.white,fontSize: 12),),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      movies[index].title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:  Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Text(
                          "${movies[index].voteAverage!.floor() /2}",
                          style:  Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        RatingBar.builder(
                          itemSize: 24,
                          initialRating: movies[index].voteAverage!.floor() /2,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return IconButton(
                                icon: const Icon(
                                  Icons.star,
                                  color: kFillStarColor,
                                ),
                                onPressed: () {});
                          },
                          onRatingUpdate: (rating) {
                            debugPrint(rating.toString());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
