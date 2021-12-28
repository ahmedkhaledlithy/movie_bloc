import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';



class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: kSecondaryColor,
    brightness: Brightness.light,
    backgroundColor: lightColor,


  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkGreyColor,
    brightness: Brightness.dark,
    backgroundColor: darkGreyColor,
  );
}
