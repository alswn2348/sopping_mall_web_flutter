import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_flutter/features/authentication/logic/models/user.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUri = "http://121.172.37.25:8080";

  Future<User> login(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse("$baseUri/login"),
      body: jsonEncode(data),
      headers: {"content-type": "application/json"},
    );

    final user = User.formJson(jsonDecode(response.body));

    return user;
  }

  Future<http.Response> register(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse("$baseUri/register"),
      body: jsonEncode(data),
      headers: {"content-type": "application/json"},
    );
    return response;
  }

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

  Future<http.Response> addItem(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse("$baseUri/additem"),
      body: jsonEncode(data),
      headers: {"content-type": "application/json"},
    );
    return response;
  }

  Future<void> deleteItem(int id, String token) async {
    await http.delete(
      Uri.parse("$baseUri/admin/$id"),
      headers: {
        HttpHeaders.authorizationHeader: token,
      },
    );
  }
}
