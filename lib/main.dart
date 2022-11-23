import 'package:flutter/material.dart';
import 'package:apk_1/splash/splashscreen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "User Profile",
      home: SplashScreenPage(),
    );
  }
}
