import 'dart:developer';

import 'package:bookia/core/services/app_endpoints.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/profile/data/models/response/show_profile_response/show_profile_response.dart';

class ProfileRepo {
  static Future<ShowProfileResponse?> getProfile() async {
    try {
      var response = await DioProvider.get(
          endpoint: AppEndpoints.profile,
          headers: {
            "Authorization":
                "Bearer ${LocalHelper.getCachedData(LocalHelper.tokenkey)}"
          });
      if (response.statusCode == 200) {
        return ShowProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
  static Future<ShowProfileResponse?> updareProfile(AuthParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.updateProfile, data: params.toJson());

      if (response.statusCode == 200) {
        return ShowProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }


}
