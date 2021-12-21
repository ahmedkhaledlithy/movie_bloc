import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_routing.dart';
import 'package:movie_app/business_logic/castbloc/cast_bloc.dart';
import 'package:movie_app/business_logic/moviedetailsbloc/details_bloc.dart';
import 'package:movie_app/business_logic/videobloc/video_bloc.dart';
import 'package:movie_app/data/services/movies_service_api.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'business_logic/searchbloc/search_movies_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final MoviesApiService service =MoviesApiService();
  final MoviesRepositories repository= MoviesRepositories(moviesApiService: service);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => DetailsBloc(
            repositories: repository,
          ),
        ),

        BlocProvider(
          create: (BuildContext context) => CastBloc(
           moviesRepositories: repository,
          ),
        ),

        BlocProvider(
          create: (BuildContext context) => VideoBloc(
            repositories: repository,
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => SearchMoviesBloc(
            moviesRepositories: repository,
          ),
        ),
      ],
      child: MyApp(
        appRouting: AppRouting(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouting appRouting;

  const MyApp({Key? key, required this.appRouting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouting.generateRoute,
    );
  }
}
