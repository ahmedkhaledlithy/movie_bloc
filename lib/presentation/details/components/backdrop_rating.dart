import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/themebloc/theme_cubit.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie_details.dart';
import 'package:movie_app/presentation/details/components/some_info.dart';

class BackdropAndRating extends StatelessWidget {
  final MovieDetails movie;
  const BackdropAndRating({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final Size size = MediaQuery.of(context).size;
    final Orientation orientation=MediaQuery.of(context).orientation;

    return SizedBox(
      height:orientation==Orientation.portrait? size.height * 0.4 : size.height * 0.7,
      child: Stack(
        children: [
          Container(
            height:orientation==Orientation.portrait? size.height * 0.35 : size.height * 0.6,
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
                color: BlocProvider.of<ThemeCubit>(context).state? Colors.black: lightColor,
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

                    SomeInfo(
                      iconData: Icons.money,
                      iconColor: const Color(0xFF51CF66),
                      infoName: "Budget",
                      subName: movie.budget.toString(),
                    ),
                    SomeInfo(
                      iconData: Icons.watch_later_outlined,
                      iconColor: kTextLightColor,
                      infoName: "Duration",
                      subName: "${movie.runtime} min",
                    ),
                    SomeInfo(
                      iconData: Icons.calendar_today,
                      iconColor: kTextLightColor,
                      infoName: "Release Date",
                      subName:  movie.releaseDate!,
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
