import 'package:flutter/material.dart';

class SharedError extends StatelessWidget {
  final String error;
  const SharedError({Key? key,required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
