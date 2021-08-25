// import 'package:bisaGo/bloc/user_bloc.dart';
// import 'package:bisaGo/component/bisago_appbar.dart';
// import 'package:bisaGo/config/styles.dart';
// import 'package:bisaGo/model/user.dart';
// import 'package:bisaGo/page/profile/edit_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/utils/button_border_widget.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/numbers_widget.dart';
import 'package:pantry_saver_fe/utils/profile_widget.dart';
import 'package:pantry_saver_fe/home_widget.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/utils/user_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 45),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),

          buildAbout(user),
          const SizedBox(height: 24),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                editProfileButton(),
                changePasswordButton(),
              ],
            ),
          ),
          const SizedBox(height: 38),

          //THIS BUTTON HAS NOT YET BEEN ADDED ANY SHADOWS
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Expanded(child: logoutButton()),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Text(
          //   "FONT TEST",
          //   style: TextStyle(fontFamily: 'BalsamiqSans', fontSize: 50),
          // ),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: orangePrimary),
          ),
          const SizedBox(height: 4),
          Container(
            margin: new EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${user.followers} followers", //MUST BE REPLACED WITH user.followers
                      style: TextStyle(color: greyPrimary, fontSize: 15),
                    ),
                    Text(
                      "${user.likes} likes",
                      style: TextStyle(color: greyPrimary, fontSize: 15),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${user.waste_percentage} %",
                          style: TextStyle(
                              color: orangePrimary,
                              fontSize: 26,
                              fontWeight: FontWeight
                                  .bold)), //MUST BE REPLACED WITH user.waste_percentage
                      Text(
                        "waste percentage",
                        style: TextStyle(color: greyPrimary, fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bio',
              style: TextStyle(fontSize: 24, color: blackPrimary),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4, color: greyPrimary),
            ),
            const SizedBox(height: 16),
            Text(
              'Email',
              style: TextStyle(fontSize: 24, color: blackPrimary),
            ),
            const SizedBox(height: 16),
            Text(
              user.email,
              style: TextStyle(fontSize: 16, height: 1.4, color: greyPrimary),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );

  Widget editProfileButton() => ButtonWidget(
        text: 'Edit Profile',
        onClicked: () {},
      );

  Widget changePasswordButton() => ButtonWidget(
        text: 'Password',
        onClicked: () {},
      );

  Widget logoutButton() => ButtonBorderWidget(
        text: 'Log out',
        onClicked: () {},
      );
}