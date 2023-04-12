import 'package:e_commerce_flutter/features/authentication/logic/models/token.dart';
import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final api = ApiService();
  final SharedPreferences _preferences;

  AuthRepository(this._preferences);

  Future<Token> login(Map<String, String> data) async {
    var token = await api.login(data);
    setToken(token);
    return token;
  }

  Future<Response> register(Map<String, String> data) async {
    return await api.register(data);
  }

  Future<void> logout() async {
    await deleteToken();
  }

  Future<void> setToken(Token token) async {
    _preferences.setString("token", token.value);
  }

  String getToken() {
    return _preferences.getString("token") ?? "";
  }

  Future<void> deleteToken() async {
    _preferences.setString("token", "");
  }
}
