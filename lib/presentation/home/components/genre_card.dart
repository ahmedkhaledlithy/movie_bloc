import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/genre.dart';

class GenreCard extends StatelessWidget {
  final Genres genre;
  final int? selectedGenre ;
  final Function()? onTap;

  const GenreCard({Key? key,required this.genre, this.onTap, this.selectedGenre }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20),
          color: selectedGenre==genre.id ? kSecondaryColor : Colors.white
        ),
        child: Text(
          genre.name!,
          style: TextStyle(color: kTextColor.withOpacity(0.8), fontSize: 16),
        ),
      ),
    );
  }
}