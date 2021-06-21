import 'package:flutter/material.dart';
import 'package:aplikasi_antrian/pages/home.dart';
import 'package:aplikasi_antrian/home_app.dart';
import 'dart:async';
import 'home_app.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return HomeApp();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Image.asset(
          "images/1.png",
          width: 1000.0,
          height: 700.0,
        ),
      ),
    );
  }
}
