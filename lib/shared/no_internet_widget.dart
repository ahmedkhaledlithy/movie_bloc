import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/themebloc/theme_cubit.dart';
import 'package:movie_app/constants/constants_app.dart';

class OfflineWidget extends StatelessWidget {

  const OfflineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool theme=BlocProvider.of<ThemeCubit>(context).state;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: theme? darkGreyColor  :kSecondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: lightColor,
                child: Image.asset(
                  "assets/images/internet1.png",
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'WHOOPS !',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: lightColor,
                    fontSize: 50),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'SLOW OR NO INTERNET CONNECTION ',
                textAlign: TextAlign.center,
                style: TextStyle(color: lightColor, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'CHECK YOUR INTERNET CONNECTION ',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}