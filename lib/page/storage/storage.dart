import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pantry_saver_fe/bloc/login_bloc.dart';
import 'package:pantry_saver_fe/bloc/user_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_storage_green.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/page/Login/login.dart';
import 'package:pantry_saver_fe/page/edit_profile.dart';
import 'package:pantry_saver_fe/page/storage/my_freezer.dart';
import 'package:pantry_saver_fe/page/storage/my_fridge.dart';
import 'package:pantry_saver_fe/page/storage/my_pantry.dart';
import 'package:pantry_saver_fe/utils/button_border_widget.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/item_type_widget.dart';
import 'package:pantry_saver_fe/utils/numbers_widget.dart';
import 'package:pantry_saver_fe/utils/profile_widget.dart';
import 'package:pantry_saver_fe/home_widget.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/utils/textfield_widget.dart';
import 'package:pantry_saver_fe/utils/user_preferences.dart';

import '../profile.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  late UserBloc _bloc;
  late UserModel user;

  @override
  void initState() {
    super.initState();
    _bloc = UserBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Scaffold(
          appBar: storageGreenAppBar(context),
          body: SizedBox.expand(
            child: Container(
              color: orangeCard,
              child: ListView(
                // padding: EdgeInsets.symmetric(horizontal: 13),
                physics: BouncingScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: FittedBox(
                                  child:
                                      Image.asset('assets/images/storage1.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: AssetImage(
                                          'assets/images/facebook-default-no-profile-pic.jpg'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                  Text(
                                    "My Profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 55, horizontal: 65),
                              child: Text(
                                "Welcome to Storage!. Here, you can place all your items or foods in : Freezer, Fridge and Pantry. ",
                                style: TextStyle(
                                    fontSize: 21, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 214),
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 60),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MyFreezerPage()),
                                );
                              },
                              child: Card(
                                color: orangeCard,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30.0))),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: <Widget>[
                                      ListBody(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "My Freezer",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 26),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        left: 10,
                                                        right: 10),
                                                    child: Text(
                                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15)),
                                                  )
                                                ],
                                              )),
                                              Expanded(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: orangePrimary,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30.0),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          30.0))),
                                                      child: buildImage(
                                                          imagePath:
                                                              'assets/images/frozen_meat.jpg')))
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 13),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MyFridgePage()),
                                );
                              },
                              child: Card(
                                color: orangeCard,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30.0))),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: <Widget>[
                                      ListBody(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "My Fridge",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 26),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        left: 10,
                                                        right: 10),
                                                    child: Text(
                                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15)),
                                                  )
                                                ],
                                              )),
                                              Expanded(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: orangePrimary,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30.0),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          30.0))),
                                                      child: buildImage(
                                                          imagePath:
                                                              'assets/images/kulkas_2.jpg')))
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 13),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MyPantryPage()),
                                );
                              },
                              child: Card(
                                color: orangeCard,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30.0))),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: <Widget>[
                                      ListBody(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "My Pantry",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 26),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5,
                                                        left: 10,
                                                        right: 10),
                                                    child: Text(
                                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15)),
                                                  )
                                                ],
                                              )),
                                              Expanded(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: orangePrimary,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30.0),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                          30.0))),
                                                      child: buildImage(
                                                          imagePath:
                                                              'assets/images/pantry_2.jpg')))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(height: ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage({imagePath}) {
    final image = AssetImage(imagePath);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.fill,
            width: 177,
            height: 160,
            // child: InkWell(onTap: onClicked),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
