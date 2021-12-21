import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/moviedetailsbloc/details_bloc.dart';
import 'package:movie_app/constants/constants_app.dart';

class DetailsErrorWidget extends StatelessWidget {
  final int? movieId;
  final String errorMessage;
  const DetailsErrorWidget({Key? key,this.movieId,required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: const TextStyle(color: Colors.black, fontSize: 32),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<DetailsBloc>(context)
                  .add(DetailsEventStarted(movieId: movieId!));
            },
            child: const Text(
              "Try Again",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(kSecondaryColor),
              fixedSize:
              MaterialStateProperty.all(const Size(150, 50)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
