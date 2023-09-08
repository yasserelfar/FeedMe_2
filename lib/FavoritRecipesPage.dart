import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iclub/RandomRecipes.dart';
import 'package:iclub/app.cubit/cubit_App.dart';
import 'package:iclub/app.cubit/states.dart';

import 'RandomSweats.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  List<Widget> getBolitPoints(var items) {
    List<Widget> texts = [];

    for (var item in items) {
      texts.add(Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Expanded(
            child: Text("# $item",
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ));
    }

    return texts;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: cubit.favoriteRecipes.isNotEmpty
                    ? Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/OIP.jpeg"), // Replace with your image path
                            fit: BoxFit
                                .cover, // You can adjust the fit to your preference
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: cubit.favoriteRecipes.length,
                          // Doubled to create a continuous effect
                          itemBuilder: (context, index) {
                            var itemIndex =
                                index % cubit.favoriteRecipes.length;
                            return ListTile(
                              title: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, right: 8, left: 8),
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  cubit.favoriteRecipes[
                                                      itemIndex]["image"]),
                                              fit: BoxFit.cover),
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Container(
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    color: Colors.black45,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            cubit.recipe = cubit
                                                                    .favoriteRecipes[
                                                                itemIndex];
                                                            cubit
                                                                .DelfavoriteRecipe();
                                                          },
                                                          icon: Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FittedBox(
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                              child: Text(
                                                                  cubit.favoriteRecipes[
                                                                          itemIndex]
                                                                      ["name"],
                                                                  textDirection:
                                                                      TextDirection
                                                                          .rtl,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Colors
                                                                          .white38)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                cubit.sweet = cubit.favoriteSweets[itemIndex];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RandomSweets()));
                              },
                              // You can customize the ListTile as needed
                            );
                          },
                        ),
                      )
                    : Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/OIP.jpeg"), // Replace with your image path
                            fit: BoxFit
                                .cover, // You can adjust the fit to your preference
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 85,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Colors.black12),
                                child: Text("No favorites yet",
                                    style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )));
      },
    );
  }
}
