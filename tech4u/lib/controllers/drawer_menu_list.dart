import 'package:flutter/material.dart';
import 'package:tech4u/models/drawer_menu.dart';
import 'package:tech4u/views/community_feed.dart';
import 'package:tech4u/views/home.dart';
import 'package:tech4u/views/profile.dart';
import 'package:tech4u/views/udemy_daily.dart';

class DrawerMenuList {
  static final List<DrawerMenu> menuList = [
    DrawerMenu(
        menuIcon: Icons.home_outlined, menuName: 'Home', screen: const Home()),
    DrawerMenu(
        menuIcon: Icons.category_outlined,
        menuName: 'Udemy Daily',
        screen: const UdemyDaily()),
    DrawerMenu(
        menuIcon: Icons.feed_outlined,
        menuName: 'Community Feed',
        screen: const CommunityFeed()),
    DrawerMenu(
        menuIcon: Icons.person_outline,
        menuName: 'Profile',
        screen: const Profile())
  ];
}
