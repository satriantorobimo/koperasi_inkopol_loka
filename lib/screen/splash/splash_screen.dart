import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loka_apps/screen/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/imgs/logo-inkopol.png',
            width: MediaQuery.of(context).size.width * 0.5,
          )),
          SizedBox(height: 24),
          Center(
            child: Text(
              'LOKA',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
