import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loka_apps/bloc/profile/bloc.dart';
import 'package:loka_apps/function/shared_pref.dart';
import 'package:loka_apps/repo/profile/profile_repo.dart';
import 'package:loka_apps/screen/home/home_screen.dart';
import 'package:loka_apps/screen/notifikasi/notifikai_screen.dart';
import 'package:loka_apps/screen/profile/profile_screen.dart';
import 'package:loka_apps/screen/transaksi/transaksi_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavbarScreenState();
  }
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProfileBloc profileBloc = ProfileBloc(profileRepository: ProfileRepository());
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    TransaksiScreen(),
    ProfileScreen()
  ];

  @override
  void initState() {
    SharedPref().getSharedString('token').then((value) {
      if (value != null) {
        profileBloc.add(GetProfile(value));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    profileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee4eb),
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: BlocListener<ProfileBloc, ProfileState>(
                cubit: profileBloc,
                listener: (_, ProfileState state) {
                  if (state is ProfileLoading) {}
                  if (state is ProfileLoaded) {}
                  if (state is ProfileError) {}
                },
                child: BlocBuilder<ProfileBloc, ProfileState>(
                    cubit: profileBloc,
                    builder: (_, ProfileState state) {
                      if (state is ProfileInitial) {
                        return Container();
                      }
                      if (state is ProfileLoading) {
                        return Container();
                      }
                      if (state is ProfileLoaded) {
                        return Image.network(
                            state.responseProfileModel.data.company.logo);
                      }
                      if (state is ProfileError) {
                        return Container();
                      }
                      return Container();
                    }))),
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NotifikasiScreen()),
              );
            },
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
