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
          appBar: buildAppBar(context),
          body: SizedBox.expand(
            child: Container(
              color: orangeCard,
              child: ListView(
                // padding: EdgeInsets.symmetric(horizontal: 13),
                physics: BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 45),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0)),
                          color: Colors.white,
                        ),
                        child: ItemTypeWidget(
                          text: "",
                          imagePath:
                              'https://static.wikia.nocookie.net/disney/images/f/f0/Profile_-_Jiminy_Cricket.jpeg/revision/latest?cb=20190312063605',
                          onChanged: (name) => {},
                          onClicked: () {},
                          // setState(() {});
                        ),
                      ),
                      Positioned(
                        top: -100,
                        left: 0,
                        child: Container(
                          height: 142,
                          width: 295,
                          child: Card(
                            color: Colors.red,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    "Description about the Storage Page, what info does it show, etc.")
                              ],
                            ),
                          ),
                        ),
                      ),
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

// @override
// Widget build(BuildContext context) {
//   //  final user = UserPreferences.getUser();
//   //COMMENTS TO REMOVE OR EDIT
//
//   return Scaffold(
//     appBar: buildAppBar(context),
//     body: FutureBuilder(
//         future: _bloc.fetchUser(),
//         builder: (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
//           if (snapshot.hasData) {
//             user = snapshot.data!;
//             print(user);
//             return _createStoragePage();
//           } else if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(greenPrimary),
//               ),
//             );
//           }
//           return Container();
//         }),
//   );
// }

  Widget _createStoragePage() =>
      ListView(physics: BouncingScrollPhysics(), children: [
        ItemTypeWidget(
            imagePath:
                'https://static.wikia.nocookie.net/disney/images/f/f0/Profile_-_Jiminy_Cricket.jpeg/revision/latest?cb=20190312063605',
            //MUST REPLACE WITH user.imagePath
            // onClicked: () async {
            //   await Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => EditProfilePage()),
            //   );
            //   setState(() {});
            // },
            onClicked: () {},
            text: 'text',
            onChanged: (String value) {}),
      ]);

// Widget editProfileButton() => ButtonWidget(
//       text: 'Edit Profile',
//       onClicked: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => EditProfilePage()),
//         );
//       },
//     );

// Widget logoutButton() => ButtonBorderWidget(
//       text: 'Log out',
//       onClicked: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(32.0))),
//           content: const Text(
//             'Are you sure you want to Log out ?',
//             style: TextStyle(fontSize: 24, color: blackPrimary),
//             textAlign: TextAlign.center,
//           ),
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context, 'Cancel'),
//                   child: const Text(
//                     'Cancel',
//                     style: TextStyle(fontSize: 20, color: greyPrimary),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () => Navigator.pop(context, 'OK'),
//                   child: const Text(
//                     'Log out',
//                     style: TextStyle(fontSize: 20, color: redPrimary),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );

// @override
// void dispose() {
//   _bloc.dispose();
//   super.dispose();
// }
}
