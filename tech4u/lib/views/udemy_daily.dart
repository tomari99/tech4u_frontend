import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tech4u/components/share/bottom_navbar.dart';

class UdemyDaily extends StatelessWidget {
  const UdemyDaily({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: Text("Udemy Daily"),
      ),
    );
  }
}
