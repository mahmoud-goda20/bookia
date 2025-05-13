import 'dart:developer';

import 'package:bookia/core/services/app_endpoints.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/feature/home/data/models/best_seller_books/best_seller_books.dart';
import 'package:bookia/feature/home/data/models/search/search_response/search_response.dart';
import 'package:bookia/feature/home/data/models/sliders/sliders.dart';

class HomeRepo {
  static Future<BestSellerBooks?> getBestSeller() async {
    try {
      var response = await DioProvider.get(endpoint: AppEndpoints.bestSellers);

      if (response.statusCode == 200) {
        return BestSellerBooks.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Sliders?> getSliders() async {
    try {
      var response = await DioProvider.get(endpoint: AppEndpoints.slider);

      if (response.statusCode == 200) {
        return Sliders.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<SearchResponse?> getSearch(String query) async {
    try {
      var response = await DioProvider.get(
        endpoint: AppEndpoints.search,
        params: {"name": query},
      );

      if (response.statusCode == 200) {
        return SearchResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
