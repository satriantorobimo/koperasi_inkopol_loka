import 'package:loka_apps/function/network_util.dart';
import 'package:loka_apps/model/banner/banner_response_model.dart';
import 'package:loka_apps/util/url_string.dart';

class BannerApiClient {
  BannerResponseModel bannerResponseModel;
  NetworkUtil netUtil = NetworkUtil();
  UrlString urlString = UrlString();

  Future<BannerResponseModel> getBanner() async {
    final Map<String, String> header = urlString.getHeaderType();

    return await netUtil
        .get(urlString.getUrlBanners(), headers: header)
        .then((dynamic res) {
      print(res);
      bannerResponseModel = BannerResponseModel.fromJson(res);
      return bannerResponseModel;
    });
  }
}
