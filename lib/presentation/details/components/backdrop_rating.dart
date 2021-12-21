import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie_details.dart';

class BackdropAndRating extends StatelessWidget {
  final MovieDetails movie;
  const BackdropAndRating({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.4,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.35,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50),),
              image: DecorationImage(
                fit: BoxFit.cover,
                image:movie.backdropPath!=null?
                NetworkImage('https://image.tmdb.org/t/p/original/${movie.backdropPath}'):
               const AssetImage("assets/images/found1.png")as ImageProvider,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 50,
                    color: const Color(0xFF12153D).withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:   [
                        const Icon(Icons.money,color:  Color(0xFF51CF66),),
                        const Text("Budget",style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),),
                        const SizedBox(height: kDefaultPadding / 4),
                        Text(movie.budget.toString(),style: const TextStyle(color: kTextLightColor),),
                      ],
                    ),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:   [
                        const Icon(Icons.watch_later_outlined,color: kTextLightColor),
                        const Text("Duration",style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),),
                        const SizedBox(height: kDefaultPadding / 4),
                        Text(movie.runtime!.toString() + " min",style: const TextStyle(color: kTextLightColor),),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Icon(Icons.calendar_today,color: kTextLightColor),
                        const Text(
                          "Release Date",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: kDefaultPadding / 4),
                        Text(
                          movie.releaseDate!,
                          style: const TextStyle(color: kTextLightColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SafeArea(child: BackButton(color: kSecondaryColor,)),
        ],
      ),
    );
  }
}
