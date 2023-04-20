import 'package:flutter/material.dart';
import 'package:tech4u/controllers/drawer_menu_list.dart';
import 'package:tech4u/models/color_models.dart';
import 'package:tech4u/views/community_feed.dart';
import 'package:tech4u/views/home.dart';
import 'package:tech4u/views/profile.dart';
import 'package:tech4u/views/udemy_daily.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: primaryColor,
      currentIndex: currentIdx,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      // unselectedLabelStyle: const TextStyle(color: Colors.black),
      // fixedColor: primaryColor,
      onTap: (int idx) {
        setState(() {
          currentIdx = idx;
        });

        switch (idx) {
          case 0:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const Home();
              },
            ));
            break;

          case 1:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const UdemyDaily();
              },
            ));
            break;
          case 2:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const CommunityFeed();
              },
            ));
            break;
          case 3:
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const Profile();
              },
            ));
            break;
        }
      },
      items: DrawerMenuList.menuList.map((menu) {
        return BottomNavigationBarItem(
          icon: Icon(menu.menuIcon),
          label: menu.menuName,
        );
      }).toList(),
    );
  }
}
