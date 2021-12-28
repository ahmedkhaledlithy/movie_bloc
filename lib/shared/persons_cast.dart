import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';

class PersonsCast extends StatelessWidget {
  final EdgeInsets margin ;
  final String? imageUrl;
  final String name;
  final String subTitle;
  const PersonsCast({Key? key,required this.margin,this.imageUrl,required this.name,required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          imageUrl!=null? CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage( "https://image.tmdb.org/t/p/w200/$imageUrl"),
          ):const CircleAvatar(
            radius: 40,
            backgroundColor: kSecondaryColor,
            child: Text("NO IMAGE",style: TextStyle(color: Colors.white,fontSize: 12),),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2,
          ),

          const SizedBox(
            height: 5,
          ),
          Text(
            subTitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
