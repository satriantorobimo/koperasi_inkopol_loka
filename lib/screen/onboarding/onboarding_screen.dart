import 'package:flutter/material.dart';
import 'package:loka_apps/screen/login/login_screen.dart';
import 'package:loka_apps/util/color_swatch.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/imgs/logo-inkopol.png',
              width: MediaQuery.of(context).size.width * 0.3,
            )),
            SizedBox(height: 8),
            Text('LOKA', style: TextStyle(fontSize: 25, color: Colors.black)),
            Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                top: 16.0,
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
              width: 300,
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
                  color: ColorsSwatch.awsomeBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
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
