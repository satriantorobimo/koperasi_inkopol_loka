import 'dart:async';

import 'package:loka_apps/api/login/login_api.dart';
import 'package:loka_apps/model/login/response_login_model.dart';

class LoginRepository {
  LoginApiClient loginApiClient = LoginApiClient();

  Future<ResponseLoginModel> loginAttempt(String nik, String password) =>
      loginApiClient.loginAttempt(nik, password);
}
