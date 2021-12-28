import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/moviebloc/movie_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/presentation/home/components/build_now_movies.dart';
import 'package:movie_app/shared/loading_widget.dart';

import '../../../shared/shared_error.dart';


class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying>  {

  final selectedIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation=MediaQuery.of(context).orientation;
    final Size  size=MediaQuery.of(context).size;

    return BlocBuilder<MovieBloc, MovieState>(
      builder: (BuildContext context, state) {

       if(state is MovieLoaded){
          Movie movie= state.movie;
          if(movie.results!.isEmpty){
            return const Center(child: Text("No Movies"),);
          }else{
            return SizedBox(
              width: size.width,
              height:orientation==Orientation.portrait? size.height *0.25 : size.height * 0.5,
              child: ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context,int value, child) =>
                 Swiper(
                  scrollDirection: Axis.horizontal,
                  indicatorLayout: PageIndicatorLayout.WARM,
                  itemHeight: size.height,
                  itemWidth: size.width *0.25,
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
        }
       if(state is MovieError){
         return SharedError(error: state.errorMessage);
       } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
