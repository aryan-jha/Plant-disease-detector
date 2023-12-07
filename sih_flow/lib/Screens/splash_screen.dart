import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sih_flow/Screens/logo_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, LogoScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          height: double.infinity,
          width: double.infinity,
          image: AssetImage("assets/images/logo.jpg"),
        ),
      ),
    );
  }
}