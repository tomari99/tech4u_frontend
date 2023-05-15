import 'package:flutter/material.dart';
import 'package:tech4u/models/drawer_menu.dart';
import 'package:tech4u/pages/community_feed.dart';
import 'package:tech4u/pages/home.dart';
import 'package:tech4u/pages/profile.dart';
import 'package:tech4u/pages/udemy_daily.dart';

class DrawerMenuList {
  static final List<DrawerMenu> menuList = [
    DrawerMenu(
        menuIcon: Icons.home_outlined, menuName: 'Home', screen: const Home()),
    DrawerMenu(
        menuIcon: Icons.category_outlined,
        menuName: 'Udemy Daily',
        screen: const UdemyDaily()),
    // DrawerMenu(
    //     menuIcon: Icons.feed_outlined,
    //     menuName: 'Community Feed',
    //     screen: const CommunityFeed()),
    DrawerMenu(
        menuIcon: Icons.person_outline,
        menuName: 'Profile',
        screen: const Profile())
  ];
}
