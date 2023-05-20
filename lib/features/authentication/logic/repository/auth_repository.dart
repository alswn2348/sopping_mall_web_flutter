import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/features/authentication/logic/models/user.dart';
import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final api = ApiService();
  final SharedPreferences _preferences;

  AuthRepository(this._preferences);

  Future<User> login(Map<String, String> data) async {
    var user = await api.login(data);
    setToken(user);
    return user;
  }

  Future<Response> register(Map<String, String> data) async {
    return await api.register(data);
  }

  Future<void> logout() async {
    await deleteToken();
  }

  Future<void> setToken(User token) async {
    _preferences.setString("token", token.token);
  }

  String getToken() {
    return _preferences.getString("token") ?? "";
  }

  Future<void> deleteToken() async {
    _preferences.setString("token", "");
  }
}
