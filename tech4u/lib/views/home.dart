import 'package:flutter/material.dart';
import 'package:tech4u/components/my_clip_path.dart';
import 'package:tech4u/components/my_drawer.dart';
import 'package:tech4u/components/share/bottom_navbar.dart';
import 'package:tech4u/models/color_models.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          "Tech4U",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        elevation: 0,
      ),
      drawer: const Padding(
        padding: EdgeInsets.only(right: 100),
        child: Drawer(
          width: double.infinity,
          backgroundColor: secondaryColor,
          child: MyDrawer(),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: MyClipPath(),
                child: Container(
                  color: appBarColor,
                  height: 400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Open-Source",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Free Resources",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          // color: primaryColor,
                          image: DecorationImage(
                            image: AssetImage('assets/hero_section.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
