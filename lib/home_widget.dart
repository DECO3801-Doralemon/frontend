import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/component/fab_bottom_app_bar.dart';
import 'package:pantry_saver_fe/page/dummyPage.dart';
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
          FABBottomAppBarItem(iconData: Icons.fastfood, text: 'Recipe'),
          FABBottomAppBarItem(iconData: Icons.people_alt, text: 'Community'),
        ],
      ),
      body: IndexedStack(
        children: <Widget>[
          //List of Navbar Page, place it orderly based on Navbar
          Dummy(),
          Shopping(),
          Dummy(),
          Dummy(),
        ],
        index: _indSelected,
      ),
    );
  }

}
