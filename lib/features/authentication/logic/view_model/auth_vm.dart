import 'package:e_commerce_flutter/features/authentication/logic/models/user.dart';
import 'package:e_commerce_flutter/features/authentication/logic/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthenticartionViewModel extends ChangeNotifier {
  final AuthRepository _repository;

  late User _user = User(token: _repository.getToken());

  AuthenticartionViewModel(this._repository);

  Future<void> login(Map<String, String> data) async {
    var user = await _repository.login(data);

    _user = user;
    notifyListeners();
  }

  Future<Response> register(Map<String, String> data) async {
    return await _repository.register(data);
  }

  Future<void> logout() async {
    await _repository.logout();
    _user.token = "";
    notifyListeners();
  }

  String get updateToken => _user.token;
  List<dynamic>? get getRole => _user.roles;
}
