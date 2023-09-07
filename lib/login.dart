import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iclub/HomeScreen.dart';
import 'package:iclub/app.cubit/cubit_App.dart';
import 'package:iclub/app.cubit/states.dart';
import 'app.cubit/app_colors.dart';

import 'signUp.dart';



class Login extends StatelessWidget {
  Login({super.key});

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Feed Me",style:
                  TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(
                  width: 5,
                ),
                Image.asset('icons/header.png'),
              ],
            ),
            centerTitle: true,
            backgroundColor:appBarColor,
          ),
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/OIP.jpeg"), // Replace with your image path
                fit: BoxFit.cover, // You can adjust the fit to your preference
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "LogIn",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: cubit.email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email required';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration:
                              InputDecoration(
                                  labelStyle:
                              const TextStyle(color: Colors.black),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(200.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 2.0)),
                                  prefixIcon: Icon(Icons.email,color: Colors.black,),
                                  labelText: "Enter your email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(200))),


                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: cubit.password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password required';
                                }

                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelStyle:
                                const TextStyle(color: Colors.black),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(200.0)),
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 2.0)),
                                prefixIcon: Icon(Icons.lock,color: Colors.black),

                                labelText: "Enter your Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(200)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(

                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    side: BorderSide(
                                        width: 1, color: appBarColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(200)),
                                    shadowColor: Colors.white),
                                onPressed: ()  async {
                                  if (formKey.currentState!.validate()) {
                                    cubit.checkUserFound();
                                    if(cubit.isUserFound)
                                    {

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  HomeScreen()));
                                    }


                                  }


                                },
                                child: Text("Login",style: TextStyle(color:Color(0xFFFFFAF0D7) ,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Don't Have Account?"),
                                    GestureDetector(

                                      onTap: () {
                                        cubit.clearAllTextInput();

                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SignUp()));
                                      },
                                      child: const Text(
                                        "  Sign Up",
                                        style: TextStyle(
                                            color: Color(0xFFFFFAF0D7),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                )),
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
