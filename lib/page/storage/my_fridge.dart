import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/freezer_bloc.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pantry_saver_fe/bloc/login_bloc.dart';
import 'package:pantry_saver_fe/bloc/user_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/items.dart';
import 'package:pantry_saver_fe/page/Login/login.dart';
import 'package:pantry_saver_fe/page/edit_profile.dart';
import 'package:pantry_saver_fe/utils/button_border_widget.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/item_type_widget.dart';
import 'package:pantry_saver_fe/utils/numbers_widget.dart';
import 'package:pantry_saver_fe/utils/profile_widget.dart';
import 'package:pantry_saver_fe/home_widget.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/utils/storage_items_widget.dart';
import 'package:pantry_saver_fe/utils/textfield_item_widget.dart';
import 'package:pantry_saver_fe/utils/textfield_widget.dart';
import 'package:pantry_saver_fe/utils/user_preferences.dart';

import '../profile.dart';

class MyFridgePage extends StatefulWidget {
  @override
  _FridgePageState createState() => _FridgePageState();
}

class _FridgePageState extends State<MyFridgePage> {
  late FreezerBloc _bloc;
  late ItemModel items;

  @override
  void initState() {
    super.initState();
    _bloc = FreezerBloc();
  }

  void _updateKg(int id, double kg) async {
    final response = await _bloc.updateKgReturnModel(id, kg);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            // padding: EdgeInsets.symmetric(horizontal: 13),
            physics: BouncingScrollPhysics(),
            children: [
              FutureBuilder(
                  future: _bloc.fetchItem(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ItemModel>?> snapshot) {
                    if (snapshot.hasData) {
                      List<ItemModel> items = snapshot.data!;
                      print("masyuk");
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(items[index].name),
                          );
                        },
                      );
                    } else if (!snapshot.hasData) {
                      print('ElseIF');
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(greenPrimary),
                        ),
                      );
                    }
                    return Container();
                  }),
              ElevatedButton(
                  onPressed: () {
                    _bloc.fetchItemDetail();
                  },
                  child: Text('Tst')),
              ElevatedButton(
                  onPressed: () {
                    _updateKg(1, 10.0);
                  },
                  child: Text('Update Kg')
              ),
              ElevatedButton(
                  onPressed: () {
                    _updateKg(1, 10.0);
                  },
                  child: Text('Update Kg')
              ),
              // FutureBuilder(
              //     future: _bloc.updateKgReturnModel(id,  kg),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<List<ItemModel>?> snapshot) {
              //       if (snapshot.hasData) {
              //         print(snapshot.data);
              //        // List<ItemModel> items = snapshot.data!;
              //         //print("masyuk");
              //         return Container();
              //           //shrinkWrap: true,
              //           //itemCount: items.length,
              //           //itemBuilder: (context, index) {
              //         //     return ListTile(
              //         //       title: Text(items[index].name),
              //         //     );
              //         //   },
              //         // );
              //       } else if (!snapshot.hasData) {
              //         print('ElseIF');
              //         return Center(
              //           child: CircularProgressIndicator(
              //             valueColor:
              //             AlwaysStoppedAnimation<Color>(greenPrimary),
              //           ),
              //         );
              //       }
              //       return Container();
              //     }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: doubleSpace, right: 0, top: doubleSpace),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://static.wikia.nocookie.net/disney/images/f/f0/Profile_-_Jiminy_Cricket.jpeg/revision/latest?cb=20190312063605'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 33,
                      width: 301,
                      margin: EdgeInsets.only(
                          left: doubleSpace,
                          right: doubleSpace,
                          top: doubleSpace),
                      decoration: BoxDecoration(
                        border: Border.all(color: greenPrimary),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: greenPrimary,
                            size: 25,
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          labelText: 'Chicken, Rice, Lettuce',
                          labelStyle: TextStyle(
                            color: orangePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              Container(
                //Orange Cardddd
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0)),
                    color: orangeCard,
                    boxShadow: [
                      BoxShadow(
                        color: blackboxShadow,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )
                    ]),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "My Fridge",
                                style: TextStyle(
                                    fontSize: 29, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Here, we can give a brief description of what the Fridge page is, as well as the parameters of the items",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder(
                        future: _bloc.fetchItem(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<ItemModel>?> snapshot) {
                          if (snapshot.hasData) {
                            List<ItemModel> items = snapshot.data!;
                            print("masyuk");
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.white,
                                  elevation: 4.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0))),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      children: <Widget>[
                                        ListBody(
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0,
                                                          top: 8,
                                                          bottom: 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        items[index].name,
                                                        style: TextStyle(
                                                            color: greenPrimary,
                                                            fontSize: 22),
                                                      ),
                                                      Text(
                                                          "Expires in ${items[index].expiry_countdown_in_days} day(s)",
                                                          style: TextStyle(
                                                              color:
                                                                  greyPrimary,
                                                              fontSize: 13))
                                                    ],
                                                  ),
                                                )),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 32),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: ItemFieldWidget(
                                                        text: "",
                                                        onChanged: (item) =>
                                                            () {}),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (!snapshot.hasData) {
                            print('ElseIF');
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(greenPrimary),
                              ),
                            );
                          }
                          return Container();
                        }),
                    ElevatedButton(
                        onPressed: () {
                          _bloc.fetchItemDetail();
                        },
                        child: Text('Tst')),
                    // StorageItemWidget(
                    //     text: "", onChanged: (name) => {}, onClicked: () {}),
                    const SizedBox(height: 45),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(child: editButton()),
                          ],
                        ))
                  ],
                ),
              ), //Orange Card
            ],
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

  Widget _createFridgePage() =>
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

  Widget editButton() => ButtonWidget(
        text: 'Edit',
        onClicked: () {},
      );

// @override
// void dispose() {
//   _bloc.dispose();
//   super.dispose();
// }
}
