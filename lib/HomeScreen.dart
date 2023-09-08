import 'package:iclub/FavScreen.dart';
import 'package:iclub/RandomSweats.dart';

import 'profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';
import 'RandomRecipes.dart';
import 'app.cubit/app_colors.dart';
import 'app.cubit/cubit_App.dart';
import 'app.cubit/states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return DefaultTabController(
          initialIndex: 2,
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(
                      icon: Icon(
                    Icons.person_2_outlined,
                    color: Colors.black,
                  )),
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
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavScreen()));
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        textDirection: TextDirection.rtl,
                      ))
                ],
              ),
            ),
            backgroundColor: mainBackgroundColor,
            body: const TabBarView(
              children: [
                Profile(), // index 0
                RandomRecipe(), // index 1
                RandomSweets(),
              ],
            ),
          ),
        );
      },
    );
  }
}
