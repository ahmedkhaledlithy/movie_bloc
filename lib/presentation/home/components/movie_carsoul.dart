import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/movies_by_genre_id_bloc/movies_by_genre_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/shared/loading_widget.dart';
import '../../../shared/shared_error.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({Key? key}) : super(key: key);

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;

  final initialPage = ValueNotifier<int>(1);


  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      // so that we can have small portion shown on left and right side
      viewportFraction: 0.8,
      initialPage: initialPage.value,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    initialPage.dispose();
  }

  @override
  Widget build(BuildContext context) {

   final Orientation orientation=MediaQuery.of(context).orientation;

    return BlocBuilder<MoviesByGenreBloc, MoviesByGenreState>(
      builder: (context, state) {
       if(state is MoviesByGenreLoaded){
         return Padding(
           padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
           child: AspectRatio(
             aspectRatio:orientation==Orientation.portrait? 0.8 : 1.6,
             child: ValueListenableBuilder(
               valueListenable: initialPage,
               builder: (BuildContext context,int value, Widget? child) => PageView.builder(
                 onPageChanged: (newValue) {
                   initialPage.value=newValue;
                 },
                 controller: _pageController,
                 physics: const ClampingScrollPhysics(),
                 itemCount:state.movie.results!.length ,
                 itemBuilder: (context, index) {

                   return AnimatedBuilder(
                     animation: _pageController,
                     child: MovieCard(movie: state.movie.results![index]),
                     builder: (context, child) {

                       return AnimatedOpacity(
                         duration: const Duration(milliseconds: 350),
                         opacity: initialPage.value == index ? 1 : 0.4,
                         child: child,

                       );

                     },
                   );
                 },
               ),
             ),
           ),
         );
       }else if(state is MoviesByGenreError){

         return SharedError(error: state.errorMessage);

       }else{
         return const LoadingWidget();

       }
      },
    );
  }

}