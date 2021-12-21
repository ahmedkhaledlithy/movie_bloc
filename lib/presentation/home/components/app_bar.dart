import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/presentation/home/components/search_delegate.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget  {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text("Movies",style: TextStyle(color: kSecondaryColor),),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu,color: Colors.black,),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search,color: Colors.black,),
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

