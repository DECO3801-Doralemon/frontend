import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/freezer_bloc.dart';
import 'package:pantry_saver_fe/bloc/fridge_bloc.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pantry_saver_fe/bloc/login_bloc.dart';
import 'package:pantry_saver_fe/bloc/user_bloc.dart';
import 'package:pantry_saver_fe/component/appbar_widget.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/items.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/item_type_widget.dart';
import 'package:pantry_saver_fe/utils/storage_button_widget.dart';
import 'package:pantry_saver_fe/utils/textfield_item_widget.dart';

class MyFridgePage extends StatefulWidget {
  @override
  _FridgePageState createState() => _FridgePageState();
}

class _FridgePageState extends State<MyFridgePage> {
  late FridgeBloc _bloc;
  late ItemModel items;
  late List<ItemModel> listItemModel;

  @override
  void initState() {
    super.initState();
    _bloc = FridgeBloc();
  }

  void _updateKg() async {
    for (var item in listItemModel) {
      var id = item.id;
      var kg = item.kg;
      final response = await _bloc.updateKgReturnModel(id, kg);
      print(response);
    }

    final r = await _bloc.fetchItem();
    print("''''''''''''''''''");
    print(r?[1].kg);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyFridgePage()),
      (Route<dynamic> route) => false,
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Scaffold(
          resizeToAvoidBottomInset: false,
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
                      listItemModel = snapshot.data!;
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
              // ElevatedButton(
              //     onPressed: () {
              //       _bloc.fetchItemDetail();
              //     },
              //     child: Text('Tst')),

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
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(25.0),
                        child: SingleChildScrollView(
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
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
                                return Dismissible(
                                  key: Key(items.toString()),
                                  background: Container(color: Colors.red),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction) {
                                    setState(() {
                                      _bloc.deleteItem(items[index].id);
                                      items.removeAt(index);
                                    });
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text("$items dismissed")));
                                  },
                                  child: Card(
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
                                                              color:
                                                                  greenPrimary,
                                                              fontSize: 22),
                                                        ),
                                                        Text(
                                                            "Expires in ${items[index].expiry_countdown_in_days} day(s)",
                                                            style: TextStyle(
                                                                color:
                                                                    greyPrimary,
                                                                fontSize: 13)),
                                                      ],
                                                    ),
                                                  )),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Row(
                                                        children: [
                                                          ItemFieldWidget(
                                                              text:
                                                                  "${items[index].kg}",
                                                              onChanged:
                                                                  (item) {
                                                                listItemModel[
                                                                            index]
                                                                        .kg =
                                                                    double.parse(
                                                                        item);
                                                              }),
                                                          Text(" kg(s)",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color:
                                                                      orangePrimary))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
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
                    // ElevatedButton(
                    //     onPressed: () {
                    //       _bloc.fetchItemDetail();
                    //     },
                    //     child: Text('Tst')),
                    // StorageItemWidget(
                    //     text: "", onChanged: (name) => {}, onClicked: () {}),
                    const SizedBox(height: 10),
                    Text("Tip: Swipe left to remove item",
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 45),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(child: saveButton()),
                          ],
                        )),
                    const SizedBox(height: 45),
                  ],
                ),
              ), //Orange Card
            ],
          ),
        ),
      ),
    );
  }

  Widget saveButton() => StorageButtonWidget(
        text: 'Update Amount',
        onClicked: () {
          _updateKg();
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (context) => MyFreezerPage()),
          //   (Route<dynamic> route) => false,
          // );
        },
      );

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
