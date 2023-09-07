import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import 'app.cubit/app_colors.dart';
import 'app.cubit/cubit_App.dart';
import 'app.cubit/states.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        ToastContext().init(context);

        return Scaffold(
          appBar: AppBar(
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
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
                      //  color: appBarColor,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20))),
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            // email
                            TextFormField(

                              controller: cubit.email,
                              decoration:
                              InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200.0)
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0)),
                                  filled: true,
                                //   // fillColor: mainBackgroundColor,






                                  labelText: "Email",
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                  ),border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200)),
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  prefixIconColor: Colors.black),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else {
                                  cubit.userFoundAndCheckPassword();
                                  if (cubit.isUserFound) {
                                    return 'Email is Used Before';
                                  } else if (!value.contains('@gmail.com')) {
                                    return "invalid Email";
                                  }
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // name
                            TextFormField(
                              controller: cubit.name,
                              decoration:
                              InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0)),
                                  border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(200)),
                                  filled: true,
                                  // fillColor: mainBackgroundColor,






                                  labelText: "Name",
                                  labelStyle:
                                  const TextStyle(color: Colors.black),
                                  prefixIcon:
                                  const Icon(Icons.supervised_user_circle),
                                  prefixIconColor: Colors.black),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else {
                                  if (value.length < 2) {
                                    return "Name Must be more than 2 letters";
                                  }
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // password
                            TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: cubit.password,
                              decoration:
                              InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(200)),     filled: true,
                                 //  // fillColor: mainBackgroundColor,






                                  labelText: "Password",
                                  labelStyle:
                                  const TextStyle(color: Colors.black),
                                  prefixIcon: const Icon(Icons.password_outlined),
                                  prefixIconColor: Colors.black),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (value.length < 8) {
                                  return 'at least 8 characters';
                                } else {
                                  try {
                                    int.parse(value);
                                  } catch (e) {
                                    return 'at least 8 characters';
                                  }
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // conform
                            TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: cubit.conformPassword,
                              decoration:
                              InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(200)),     filled: true,
                                   // fillColor: mainBackgroundColor,






                                  labelText: "Conform Password",
                                  labelStyle:
                                  const TextStyle(color: Colors.black),
                                  prefixIcon: const Icon(
                                      Icons.confirmation_number_outlined),
                                  prefixIconColor: Colors.black),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (value != cubit.password.text) {
                                  return 'Passwords Do Not Matches!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // phone
                            TextFormField(
                              controller: cubit.phone,
                              keyboardType: TextInputType.number,
                              decoration:
                              InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(200)),     filled: true,
                                   // fillColor: mainBackgroundColor,






                                  labelText: "Phone",
                                  labelStyle:
                                  const TextStyle(color: Colors.black),
                                  prefixIcon:
                                  const Icon(Icons.phone_enabled_outlined),
                                  prefixIconColor: Colors.black),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                } else if (value.length < 11) {
                                  return 'Invalid Phone';
                                } else {
                                  try {
                                    int.parse(value);
                                  } catch (e) {
                                    return 'Invalid Phone';
                                  }
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 90,
                                  child: Expanded(
                                      child: TextFormField(
                                        controller: cubit.age,
                                        keyboardType: TextInputType.number,
                                        decoration:
                                        InputDecoration(
                                            focusedBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(200.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0)),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(200)),
                                            filled: true,
                                             // fillColor: mainBackgroundColor,






                                            labelText: "Age",
                                            labelStyle: const TextStyle(
                                                color: Colors.black, fontSize: 9.3),
                                            prefixIcon:
                                            const Icon(Icons.hub_outlined),
                                            prefixIconColor: Colors.black),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Required';
                                          } else {
                                            if (int.parse(value) < 10) {
                                              return 'invalid Age';
                                            } else {
                                              try {
                                                int.parse(value);
                                              } catch (e) {
                                                return 'Invalid Phone';
                                              }
                                            }
                                          }
                                          return null;
                                        },
                                      )),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: cubit.weight,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                    InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(200.0)),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(200)),
                                        filled: true,
                                         // fillColor: mainBackgroundColor,






                                        labelText: "Weight",
                                        labelStyle: const TextStyle(
                                            color: Colors.black, fontSize: 9.4),
                                        prefixIcon:
                                        Image.asset('icons/weight.png')),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Required';
                                      } else {
                                        if (int.parse(value) < 10) {
                                          return 'invalid Weight';
                                        } else {
                                          try {
                                            int.parse(value);
                                          } catch (e) {
                                            return 'Invalid Phone';
                                          }
                                        }
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: cubit.height,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                    InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(200.0)),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(200)),
                                        filled: true,
                                         // fillColor: mainBackgroundColor,






                                        labelText: "Height",
                                        labelStyle: const TextStyle(
                                            color: Colors.black, fontSize: 9.6),
                                        prefixIcon:
                                        Image.asset('icons/height.png')),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Required';
                                      } else {
                                        if (int.parse(value) < 10) {
                                          return 'invalid Height';
                                        } else {
                                          try {
                                            int.parse(value);
                                          } catch (e) {
                                            return 'Invalid Phone';
                                          }
                                        }
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            Row(
                              children: [
                                const Spacer(),
                                SizedBox(
                                  width: 130,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.insertUser();
                                        Toast.show("Sign Up Successfully",
                                            duration: 2, gravity: Toast.bottom);
                                        cubit.isSignUpOpened = false;
                                        Navigator.pop(context);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        side: BorderSide(
                                            width: 1,),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(200)),
                                        shadowColor: Colors.black),
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                          color: Color(0xFFFFFAF0D7),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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