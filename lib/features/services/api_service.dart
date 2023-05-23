import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/features/authentication/logic/models/user.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  static var dio = Dio();
  static const String baseUri = "http://121.172.37.25:8080";

  Future<User> login(Map<String, String> data) async {
    try {
      final response = await dio.post(
        "$baseUri/login",
        data: jsonEncode(data),
        options: Options(
          contentType: "application/json",
        ),
      );
      final user = User.formJson(
        response.data,
      );
      return user;
    } catch (e) {
      Exception(e);
    }
    return Future.value(User(token: ""));
  }

  Future<Response<dynamic>> register(Map<String, String> data) async {
    final response = await dio.post(
      "$baseUri/register",
      data: jsonEncode(data),
      options: Options(
        contentType: "application/json",
      ),
    );
    return response;
  }

  Future<List<Product>> getItems() async {
    final List<Product> product = [];
    final response = await dio.get(
      "$baseUri/items",
      options: Options(
        contentType: "application/json",
      ),
    );
    for (var item in response.data) {
      product.add(Product.fromJson(item));
    }
    return product;
  }

  Future<Product> getDetaileItem(String Id) async {
    final Product product;
    final response = await dio.get(
      "$baseUri/item/$Id",
      options: Options(
        contentType: "application/json",
      ),
    );
    product = Product.fromJson(response.data);
    return product;
  }

  Future<Response<dynamic>> addItem(
      Map<String, String> data, String token) async {
    final response = await dio.post(
      "$baseUri/admin/additem",
      data: jsonEncode(data),
      options: Options(headers: {
        "authorization": "Bearer $token",
      }, contentType: "application/json"),
    );

    return response;
  }

  Future<void> deleteItem(int id, String token) async {
    await dio.delete(
      "$baseUri/admin/$id",
      options: Options(
        headers: {
          "authorization": "Bearer $token",
        },
      ),
    );
  }

  Future<void> putItem(Product data, String token) async {
    await dio.put(
      "$baseUri/admin/${data.id}",
      data: jsonEncode(
        data.toJson(),
      ),
      options: Options(headers: {
        "authorization": "Bearer $token",
      }, contentType: "application/json"),
    );
  }

  Future<void> uploadFile(List<int> file, String fileName, String token) async {
    FormData formData = FormData.fromMap(
      {
        "image": MultipartFile.fromBytes(
          file,
          filename: fileName,
          contentType: MediaType("image", "png"),
        )
      },
    );

    try {
      await dio.post(
        "$baseUri/admin/fileSystem",
        data: formData,
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ),
      );
    } catch (e) {
      Exception(e);
    }
  }

  Future<void> getCartItem(int count, String token) async {
    await dio.get(
      "$baseUri/user/cart/items",
      options: Options(headers: {
        "authorization": "Bearer $token",
      }, contentType: "application/json"),
    );
  }

  Future<void> addCartItem(int id, int count, String token) async {
    await dio.post(
      "$baseUri/user/cart/items/$id",
      data: jsonEncode(
        {"count": "$count"},
      ),
      options: Options(headers: {
        "authorization": "Bearer $token",
      }, contentType: "application/json"),
    );
  }

  Future<void> removeCartItem(int id, int count, String token) async {
    await dio.delete(
      "$baseUri/user/cart/items/$id",
      data: jsonEncode(
        {"count": "$count"},
      ),
      options: Options(headers: {
        "authorization": "Bearer $token",
      }, contentType: "application/json"),
    );
  }
}
