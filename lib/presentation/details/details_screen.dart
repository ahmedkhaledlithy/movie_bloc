import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:movie_app/business_logic/moviedetailsbloc/details_bloc.dart';
import 'package:movie_app/business_logic/videobloc/video_bloc.dart';
import 'package:movie_app/data/models/movie_details.dart';
import 'package:movie_app/presentation/details/components/body.dart';
import 'package:movie_app/shared/loading_widget.dart';
import 'package:movie_app/shared/shared_error.dart';
import 'package:movie_app/shared/no_internet_widget.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;
  const DetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  void initState() {
    BlocProvider.of<DetailsBloc>(context).add(DetailsEventStarted(movieId: widget.movieId));
    BlocProvider.of<VideoBloc>(context).add(VideoEventStarted(movieId:widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return OfflineBuilder(
      connectivityBuilder: (BuildContext context,
          ConnectivityResult connectivity, Widget child) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {

          return child;
        } else {
          return  const OfflineWidget();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is DetailsError) {
              return SharedError(error: state.errorMessage);

            } else if (state is DetailsLoaded) {
              MovieDetails details = state.movieDetails;
              return Body(
                movieId: widget.movieId,
                details: details,
              );
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
