import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/business_logic/themebloc/theme_cubit.dart';
import 'package:movie_app/constants/constants_app.dart';
import 'package:movie_app/presentation/home/components/search_delegate.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          title: const Text(
            "Movies",
            style: TextStyle(color: kSecondaryColor),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              state ? Icons.wb_sunny_outlined : Icons.nightlight_outlined,
              color: state ? Colors.white : Colors.black,
            ),
            onPressed: () {
              BlocProvider.of<ThemeCubit>(context).changeTheme(value: !state);
            },
          ),
          actions: [
            IconButton(
              icon:  Icon(
                Icons.search,
                color: state ? Colors.white : Colors.black,
              ),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
