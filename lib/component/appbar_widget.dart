import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    //AppBar with NO SHADOW
    // centerTitle: true,
    // leading: BackButton(color: Colors.white),
    // backgroundColor: greenPrimary,
    // elevation: 0,
    // actions: [],
    // title: Text("Profile"),

    //AppBar with minor shadow
    backgroundColor: greenPrimary,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: () {},
      // onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(
      "Profile",
      style: TextStyle(color: Colors.white, fontFamily: 'BalsamiqSans'),
    ),
    centerTitle: true,
  );
}

// https://stackoverflow.com/questions/51508257/how-to-change-the-appbar-back-button-color

//Or if you want to handle the back button by yourself.
//
// appBar: AppBar(
//   leading: IconButton(
//     icon: Icon(Icons.arrow_back, color: Colors.black),
//     onPressed: () => Navigator.of(context).pop(),
//   ),
//   title: Text("Sample"),
//   centerTitle: true,
// ),
