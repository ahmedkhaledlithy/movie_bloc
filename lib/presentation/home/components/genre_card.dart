import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/themebloc/theme_cubit.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/genre.dart';

class GenreCard extends StatelessWidget {
  final Genres genre;
  final int? selectedGenre ;
  final Function()? onTap;

  const GenreCard({Key? key,required this.genre, this.onTap, this.selectedGenre }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ThemeCubit,bool>(
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 5,
            ),
            decoration: BoxDecoration(
                border:  Border.all(color: selectedGenre!=genre.id ? state? lightColor :Colors.black26 : kSecondaryColor),
                borderRadius: BorderRadius.circular(20),
                color: selectedGenre==genre.id ? state? kSecondaryColor :  kSecondaryColor : Colors.transparent
            ),
            child: Text(
              genre.name!,
              style: TextStyle(color:selectedGenre==genre.id ? state? lightColor : lightColor :kSecondaryColor, fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}