import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/themebloc/theme_cubit.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/movie_details.dart';

class GenresWidget extends StatelessWidget {
  final MovieDetails movie;
  const GenresWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool theme=BlocProvider.of<ThemeCubit>(context).state;

    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Text(
              "Genres",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: 36,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movie.genres?.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2),
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 5,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color:theme? lightColor :Colors.black26),
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                       ),
                    child: Text(
                      movie.genres![index].name!,
                      style: TextStyle(
                          color: theme? kSecondaryColor :kTextColor.withOpacity(0.8), fontSize: 16),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
