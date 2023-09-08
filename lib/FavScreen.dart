import 'package:iclub/FavoriteSweetsPage.dart';

import 'FavoritRecipesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';
import 'app.cubit/app_colors.dart';
import 'app.cubit/cubit_App.dart';
import 'app.cubit/states.dart';

class FavScreen extends StatelessWidget {
  FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(
                      icon: Icon(
                    UniconsLine.dice_six,
                    color: Colors.black,
                  )),
                  Tab(
                      icon: Icon(
                    UniconsLine.dice_six,
                    color: Colors.black,
                  )),
                ],
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              backgroundColor: appBarColor,
              foregroundColor: Colors.black,
              title: Row(
                children: [
                  const Text("Feed Me"),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset('icons/header.png'),
                ],
              ),
            ),
            backgroundColor: mainBackgroundColor,
            body: const TabBarView(
              children: [
                RecipesPage(),
                SweetsPage(),
              ],
            ),
          ),
        );
      },
    );
  }
}
