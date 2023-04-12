import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';

import 'package:flutter/material.dart';

class ProductPostViewModel extends ChangeNotifier {
  final api = ApiService();

  late List<Product> _products = [];

  List<Product> get list => _products;

  Future<List<Product>> updateItem() async {
    _products = await api.getItems();
    notifyListeners();
    return _products;
  }

  Future<void> addItem(Product data) async {
    _products.add(data);
    await api.addItem(data.toJson());
    notifyListeners();
  }
}
