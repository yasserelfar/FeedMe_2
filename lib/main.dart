import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iclub/app.cubit/cubit_App.dart';
import 'package:iclub/login.dart';




void main() {
  runApp( FeedMe());
}

class FeedMe extends StatelessWidget {
   FeedMe({super.key});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Login()
      ),
    );
  }
}

