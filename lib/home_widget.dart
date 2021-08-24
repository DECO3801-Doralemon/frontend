import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text ('Testing Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _bottomNavigationBarItem( Icons.storage, 'Storage'),
          _bottomNavigationBarItem( Icons.shopping_cart, 'Shopping'),
          _bottomNavigationBarItem( Icons.emoji_food_beverage, 'Meal'),
          _bottomNavigationBarItem( Icons.people, 'Community'),
          _bottomNavigationBarItem( Icons.person, 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      activeIcon: _navItemIcon(icon, label, Colors.red, Colors.white),
      icon: _navItemIcon(icon, label, Color(0xff3b3c58), Colors.grey),
      title: Padding(padding: EdgeInsets.all(0)),
    );
  }

  Row _navItemIcon(IconData icon, String label, Color? backgroundColor,
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
  }

}