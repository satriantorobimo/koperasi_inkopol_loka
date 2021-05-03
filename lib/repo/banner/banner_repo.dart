import 'dart:async';

import 'package:loka_apps/api/banner/banner_api.dart';
import 'package:loka_apps/model/banner/banner_response_model.dart';

class BannerRepository {
  BannerApiClient bannerApiClient = BannerApiClient();

  Future<BannerResponseModel> getBanner() => bannerApiClient.getBanner();
}
