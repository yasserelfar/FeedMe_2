import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.cubit/app_colors.dart';
import 'app.cubit/cubit_App.dart';
import 'app.cubit/states.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        cubit.putPersonalData();

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
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 15, left: 10, right: 10),
                child: Container(
                  constraints: const BoxConstraints(
                      minHeight: 200, minWidth: double.infinity),
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
                          const BorderRadius.all(Radius.circular(100))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // email
                        TextFormField(
                          controller: cubit.email,
                          enabled: false,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(200.0)),
                                  borderSide: BorderSide(color: appBarColor)),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              filled: true,
                              // fillColor: mainBackgroundColor,

                              labelText: "Email",
                              labelStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              prefixIcon: const Icon(Icons.email_outlined),
                              prefixIconColor: Colors.white),
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // name
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          enabled: false,
                          controller: cubit.name,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(200.0)),
                                  borderSide: BorderSide(color: appBarColor)),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              filled: true,
                              // fillColor: mainBackgroundColor,

                              labelText: "Name",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon:
                                  const Icon(Icons.supervised_user_circle),
                              prefixIconColor: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // password
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: cubit.password,
                          enabled: false,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(200.0)),
                                  borderSide: BorderSide(color: appBarColor)),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              filled: true,
                              // fillColor: mainBackgroundColor,

                              labelText: "Password",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(Icons.password_outlined),
                              prefixIconColor: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // phone
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: cubit.phone,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(200.0)),
                                  borderSide: BorderSide(color: appBarColor)),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              filled: true,
                              // fillColor: mainBackgroundColor,

                              labelText: "Phone",
                              labelStyle: const TextStyle(color: Colors.black),
                              prefixIcon:
                                  const Icon(Icons.phone_enabled_outlined),
                              prefixIconColor: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                enabled: false,
                                controller: cubit.weight,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(200.0)),
                                        borderSide:
                                            BorderSide(color: appBarColor)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200.0)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    filled: true,
                                    // fillColor: mainBackgroundColor,
                                    labelText: "Weight",
                                    labelStyle: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    prefixIcon:
                                        Image.asset('icons/weight.png')),
                              ),
                            ),
                            const SizedBox(

                              width: 5,
                            ),
                            Expanded(

                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                enabled: false,
                                controller: cubit.height,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(200.0)),
                                        borderSide:
                                            BorderSide(color: appBarColor)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200.0)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    filled: true,
                                    // fillColor: mainBackgroundColor,

                                    labelText: "Height",
                                    labelStyle: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    prefixIcon:
                                        Image.asset('icons/height.png')),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // mbi
                        Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                                  style: TextStyle(color: Colors.white),
                              enabled: false,
                              controller: cubit.age,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(200.0)),
                                      borderSide:
                                          BorderSide(color: appBarColor)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  filled: true,
                                  // fillColor: mainBackgroundColor,

                                  labelText: "Age",
                                  labelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  prefixIcon: const Icon(Icons.hub_outlined),
                                  prefixIconColor: Colors.white),
                            )),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                enabled: false,
                                controller: cubit.mbi,
                                decoration: InputDecoration(

                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(200.0)),
                                        borderSide:
                                            BorderSide(color: appBarColor)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(200.0)),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    filled: true,
                                    // fillColor: mainBackgroundColor,

                                    labelText: "MBI",
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    prefixIcon: const Icon(Icons.boy_outlined),
                                    prefixIconColor: Colors.white),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            const Spacer(),
                            Container(
                              width: 180,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,

                                      side: BorderSide(
                                          width: 1, color: appBarColor),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(200)),
                                      shadowColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    cubit.resetSharePref();
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Logout",
                                    style: TextStyle(
                                        color: Color(0xFFFFFAF0D7),
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
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
