import 'package:flutter/material.dart';
import 'package:loka_apps/screen/home/home_screen.dart';
import 'package:loka_apps/screen/profile/profile_screen.dart';
import 'package:loka_apps/screen/transaction/transaction_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavbarScreenState();
  }
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    TransactionScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee4eb),
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'LOKA',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Container(
              height: 21,
              width: 21,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment), label: 'Transaksi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil')
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
