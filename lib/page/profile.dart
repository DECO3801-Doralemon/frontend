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
          const SizedBox(height: 24),
          buildAbout(user),
          const SizedBox(height: 24),
          Center(child: editProfileButton()),
          const SizedBox(height: 24),
          Center(child: changePasswordButton()),
          const SizedBox(height: 24),
          Center(child: logoutButton()),
          const SizedBox(height: 24),
          Text(
            "FONT TEST",
            style: TextStyle(fontFamily: 'BalsamiqSans', fontSize: 50),
          ),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                      // user.email,
                      "423 followers", //MUST BE REPLACED WITH user.followers
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "290 likes",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("40%"), //MUST BE REPLACED WITH user.waste_percentage
                      Text("waste percentage")
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );

  // Widget buildUpgradeButton() => ButtonWidget(
  //       text: 'Upgrade To PRO',
  //       onClicked: () {},
  //     );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 16),
            Text(
              'Email',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.email,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 16),
            Text(
              'Avoided Food(s)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.avoided_food,
              style: TextStyle(fontSize: 16, height: 1.4),
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
        text: 'Change Password',
        onClicked: () {},
      );

  Widget logoutButton() => ButtonWidget(
        text: 'Log out',
        onClicked: () {},
      );
}
// class Profile extends StatefulWidget {
//   final String email;
//
//   const Profile({@required this.email, Key key}) : super(key: key);
//   @override
//   _ProfileState createState() => _ProfileState(email);
// }
//
// class _ProfileState extends State<Profile> {
//   UserModel user;
//   String email;
//   UserBloc _bloc;
//   _ProfileState(this.email);
//
//   @override
//   void initState() {
//     super.initState();
//     _bloc = UserBloc(email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         child: Home(
//           title: 'Profile',
//           leading: InkWell(
//               child: Icon(Icons.arrow_back_ios),
//               onTap: () => Navigator.pop(context, 'Take me back')),
//           actions: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: InkWell(
//                 key: Key('Edit User Profile'),
//                 child: Text(
//                   'Edit',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 onTap: () {
//                   _navigateToEditProfile(context);
//                 },
//               ),
//             )
//           ],
//         ),
//         preferredSize: Size.fromHeight(55),
//       ),
//       body: FutureBuilder(
//           future: _bloc.fetchUser(email),
//           builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
//             if (snapshot.hasData) {
//               user = snapshot.data;
//               return _createProfilePage();
//             } else if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
//                 ),
//               );
//             }
//             return Container();
//           }),
//     );
//   }
//
//   Widget _createProfilePage() {
//     final name = user.name;
//     return ListView(
//       children: <Widget>[
//         Stack(
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 Container(
//                   key: Key('Header Profile Page'),
//                   height: MediaQuery.of(context).size.height * .4,
//                   alignment: Alignment.topCenter,
//                   decoration: BoxDecoration(color: Colors.green, boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3),
//                     ),
//                   ]),
//                   padding: EdgeInsets.only(top: 32, left: 32, right: 32),
//                   child: ListView(
//                     children: <Widget>[
//                       Container(
//                         child: CircleAvatar(
//                           radius: 50,
//                         ),
//                         padding: EdgeInsets.only(
//                           bottom: 16,
//                         ),
//                       ),
//                       Text(
//                         'Halo, $name!',
//                         style: TextStyle(
//                           fontSize: 26,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.white,
//                           fontFamily: 'Comfortaa',
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       Text(
//                         user.email,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                           fontFamily: 'Comfortaa',
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               key: Key('Card Profile Page'),
//               alignment: Alignment.topCenter,
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * .32,
//                   left: 32,
//                   right: 32,
//                   bottom: 32),
//               child: Card(
//                 elevation: 4.0,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                   padding:
//                       EdgeInsets.only(top: 27, bottom: 27, left: 27, right: 27),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       ListBody(
//                         children: <Widget>[
//                           ListTile(
//                             leading: Icon(
//                               Icons.calendar_today,
//                               size: 28,
//                               color: Colors.green,
//                             ),
//                             title: Text(
//                               user.tanggalLahir,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                                 fontFamily: 'Comfortaa',
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                           ListTile(
//                             leading: Icon(
//                               Icons.phone,
//                               size: 28,
//                               color: Colors.green,
//                             ),
//                             title: Text(
//                               user.phoneNumber,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                                 fontFamily: 'Comfortaa',
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                           ListTile(
//                             leading: Icon(
//                               MdiIcons.humanMaleFemale,
//                               size: 28,
//                               color: Colors.green,
//                             ),
//                             title: Text(
//                               user.jenisKelamin,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                                 fontFamily: 'Comfortaa',
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                           ListTile(
//                             leading: Icon(
//                               Icons.accessible,
//                               size: 28,
//                               color: Colors.green,
//                             ),
//                             title: Text(
//                               user.disabilitas,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                                 fontFamily: 'Comfortaa',
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                           ListTile(
//                             leading: Icon(
//                               MdiIcons.briefcaseAccount,
//                               size: 28,
//                               color: Colors.green,
//                             ),
//                             title: Text(
//                               user.pekerjaan,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                                 fontFamily: 'Comfortaa',
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                           ListTile(
//                             leading: Icon(
//                               Icons.location_on,
//                               size: 28,
//                               color: Colors.green,
//                             ),
//                             title: Text(
//                               user.alamat,
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black,
//                                 fontFamily: 'Comfortaa',
//                               ),
//                               textAlign: TextAlign.left,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
//
//   void _navigateToEditProfile(BuildContext context) {
//     final route = MaterialPageRoute(builder: (_) => EditProfile(user: user));
//     Navigator.of(context).push(route);
//   }
//
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
// }
