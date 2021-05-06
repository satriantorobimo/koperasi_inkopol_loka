import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loka_apps/bloc/profile/bloc.dart';
import 'package:loka_apps/function/shared_pref.dart';
import 'package:loka_apps/repo/profile/profile_repo.dart';
import 'package:loka_apps/screen/login/login_screen.dart';
import 'package:loka_apps/util/color_swatch.dart';
import 'package:loka_apps/model/profile/response_profile_model.dart';
import 'package:loka_apps/util/custom_loader.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc profileBloc = ProfileBloc(profileRepository: ProfileRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();
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
    return BlocListener<ProfileBloc, ProfileState>(
        cubit: profileBloc,
        listener: (_, ProfileState state) {
          if (state is ProfileLoading) {
            LoaderDialogs.showLoadingDialog(context, _keyLoader);
          }
          if (state is ProfileLoaded) {}
          if (state is ProfileError) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false);
          }
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
                return _mainContent(state.responseProfileModel);
              }
              if (state is ProfileError) {
                return Container();
              }
              return Container();
            }));
  }

  Widget _mainContent(ResponseProfileModel responseProfileModel) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Center(
                child: Text(responseProfileModel.data.fullname,
                    style: TextStyle(fontSize: 22, color: Colors.black))),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Lengkap',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(responseProfileModel.data.fullname,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Nama Company',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(responseProfileModel.data.company.name,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Phone',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(responseProfileModel.data.phone,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Email',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(responseProfileModel.data.email,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Status Pegawai',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(responseProfileModel.data.status_employee,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Tanggal Menjadi Pegawai',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(responseProfileModel.data.date_employee,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Bank Name',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(responseProfileModel.data.bank,
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('Bank Account',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(responseProfileModel.data.bank_account ?? '-',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  SizedBox(height: 16),
                  Text('NIK',
                      style: TextStyle(fontSize: 13, color: Colors.grey)),
                  SizedBox(height: 4),
                  Text(responseProfileModel.data.nik,
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
                  SharedPref().clearSharedPref();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false);
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
  final urlPhoto;

  const AvatarWidget(this.urlPhoto);
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
              image: NetworkImage(urlPhoto),
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
