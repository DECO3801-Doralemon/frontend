import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/component/fab_bottom_app_bar.dart';

import 'config/styles.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
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
      appBar: AppBar(title: Text ('Home Page (Temp)'),
        backgroundColor: kPrimaryColor,
      ),
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
    );
  }


  /*BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      activeIcon: _navItemIcon(icon, label, Colors.red, Colors.white),
      icon: _navItemIcon(icon, label, Color(0xff3b3c58), Colors.grey),
      title: Padding(padding: EdgeInsets.all(0)),
    );
  }*/

  /*Row _navItemIcon(IconData icon, String label, Color? backgroundColor,
      Color? foregroundColor) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: foregroundColor,
                  ),
                  Text(
                    label,
                    style: TextStyle(color: foregroundColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }*/

}