import 'dart:developer';

import 'package:bookia/core/services/app_endpoints.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/local_helper.dart';
import 'package:bookia/feature/cart/data/models/get_cart_response/get_cart_response.dart';

class CartRepo {
  static Future<GetCartResponse?> getCart() async {
    try {
      var response =
          await DioProvider.get(endpoint: AppEndpoints.getCart, headers: {
        'Authorization':
            "Bearer ${LocalHelper.getCachedData(LocalHelper.tokenkey)}",
      });

      if (response.statusCode == 200) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> addToCart(int id) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppEndpoints.addToCart,
        data: {"product_id": id},
        headers: {
          'Authorization':
              "Bearer ${LocalHelper.getCachedData(LocalHelper.tokenkey)}",
        },
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<GetCartResponse?> removeFromCart(int cartItemId) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppEndpoints.removeFromCart,
        data: {"cart_item_id": cartItemId},
        headers: {
          'Authorization':
              "Bearer ${LocalHelper.getCachedData(LocalHelper.tokenkey)}",
        },
      );

      if (response.statusCode == 200) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<GetCartResponse?> updateCart(
      int cartItemId, int quantity) async {
    try {
      var response = await DioProvider.post(
        endpoint: AppEndpoints.updateCart,
        data: {"cart_item_id": cartItemId, "quantity": quantity},
        headers: {
          'Authorization':
              "Bearer ${LocalHelper.getCachedData(LocalHelper.tokenkey)}",
        },
      );

      if (response.statusCode == 201) {
        return GetCartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
