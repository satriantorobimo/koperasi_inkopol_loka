import 'package:flutter/material.dart';
import 'package:loka_apps/screen/bottom_navbar/bottom_navbar_screen.dart';
import 'package:loka_apps/screen/input_phone_number/input_phone_number_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Color(0xFF93C48B), shape: BoxShape.circle),
                child: Center(
                    child: Text('LOKA',
                        style: TextStyle(fontSize: 25, color: Colors.white)))),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                top: 24.0,
              ),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/imgs/onboarding.png',
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
            Container(
              width: 205,
              child: Text(
                'Ajukan pinjaman dengan rasa Aman tanpa kuatir tidak dapat mengembalikan',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                height: 45,
                child: RaisedButton(
                  color: Color(0xFF93C48B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => InputPhoneNumberScreen()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text("Next", style: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
