import 'package:e_commerce_flutter/features/authentication/logic/models/token.dart';
import 'package:e_commerce_flutter/features/authentication/logic/services/api_service.dart';
import 'package:http/src/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final api = ApiService();
  final SharedPreferences _preferences;

  AuthRepository(this._preferences);

  Future<void> login(Map<String, String> data) async {
    return setToken(
      await api.login(data),
    );
  }

  Future<Response> register(Map<String, String> data) async {
    return await api.register(data);
  }

  Future<void> logout() async {
    await deleteToken();
  }

  Future<void> setToken(Token token) {
    return _preferences.setString("token", token.value);
  }

  String getToken() {
    return _preferences.getString("token") ?? "";
  }

  Future<void> deleteToken() {
    return _preferences.setString("token", "");
  }
}
