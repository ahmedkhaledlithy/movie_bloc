import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/genresbloc/genres_bloc.dart';
import 'package:movie_app/business_logic/movies_by_genre_id_bloc/movies_by_genre_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/genre.dart';
import 'package:movie_app/presentation/home/components/genre_card.dart';
import 'package:movie_app/presentation/home/components/home_error.dart';

class GenresList extends StatefulWidget {
  const GenresList({Key? key}) : super(key: key);

  @override
  State<GenresList> createState() => _GenresListState();
}

class _GenresListState extends State<GenresList> {

  final selectedGenre = ValueNotifier<int>(28);

  @override
  void dispose() {
    selectedGenre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GenresBloc, GenresState>(
      builder: (context, state) {
        if(state is GenresLoaded){

            return Container(
              margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.genre.genres!.length,
                itemBuilder: (context, index) {
                  final Genres genre= state.genre.genres![index];
                 return ValueListenableBuilder(
                   valueListenable: selectedGenre,
                   builder: (BuildContext context,int value, Widget? child) =>
                    GenreCard(
                      genre: genre,
                      onTap: (){
                        selectedGenre.value = genre.id!;
                        BlocProvider.of<MoviesByGenreBloc>(context).add(MoviesByGenreEventStarted(genreId: genre.id!));
                        },
                      selectedGenre: value,
                    ),
                 );
                }

              ),
            );

        }else if(state is GenresError){
         return HomeError(error: state.error,onPressed: (){
           BlocProvider.of<GenresBloc>(context).add(GenresEventStarted());
         },);
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
