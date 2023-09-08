import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.cubit/app_colors.dart';
import 'app.cubit/cubit_App.dart';
import 'app.cubit/states.dart';

class RandomSweets extends StatelessWidget {
  const RandomSweets({
    super.key,
  });


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
        void scrollToTop() {
          cubit.scrollConS.animateTo(
            cubit.scrollConS.position.minScrollExtent,
            duration: const Duration(milliseconds: 2500),
            curve: Curves.bounceOut,
          );
        }
        return Scaffold(
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/OIP.jpeg"), // Replace with your image path
                fit: BoxFit.cover, // You can adjust the fit to your preference
              ),
            ),
            child: SingleChildScrollView(
              controller: cubit.scrollConS,
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 15, left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(2, 2), // changes position of shadow
                        ),
                      ],
                      // color: appBarColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 8, left: 8),
                        child: Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: NetworkImage(cubit.sweet['image']),
                                fit: BoxFit.fill),
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                            textDirection: TextDirection.rtl,
                                            cubit.isfavoraite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: cubit.isfavoraite
                                                ? Colors.red
                                                : null, // Filled or outlined color
                                          ),
                                          onPressed: () {
                                            if (cubit.isfavoraite) {
                                              cubit.DelfavoriteSweet();
                                            } else {
                                              cubit.favoriteSweet();
                                            }
                                            cubit.toggleFav();
                                          }),
                                      Container(
                                        height: 80,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Colors.black45,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              cubit.sweet['name'],
                                              textDirection: TextDirection.rtl,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 8, left: 8),
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 200),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white38,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10, right: 15),
                                  child: Text("المقادير",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: getBolitPoints(
                                      cubit.sweet['ingredients']),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white38,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10, right: 15),
                                  child: Text("الخطوات",
                                      style: TextStyle(
                                          fontSize: 27, color: Colors.black)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Column(
                                  children:
                                      getBolitPoints(cubit.sweet['directions']),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 8, right: 8, left: 8),
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        side: BorderSide(
                                            width: 1, color: appBarColor),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(200)),
                                        shadowColor: Colors.white),
                                    onPressed: cubit.prevSweet.isNotEmpty
                                        ? () {
                                            cubit.isfavoraite = false;
                                            cubit.getPrevSweet();
                                            scrollToTop();
                                          }
                                        : null,
                                    child: const Text(
                                      "الوصفة السابقة",
                                      style: TextStyle(
                                          color: Color(0xFFFFFAF0D7),
                                          fontWeight: FontWeight.bold),
                                    ))),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  side:
                                      BorderSide(width: 1, color: appBarColor),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(200)),
                                  shadowColor: Colors.black),
                              child: const Text(
                                "وصفة جديدة",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFFAF0D7)),
                              ),
                              onPressed: () {
                                cubit.isfavoraite = false;
                                cubit.filterSweet();
                                scrollToTop();
                              },
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          controller: cubit.searchSweet,
                          decoration: InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.white38, width: 2.0)),
                            filled: true,
                            fillColor: Colors.white38,
                            labelText: "المقادير المتاحة",
                            hintText: 'قشطه-كنافه',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            hintStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
