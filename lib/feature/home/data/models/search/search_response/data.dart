import 'package:bookia/feature/home/data/models/best_seller_books/product.dart';

import 'links.dart';
import 'meta.dart';

class Data {
  List<Product>? products;
  Meta? meta;
  Links? links;

  Data({this.products, this.meta, this.links});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: json['products'] as List<Product>?,
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'products': products,
        'meta': meta?.toJson(),
        'links': links?.toJson(),
      };
}
