import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/searchbloc/search_movies_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/shared/loading_widget.dart';

class SearchResultsWidget extends StatelessWidget {

  const SearchResultsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
      builder: (context, state) {
        if (state is SearchMoviesLoaded) {
          List<Results> results = state.movie.results!;
          return results.isNotEmpty
              ? ListView.separated(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: results[index].backdropPath != null
                                ? NetworkImage(
                                    "https://image.tmdb.org/t/p/original/${results[index].backdropPath}")
                                : const AssetImage("assets/images/found1.png")
                                    as ImageProvider,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      title: Text(results[index].title!),
                      onTap: () {
                        Navigator.pushNamed(context, detailsScreen,
                            arguments: results[index].id);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(color: kTextLightColor,);
                  })
              : const Center(
                  child: Text("Not Find any Movie"),
                );
        } else if (state is SearchMoviesError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
