import 'package:flutter/material.dart';
import 'package:loka_apps/screen/login/login_screen.dart';
import 'package:loka_apps/util/color_swatch.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Center(child: AvatarWidget()),
            SizedBox(height: 16),
            Center(
                child: Text('Nama',
                    style: TextStyle(fontSize: 22, color: Colors.black))),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bank Name',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text('BCA',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Bank Account',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text('1234567890',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('NIK',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text('081234567890011',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8),
              height: 50,
              child: RaisedButton(
                color: ColorsSwatch.awsomeBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text("Log Out", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Color(0xFFF0F0F0),
            image: DecorationImage(
              image: AssetImage('assets/imgs/avatar.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
            border: Border.all(
              color: Color(0xFFF0F0F0),
              width: 2.0,
            ),
          ),
        ),
        Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              height: 40,
              width: 40,
              child: Icon(
                Icons.add_a_photo,
                color: Colors.white,
                size: 20,
              ),
              decoration: BoxDecoration(
                  color: ColorsSwatch.softBlue,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ))
      ],
    );
  }
}
