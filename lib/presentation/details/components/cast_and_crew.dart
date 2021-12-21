import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/castbloc/cast_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/cast.dart';
import 'package:movie_app/presentation/details/components/cast_card.dart';

class CastAndCrew extends StatefulWidget {
  final int movieId;
  const CastAndCrew({Key? key,required this.movieId}) : super(key: key);

  @override
  State<CastAndCrew> createState() => _CastAndCrewState();
}

class _CastAndCrewState extends State<CastAndCrew> {

  @override
  void initState() {
    BlocProvider.of<CastBloc>(context).add(CastEventStarted(movieId: widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast & Crew",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: kDefaultPadding),
          BlocBuilder<CastBloc,CastState>(
            builder: (BuildContext context, state) {
              if (state is CastError) {
                return Center(child: Text(state.errorMessage),);
              } else if (state is CastLoaded) {
                return SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.cast.cast!.length,
                    itemBuilder: (context, index) {
                      final Cast cast = state.cast.cast![index];

                      return CastCard(cast: cast);
                    },
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }

            },

          )
        ],
      ),
    );
  }
}
