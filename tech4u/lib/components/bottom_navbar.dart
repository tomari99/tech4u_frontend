import 'package:flutter/material.dart';
import 'package:tech4u/controllers/drawer_menu_list.dart';
import 'package:tech4u/models/color_models.dart';
import 'package:tech4u/pages/community_feed.dart';
import 'package:tech4u/pages/home.dart';
import 'package:tech4u/pages/profile.dart';
import 'package:tech4u/pages/udemy_daily.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIdx = 0;
  List<Widget> screens = const [
    Home(),
    UdemyDaily(),
    // CommunityFeed(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIdx],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        currentIndex: _currentIdx,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        // unselectedLabelStyle: const TextStyle(color: Colors.black),
        // fixedColor: primaryColor,
        onTap: (int idx) {
          setState(() {
            _currentIdx = idx;
          });
        },
        items: DrawerMenuList.menuList.map((menu) {
          return BottomNavigationBarItem(
            icon: Icon(menu.menuIcon),
            label: menu.menuName,
          );
        }).toList(),
      ),
    );
  }
}
