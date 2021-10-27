import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/component/fab_bottom_app_bar.dart';
import 'package:pantry_saver_fe/page/Community/community.dart';
import 'package:pantry_saver_fe/page/dummyPage.dart';
import 'package:pantry_saver_fe/page/mealplanner/mealplanner.dart';
import 'package:pantry_saver_fe/page/qr_scanner.dart';
import 'package:pantry_saver_fe/page/shopping/shopping.dart';
import 'package:pantry_saver_fe/page/storage/storage.dart';

import 'config/styles.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  String _lastSelected = 'TAB: 0';
  int _indSelected = 0;

  //List of Navbar Page, place it orderly based on Navbar
  List<Widget> _children = [
    Dummy(),
    Shopping(),
    MealPlanner(),
    CommunityPage(),
  ];

  void _selectedTab(int index) {
    setState(() {
      _indSelected = index;
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  @override
  void iniState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => QRViewExample(),));
          },
        tooltip: '',
        child: Icon(IconData(0xe4f7, fontFamily: "MaterialIcons")),
        elevation: 2.0,
        backgroundColor: kPrimaryLightColor,
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Scan',
        color: Colors.grey,
        selectedColor: kPrimaryLightColor,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.storage, text: 'Storage'),
          FABBottomAppBarItem(iconData: Icons.shopping_cart, text: 'Shopping'),
          FABBottomAppBarItem(iconData: Icons.fastfood, text: 'Meal Planner'),
          FABBottomAppBarItem(iconData: Icons.people_alt, text: 'Community'),
        ],
      ),
      body: /*IndexedStack(
        children: <Widget>[
          //List of Navbar Page, place it orderly based on Navbar
          Dummy(),
          Shopping(),
          MealPlanner(),
          CommunityPage(),
        ],
        index: _indSelected,
      ),*/
      _children[_indSelected],
    );
  }
}
