import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_app/app_routing.dart';
import 'package:movie_app/business_logic/castbloc/cast_bloc.dart';
import 'package:movie_app/business_logic/moviedetailsbloc/details_bloc.dart';
import 'package:movie_app/business_logic/similarmoviebloc/similar_movies_bloc.dart';
import 'package:movie_app/business_logic/themebloc/theme_cubit.dart';
import 'package:movie_app/business_logic/videobloc/video_bloc.dart';
import 'package:movie_app/data/services/movies_service_api.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'package:movie_app/theme/app_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'business_logic/searchbloc/search_movies_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
  );
  final MoviesApiService service =MoviesApiService();
  final MoviesRepositories repository= MoviesRepositories(moviesApiService: service);
  HydratedBlocOverrides.runZoned((){
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

          BlocProvider(
            create: (BuildContext context) => SimilarMoviesBloc(
              moviesRepositories: repository,
            ),
          ),
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit(),
          ),
        ],
        child: MyApp(
          appRouting: AppRouting(),
        ),
      ),
    );

  },
    storage: storage,
  );

}

class MyApp extends StatelessWidget {
  final AppRouting appRouting;

  const MyApp({Key? key, required this.appRouting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouting.generateRoute,
          themeMode: state ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        );
      },
    );
  }
}
