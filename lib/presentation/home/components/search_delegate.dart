import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/searchbloc/search_movies_bloc.dart';
import 'package:movie_app/presentation/home/components/search_results_suggestions.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      BlocProvider.of<SearchMoviesBloc>(context)
          .add(SearchMovieEventStarted(movieName: query));
    }
    return const SearchResultsWidget();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    BlocProvider.of<SearchMoviesBloc>(context)
        .add(SearchMovieEventStarted(movieName: query));

    return const SearchResultsWidget();
  }
}
