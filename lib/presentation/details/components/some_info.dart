import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';

class SomeInfo extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String infoName;
  final String subName;
  const SomeInfo({Key? key,required this.iconData,required this.iconColor,required this.infoName,required this.subName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:   [
         Icon(iconData,color:  iconColor,),
         Text(infoName,style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600),),
         const SizedBox(height: kDefaultPadding / 4),
        Text(subName,),
      ],
    );
  }
}
