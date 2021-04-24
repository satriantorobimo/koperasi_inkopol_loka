import 'package:flutter/material.dart';
import 'package:loka_apps/screen/home/home_screen.dart';
import 'package:loka_apps/screen/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOKA',
      theme: ThemeData(
          backgroundColor: Color(0xffe7e9f0),
          fontFamily: 'Raleway',
          primaryColor: Color(0xFF93C48B)),
      home: SplashScreen(),
    );
  }
}
