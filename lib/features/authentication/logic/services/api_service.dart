import 'dart:convert';

import 'package:e_commerce_flutter/features/authentication/logic/models/token.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUri = "http://121.172.36.156:8080";

  Future<Token> login(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse("$baseUri/login"),
      body: jsonEncode(data),
      headers: {"content-type": "application/json"},
    );

    final token = Token.fromJson(jsonDecode(response.body));

    return token;
  }

  Future<http.Response> register(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse("$baseUri/register"),
      body: jsonEncode(data),
      headers: {"content-type": "application/json"},
    );
    return response;
  }
}
