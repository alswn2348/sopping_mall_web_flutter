import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';
import 'package:e_commerce_flutter/features/shop/logic/services/api_service.dart';
import 'package:flutter/material.dart';

class ProductPostViewModel extends ChangeNotifier {
  final api = ApiService();

  late List<Product> products = [];

  Future<List<Product>> updateItem() async {
    products = await api.getItems();
    return products;
  }
}
