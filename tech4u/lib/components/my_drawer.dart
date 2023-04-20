import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tech4u/controllers/drawer_menu_list.dart';
import 'package:tech4u/models/color_models.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80), color: appBarColor),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "User Name",
          style: TextStyle(fontSize: 20, color: appBarColor),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: DrawerMenuList.menuList.map((menu) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => menu.screen,
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: appBarColor, width: 2),
                    ),
                    leading: Icon(menu.menuIcon, size: 30),
                    title: Text(
                      menu.menuName,
                      style: const TextStyle(fontSize: 20, color: appBarColor),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
