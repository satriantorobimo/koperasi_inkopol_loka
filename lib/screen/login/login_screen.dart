import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loka_apps/bloc/login/bloc.dart';
import 'package:loka_apps/function/shared_pref.dart';
import 'package:loka_apps/repo/login/login_repo.dart';
import 'package:loka_apps/screen/bottom_navbar/bottom_navbar_screen.dart';
import 'package:loka_apps/util/color_swatch.dart';
import 'package:loka_apps/util/custom_loader.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _nikController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isError = false, notRegistered = false;
  String errorMessage = '';
  LoginBloc loginBloc = LoginBloc(loginRepository: LoginRepository());
  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 70),
          child: BlocListener<LoginBloc, LoginState>(
              cubit: loginBloc,
              listener: (_, LoginState state) {
                if (state is LoginLoading) {
                  LoaderDialogs.showLoadingDialog(context, _keyLoader);
                }
                if (state is LoginLoaded) {
                  Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                      .pop();
                  SharedPref().savedSharedString(
                      'token', state.ressponseLoginModel.data.token);

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BottomNavbarScreen()),
                      (Route<dynamic> route) => false);
                }
                if (state is LoginError) {
                  Navigator.of(_keyLoader.currentContext, rootNavigator: true)
                      .pop();
                  setState(() {
                    notRegistered = true;
                    errorMessage = state.error;
                  });
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                  cubit: loginBloc,
                  builder: (_, LoginState state) {
                    if (state is LoginInitial) {
                      return _mainContent();
                    }
                    if (state is LoginLoading) {
                      return _mainContent();
                    }
                    if (state is LoginLoaded) {
                      return _mainContent();
                    }
                    if (state is LoginError) {
                      return _mainContent();
                    }
                    return _mainContent();
                  }))),
    );
  }

  Widget _mainContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/imgs/logo-inkopol.png',
            width: MediaQuery.of(context).size.width * 0.3,
          )),
          SizedBox(height: 8),
          Text('LOKA', style: TextStyle(fontSize: 25, color: Colors.black)),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(height: 24),
                Visibility(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('NIK dan Password tidak boleh kosong',
                          style: TextStyle(fontSize: 14, color: Colors.red)),
                    ),
                    visible: isError),
                Visibility(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(errorMessage,
                          style: TextStyle(fontSize: 14, color: Colors.red)),
                    ),
                    visible: notRegistered),
                TextField(
                  autocorrect: true,
                  keyboardType: TextInputType.number,
                  controller: _nikController,
                  decoration: InputDecoration(
                    hintText: 'NIK',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide:
                          BorderSide(color: ColorsSwatch.softBlue, width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide:
                          BorderSide(color: ColorsSwatch.softBlue, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8),
              height: 50,
              child: RaisedButton(
                color: ColorsSwatch.awsomeBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  setState(() {
                    isError = false;
                    notRegistered = false;
                  });
                  if (_passwordController.text.isEmpty &&
                      _nikController.text.isEmpty) {
                    setState(() {
                      isError = true;
                    });
                  } else {
                    loginBloc.add(LoginAttempt(_nikController.text.toString(),
                        _passwordController.text.toString()));
                  }
                },
                child: Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
