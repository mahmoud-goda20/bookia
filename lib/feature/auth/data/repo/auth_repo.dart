import 'dart:developer';

import 'package:bookia/core/services/app_endpoints.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/feature/auth/data/models/request/auth_params.dart';
import 'package:bookia/feature/auth/data/models/response/auth_response/auth_response.dart';

class AuthRepo {
  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.register, data: params.toJson());

      if (response.statusCode == 201) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.login, data: params.toJson());

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forgetPassword(AuthParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.forgotPassword, data: params.toJson());
      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> checkForgetPassword(AuthParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.checkForgetPassword, data: params.toJson());
      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> restPassword(AuthParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: AppEndpoints.restPassword, data: params.toJson());
      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
