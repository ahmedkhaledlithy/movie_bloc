import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/business_logic/videobloc/video_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/data/models/movie_details.dart';
import 'package:movie_app/data/models/video.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  final MovieDetails movie;
  const TitleDurationAndFabBtn({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: [
                     Text(
                       "${movie.voteAverage! /2}",
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
                      itemSize: 30,
                      initialRating: movie.voteAverage! / 2,
                      minRating: 1,
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
              ],
            ),
          ),
          BlocBuilder<VideoBloc,VideoState>(
            builder: (BuildContext context, state) {
             if(state is VideoError){
               return Center(child: Text(state.errorMessage),);
             }else if(state is VideoLoaded){
               List<Results> video= state.video.results!;
               return SizedBox(
                 height: 60,
                 width: 60,
                 child: TextButton(
                   onPressed: () {
                     Navigator.pushNamed(context, videoScreen,arguments: video[0].key);
                   },
                   style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(kSecondaryColor),
                     shape: MaterialStateProperty.all(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20),
                       ),
                     ),
                   ),
                   child: const Icon(
                     Icons.play_arrow_rounded,
                     size: 28,
                     color: Colors.white,
                   ),
                 ),
               );
             }else{
               return const Center(child: CircularProgressIndicator(),);
             }
            },

          ),
        ],
      ),
    );
  }
}
