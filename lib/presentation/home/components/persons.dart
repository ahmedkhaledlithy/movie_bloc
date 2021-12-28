import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/personsbloc/persons_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/data/models/trending_persons.dart';
import 'package:movie_app/shared/loading_widget.dart';
import 'package:movie_app/shared/persons_cast.dart';
import 'package:movie_app/shared/shared_error.dart';


class PersonsList extends StatelessWidget {
  const PersonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "trending persons on this week".toUpperCase(),
            style:  Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 6,
          ),
          BlocBuilder<PersonsBloc, PersonsState>(
            builder: (BuildContext context, state) {
              if (state is PersonsError) {
                return SharedError(
                  error: state.errorMessage
                );
              } else if (state is PersonsLoaded) {
                final List<Results>  persons=state.persons.results!;
                return SizedBox(
                  height: 160,
                    child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: persons.length,
                      itemBuilder: (context, index) {
                        final  person=persons[index];
                        return PersonsCast(
                          margin: const EdgeInsets.only(top: kDefaultPadding, right: 12),
                          imageUrl: person.profilePath,
                          name: person.name!,
                          subTitle: "Trending for ${person.knownForDepartment}",
                        );
                      },
                    ),
                );
              } else {
                return const LoadingWidget();

              }
            },
          ),
        ],
      ),
    );
  }
}
