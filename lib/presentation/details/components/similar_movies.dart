import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/similarmoviebloc/similar_movies_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/shared/loading_widget.dart';
import 'package:movie_app/shared/shared_error.dart';
import 'package:movie_app/shared/similar_and_toprated_movies.dart';

class SimilarMovies  extends StatefulWidget {
  final int movieId;
  const SimilarMovies ({Key? key,required this.movieId}) : super(key: key);

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarMoviesBloc>(context).add(SimilarMoviesEventStarted(movieId: widget.movieId));

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  kDefaultPadding / 2,horizontal: kDefaultPadding) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
             "Similar Movies",
             style: Theme.of(context).textTheme.headline5,
           ),
          const SizedBox(height: kDefaultPadding / 2,),
          BlocBuilder<SimilarMoviesBloc,SimilarMoviesState>(
            builder: (BuildContext context, state) {
              if (state is SimilarMoviesError) {
                return SharedError(error: state.errorMessage);
              } else if (state is SimilarMoviesLoaded) {
                 List<Results> movies=state.movie.results!;

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
