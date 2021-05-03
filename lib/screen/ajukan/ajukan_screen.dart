import 'package:flutter/material.dart';

class AjukanScreen extends StatefulWidget {
  @override
  _AjukanScreenState createState() => _AjukanScreenState();
}

class _AjukanScreenState extends State<AjukanScreen> {
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
        title: Text(
          'Loka',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(16)),
    );
  }
}
