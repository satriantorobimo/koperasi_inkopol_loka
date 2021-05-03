import 'package:loka_apps/function/network_util.dart';
import 'package:loka_apps/model/profile/response_profile_model.dart';
import 'package:loka_apps/util/url_string.dart';

class ProfileApiClient {
  ResponseProfileModel responseProfileModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<ResponseProfileModel> getProfile(String token) async {
    final Map<String, String> header = urlString.getHeaderTypeWithToken(token);
    return await netUtil
        .get(urlString.getUrlProfile(), headers: header)
        .then((dynamic res) {
      print(res);
      responseProfileModel = ResponseProfileModel.fromJson(res);
      return responseProfileModel;
    });
  }
}
