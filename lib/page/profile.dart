import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pantry_saver_fe/bloc/login_bloc.dart';
import 'package:pantry_saver_fe/bloc/user_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/page/Login/login.dart';
import 'package:pantry_saver_fe/page/edit_profile.dart';
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
  late UserBloc _bloc;
  late UserModel user;

  @override
  void initState() {
    super.initState();
    // print("test");
    _bloc = UserBloc();
    // _bloc.loginUser("gibran", "gibran").then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    //  final user = UserPreferences.getUser();
    //COMMENTS TO REMOVE OR EDIT
    // url for profile pic: https://painrehabproducts.com/wp-content/uploads/2014/10/facebook-default-no-profile-pic.jpg

    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder(
          future: _bloc.fetchUser(),
          builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
            if (snapshot.hasData) {
              user = snapshot.data!;
              print(user);
              return _createProfilePage();
            }
            // if (snapshot.hasError) {
            //   print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
            //   Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => Login()),
            //   );}
            else if (!snapshot.hasData) {
              print('elseifelseifelsiefsleldhlasldasld');
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(greenPrimary),
                ),
              );
            }
            return Container();
          }),
    );
  }

  Widget buildName(UserModel user) => Column(
        children: [
          Text(
            user.username, //MUST REMOVE KUTIP
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
                      "420", //MUST BE REPLACED WITH ${user.followers} followers
                      style: TextStyle(color: greyPrimary, fontSize: 15),
                    ),
                    Text(
                      "69", //${user.likes} likes
                      style: TextStyle(color: greyPrimary, fontSize: 15),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("32", //"${user.waste_percentage} %",
                          style: TextStyle(
                              color: orangePrimary,
                              fontSize: 26,
                              fontWeight: FontWeight
                                  .bold)), //MUST BE REPLACED WITH user.waste_percentage
                      Text(
                        "waste",
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

  Widget buildAbout(UserModel user) => Container(
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
              user.bio ?? " ", //MUST REMOVE KUTIP
              style: TextStyle(fontSize: 16, height: 1.4, color: greyPrimary),
            ),
            const SizedBox(height: 16),
            Text(
              'Email',
              style: TextStyle(fontSize: 24, color: blackPrimary),
            ),
            const SizedBox(height: 16),
            Text(
              user.email, //MUST REMOVE KUTIP
              style: TextStyle(fontSize: 16, height: 1.4, color: greyPrimary),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );

  Widget editProfileButton() => ButtonWidget(
        text: 'Edit Profile',
        onClicked: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
        },
      );

  Widget changePasswordButton() => ButtonWidget(
        text: 'Password',
        onClicked: () {},
      );

  Widget logoutButton() => ButtonBorderWidget(
        text: 'Log out',
        onClicked: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            content: const Text(
              'Are you sure you want to Log out ?',
              style: TextStyle(fontSize: 24, color: blackPrimary),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20, color: greyPrimary),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text(
                      'Log out',
                      style: TextStyle(fontSize: 20, color: redPrimary),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget _createProfilePage() => ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 45),
          ProfileWidget(
            imagePath:
                'https://static.wikia.nocookie.net/disney/images/f/f0/Profile_-_Jiminy_Cricket.jpeg/revision/latest?cb=20190312063605', //MUST REPLACE WITH user.imagePath
            onClicked: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
              setState(() {});
            },
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
      );

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
