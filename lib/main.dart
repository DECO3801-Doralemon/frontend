// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pantry Saver',
//       home: Home(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/home_widget.dart';
import 'package:pantry_saver_fe/page/Welcome/welcome_screen.dart';
import 'package:pantry_saver_fe/get_it.dart';

import 'flavor/flavor.dart';


Future main() async {
  final _getIt = AppGetIt();
  _getIt.initialize();
  ApiFlavor.flavor = BuildFlavor.production.toString();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final user = UserPreferences.getUser();
    return MaterialApp(
      title: 'Pantry Saver',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
