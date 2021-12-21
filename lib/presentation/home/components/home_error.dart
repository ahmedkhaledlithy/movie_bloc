import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';

class HomeError extends StatelessWidget {
  final String error;
  final Function()? onPressed;
  const HomeError({Key? key,required this.error, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(error),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              "Try Again",
              style: TextStyle(color: kSecondaryColor, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
