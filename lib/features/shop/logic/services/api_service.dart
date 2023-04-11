import 'dart:convert';

import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUri = "http://121.172.37.25:8080";

  Future<List<Product>> getItems() async {
    final List<Product> product = [];
    final response = await http.get(
      Uri.parse("$baseUri/items"),
      headers: {"content-type": "application/json"},
    );

    for (var item in jsonDecode(utf8.decode(response.bodyBytes))) {
      product.add(Product.fromJson(item));
    }
    return product;
  }
}
