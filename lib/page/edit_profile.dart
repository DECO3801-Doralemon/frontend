import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/page/profile.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/profile_widget.dart';
import 'package:pantry_saver_fe/utils/textfield_widget.dart';
import 'package:pantry_saver_fe/utils/user_preferences.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    //user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 45),
                ProfileWidget(
                  imagePath:
                      'https://static.wikia.nocookie.net/disney/images/f/f0/Profile_-_Jiminy_Cricket.jpeg/revision/latest?cb=20190312063605', //MUST REPLACE WITH user.imagePath
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'username',
                  text: "user.name", //MUST REMOVE KUTIP
                  onChanged: (name) => {},
                  // onChanged: (name) => user = user.copy(name: name),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'About',
                  text: "user.about", //MUST REMOVE KUTIP
                  maxLines: 5,
                  onChanged: (about) => {},
                  // onChanged: (about) => user = user.copy(about: about),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: "user.email", //MUST REMOVE KUTIP
                  onChanged: (email) => {},
                  // onChanged: (email) => user = user.copy(email: email),
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                    text: 'Confirm',
                    onClicked: () {
                     // UserPreferences.setUser(user);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      ).then((value) => setState(() {}));
                    }),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );
}
