import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/personsbloc/persons_bloc.dart';
import 'package:movie_app/presentation/home/components/build_persons_widget.dart';
import 'package:movie_app/presentation/home/components/home_error.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 20),
          child: Text(
            "trending persons on this week".toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        BlocBuilder<PersonsBloc, PersonsState>(
          builder: (BuildContext context, state) {
            if (state is PersonsError) {
              return HomeError(
                error: state.errorMessage,
                onPressed: () {
                  BlocProvider.of<PersonsBloc>(context)
                      .add(PersonEventStarted());
                },
              );
            } else if (state is PersonsLoaded) {
              return PersonsWidget(
                persons: state.persons.results!,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
