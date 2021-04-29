import 'package:flutter/material.dart';

class DetailNotifikasiScreen extends StatefulWidget {
  @override
  _DetailNotifikasiScreenState createState() => _DetailNotifikasiScreenState();
}

class _DetailNotifikasiScreenState extends State<DetailNotifikasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee4eb),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
