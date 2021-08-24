import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/Screens/Welcome/welcome_screen.dart';
import 'package:pantry_saver_fe/constants.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantry Saver',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

