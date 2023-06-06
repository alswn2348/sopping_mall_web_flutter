import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/features/authentication/logic/models/user.dart';
import 'package:e_commerce_flutter/features/services/dio.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  static var dio = Dio();

  static const String baseUri = "http://121.172.37.25:8080";

  Future<User> login(Map<String, String> data) async {
    dio.interceptors.add(ApiInterceptor());

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
  }

  Future<Response<dynamic>> register(Map<String, String> data) async {
    dio.interceptors.add(ApiInterceptor());

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
    dio.interceptors.add(ApiInterceptor());

    final List<Product> products = [];

    final response = await dio.get(
      "$baseUri/items",
      options: Options(
        contentType: "application/json",
      ),
    );
    for (var item in response.data) {
      products.add(Product.fromJson(item));
    }
    return products;
  }

  Future<Product> getDetaileItem(String id) async {
    dio.interceptors.add(ApiInterceptor());

    final Product product;

    final response = await dio.get(
      "$baseUri/item/$id",
      options: Options(
        contentType: "application/json",
      ),
    );
    product = Product.fromJson(response.data);
    return product;
  }

  Future<Response<dynamic>> addItem(Map<String, String> data) async {
    dio.interceptors.add(ApiInterceptor());

    final response = await dio.post(
      "$baseUri/admin/additem",
      data: jsonEncode(data),
      options: Options(headers: {
        "authorization": "true",
      }, contentType: "application/json"),
    );

    return response;
  }

  Future<void> deleteItem(int id) async {
    dio.interceptors.add(ApiInterceptor());

    await dio.delete(
      "$baseUri/admin/$id",
      options: Options(
        headers: {
          "authorization": "true",
        },
      ),
    );
  }

  Future<void> putItem(Product data) async {
    dio.interceptors.add(ApiInterceptor());

    await dio.put(
      "$baseUri/admin/${data.id}",
      data: jsonEncode(
        data.toJson(),
      ),
      options: Options(headers: {
        "authorization": "true",
      }, contentType: "application/json"),
    );
  }

  Future<void> uploadFile(List<int> file, String fileName) async {
    dio.interceptors.add(ApiInterceptor());

    FormData formData = FormData.fromMap(
      {
        "image": MultipartFile.fromBytes(
          file,
          filename: fileName,
          contentType: MediaType("image", "png"),
        )
      },
    );

    await dio.post(
      "$baseUri/admin/fileSystem",
      data: formData,
      options: Options(
        headers: {
          "authorization": "true",
        },
      ),
    );
  }

  Future<List> getCartItems() async {
    dio.interceptors.add(ApiInterceptor());

    var resp = await dio.get(
      "$baseUri/user/cart/items",
      options: Options(headers: {
        "authorization": "true",
      }, contentType: "application/json"),
    );

    return resp.data['content'];
  }

  Future<void> addCartItem(String id, String count) async {
    dio.interceptors.add(ApiInterceptor());

    await dio.post(
      "$baseUri/user/cart/items/$id",
      data: jsonEncode(
        {"count": count},
      ),
      options: Options(headers: {
        "authorization": "true",
      }, contentType: "application/json"),
    );
  }

  Future<void> deleteCartItem(int id) async {
    dio.interceptors.add(ApiInterceptor());

    await dio.delete(
      "$baseUri/user/cart/items/$id",
      options: Options(headers: {
        "authorization": "true",
      }, contentType: "application/json"),
    );
  }
}
