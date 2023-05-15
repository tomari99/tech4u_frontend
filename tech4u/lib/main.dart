import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech4u/api/models/user_model.dart';
import 'package:tech4u/components/bottom_navbar.dart';
import 'package:tech4u/pages/home.dart';
import 'package:tech4u/providers/user_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
