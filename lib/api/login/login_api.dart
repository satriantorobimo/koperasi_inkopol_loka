import 'dart:convert';
import 'package:loka_apps/function/network_util.dart';
import 'package:loka_apps/model/login/response_login_model.dart';
import 'package:loka_apps/util/url_string.dart';

class LoginApiClient {
  ResponseLoginModel responseLoginModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<ResponseLoginModel> loginAttempt(String nik, String password) async {
    final Map<String, String> header = urlString.getHeaderType();
    final Map mapData = {};
    mapData['nik'] = nik;
    mapData['password'] = password;
    final String _json = jsonEncode(mapData);
    return await netUtil
        .post(urlString.getUrlLogin(), headers: header, body: _json)
        .then((dynamic res) {
      print(res);
      responseLoginModel = ResponseLoginModel.fromJson(res);
      return responseLoginModel;
    });
  }
}
