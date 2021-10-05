import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/page/profile.dart';
import 'package:pantry_saver_fe/page/profile.dart';
import 'package:pantry_saver_fe/page/storage/my_fridge.dart';
import 'package:pantry_saver_fe/page/storage/storage.dart';
import 'package:pantry_saver_fe/utils/user_preferences.dart';
import 'package:pantry_saver_fe/page/Login/login.dart';


class PantrySaver extends StatelessWidget {
  // static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: orangePrimary,
          dividerColor: Colors.black,
          fontFamily: 'BalsamiqSans'),
      title: 'PantrySaver',
      home: Login(),
    );
  }
}
