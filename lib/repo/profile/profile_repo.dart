import 'dart:async';

import 'package:loka_apps/api/profile/profile_api.dart';
import 'package:loka_apps/model/profile/response_profile_model.dart';

class ProfileRepository {
  ProfileApiClient profileApiClient = ProfileApiClient();

  Future<ResponseProfileModel> getProfile(String token) =>
      profileApiClient.getProfile(token);
}
