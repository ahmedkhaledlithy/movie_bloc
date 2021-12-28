import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:movie_app/presentation/home/components/app_bar.dart';
import 'package:movie_app/presentation/home/components/body.dart';
import 'package:movie_app/shared/no_internet_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return  OfflineBuilder(
      connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child) {
        final bool connected = connectivity != ConnectivityResult.none;
        if(connected){
          return child;
        }else{
          return  const OfflineWidget();
        }
      },
      child:  Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: const AppBarWidget(),
        body: const Body(),
      ),
    );
  }
}
