import 'package:dio/dio.dart';
import 'package:e_commerce_flutter/features/authentication/logic/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['authorization'] == "true") {
      options.headers.remove('accessToken');

      final preferences = await SharedPreferences.getInstance();
      final repository = AuthRepository(preferences);
      final token = repository.getToken();

      options.headers.addAll(
        {'authorization': "Bearer $token"},
      );
    }

    super.onRequest(options, handler);
  }
}
