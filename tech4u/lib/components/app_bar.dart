import 'package:flutter/material.dart';
import 'package:tech4u/models/color_models.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      title: const Text(
        "Tech4U",
        style: TextStyle(fontSize: 35, color: Colors.white),
      ),
      elevation: 0,
    );
  }
}
