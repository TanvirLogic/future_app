import 'package:flutter/material.dart';
import 'package:future_app/Screens/main_nav_bar_holder_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavBarHolderScreen(),
    );
  }
}
