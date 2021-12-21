import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/cast.dart';

class CastCard extends StatelessWidget {
 final Cast cast;
  const CastCard({Key? key,required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: kDefaultPadding),
      width: 80,
      child: Column(
        children: [
          cast.profilePath!=null? Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500/${cast.profilePath}",
                ),
              ),
            ),
          ):
          Container(
            height: 80,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kSecondaryColor
            ),
            child: const Text("NO IMAGE",style: TextStyle(color: Colors.white,fontSize: 12),),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            cast.originalName!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          const SizedBox(height: kDefaultPadding / 4),
          Text(
            cast.character!,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(color: kTextLightColor),
          ),
        ],
      ),
    );
  }
}
