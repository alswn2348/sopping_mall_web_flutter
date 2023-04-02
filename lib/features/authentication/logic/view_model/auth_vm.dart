import 'package:e_commerce_flutter/features/authentication/logic/models/token.dart';
import 'package:e_commerce_flutter/features/authentication/logic/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthenticartionViewModel extends ChangeNotifier {
  final AuthRepository _repository;

  late final Token _token = Token(value: _repository.getToken());

  AuthenticartionViewModel(this._repository);

  Future<void> login(Map<String, String> data) async {
    await _repository.login(data);
    notifyListeners();
  }

  Future<Response> register(Map<String, String> data) async {
    return await _repository.register(data);
  }

  Future<void> logout() async {
    await _repository.logout();
    notifyListeners();
  }

  String get updateToken => _token.value;
}
