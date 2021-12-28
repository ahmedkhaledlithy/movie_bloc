import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/topmoviebloc/top_rated_movies_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/shared/loading_widget.dart';
import 'package:movie_app/shared/shared_error.dart';
import 'package:movie_app/shared/similar_and_toprated_movies.dart';

class TopMovies extends StatelessWidget {
  const TopMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Rated movies".toUpperCase(),
            style:  Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 6,
          ),
          BlocBuilder<TopRatedMoviesBloc,TopRatedMoviesState>(
            builder: (BuildContext context, state) {
              if(state is TopRatedMoviesError){
                return SharedError(
                  error: state.errorMessage
                );
              }else if(state is TopRatedMoviesLoaded){
                List<Results> movies= state.movie.results!;
                if(movies.isEmpty){
                  return const Center(child: Text("No Movies"),);
                }else{
                  return SimilarTopRatedMovies(movies: movies,);
                }
              }else {
                return const LoadingWidget();
              }

            },

          ),
        ],
      ),
    );
  }
}
