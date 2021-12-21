import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/moviebloc/movie_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/presentation/home/components/build_now_movies.dart';

import 'home_error.dart';


class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {

  final selectedIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (BuildContext context, state) {
        if(state is MovieError){

          return HomeError(error: state.errorMessage,onPressed: (){
            BlocProvider.of<MovieBloc>(context).add(MovieEventStarted());
          },);

        }else if(state is MovieLoaded){
          Movie movie= state.movie;
          if(movie.results!.isEmpty){
            return const Center(child: Text("No Movies"),);
          }else{
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *0.25,
              child: ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context,int value, child) =>
                 Swiper(
                  scrollDirection: Axis.horizontal,
                  indicatorLayout: PageIndicatorLayout.WARM,
                  itemHeight: MediaQuery.of(context).size.width,
                  itemWidth: MediaQuery.of(context).size.height *0.25,
                  onIndexChanged: (int newValue) {
                    selectedIndex.value=newValue;
                  },
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          activeColor: kSecondaryColor,
                          color: Colors.grey
                      )
                  ),
                  loop: false,
                  index: value,
                  itemCount:  movie.results!.take(5).length,
                  viewportFraction: 0.8,
                  scale: 0.8,
                  itemBuilder: (context, index) {
                   return NowMoviesWidget(movie: movie.results![index],);
                  },

                ),
              ),
            );
          }
        }else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
