import 'package:flutter/material.dart';
import 'package:apk_1/view/login/login_view.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return const LoginPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 92, 148),
      body: Center(
        child: Image.asset("lib/assets/images/logo.png",
            width: 400.0, height: 300.0),
      ),
    );
  }
}
