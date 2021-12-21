import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/trending_persons.dart';

class PersonsWidget extends StatelessWidget {
 final List<Results> persons;
  const PersonsWidget({Key? key,required this.persons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      padding: const EdgeInsets.only(left: 18),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: persons.length,
        itemBuilder: (context, index) {
          final  person=persons[index];

          return Container(
            padding: const EdgeInsets.only(top: 10, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                person.profilePath!=null? CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage( "https://image.tmdb.org/t/p/w200/${person.profilePath}"),
                ):const CircleAvatar(
                  radius: 40,
                  backgroundColor: kSecondaryColor,
                  child: Text("NO IMAGE",style: TextStyle(color: Colors.white,fontSize: 12),),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  person.name!,
                  maxLines: 2,
                  style: const TextStyle(
                    height: 1.4,
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Trending for ${person.knownForDepartment}",
                  style: const TextStyle(
                    color: kTextLightColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
