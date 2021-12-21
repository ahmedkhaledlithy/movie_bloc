import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/business_logic/topmoviebloc/top_rated_movies_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/data/models/movie.dart';

import 'home_error.dart';

class TopMovies extends StatelessWidget {
  const TopMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 20),
          child: Text(
            "Top Rated movies".toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        BlocBuilder<TopRatedMoviesBloc,TopRatedMoviesState>(
          builder: (BuildContext context, state) {
            if(state is TopRatedMoviesError){
              return HomeError(
                error: state.errorMessage,
                onPressed: () {
                  BlocProvider.of<TopRatedMoviesBloc>(context).add(TopRatedMoviesEventStarted());
                },
              );
            }else if(state is TopRatedMoviesLoaded){
              Movie movie= state.movie;
              if(movie.results!.isEmpty){
                return const Center(child: Text("No Movies"),);
              }else{
                return Container(
                  height: 280,
                  padding: const EdgeInsets.only(left: 18),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.results!.length,
                    itemBuilder: (context, index) {

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, detailsScreen,arguments: movie.results![index].id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              movie.results![index].posterPath != null? Container(
                                width: 130,
                                height: 180,
                                decoration:  BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    image: NetworkImage("https://image.tmdb.org/t/p/w500/" + movie.results![index].posterPath!),
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
                                  movie.results![index].title!,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      height: 1.4,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                     Text(
                                      "${movie.results![index].voteAverage /2}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    RatingBar.builder(
                                      itemSize: 24,
                                      initialRating: movie.results![index].voteAverage /2,
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
                                        if (kDebugMode) {
                                          print(rating);
                                        }
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
            }else {
              return const Center(child: CircularProgressIndicator());
            }

          },

        ),
      ],
    );
  }
}
