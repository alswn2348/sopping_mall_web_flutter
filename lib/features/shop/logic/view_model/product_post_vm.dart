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

  Future<void> addItem(Product data, String token) async {
    _products.add(data);
    await api.addItem(data.toJson(), token);
    notifyListeners();
  }

  Future<void> deleteItem({
    required int index,
    required int id,
    required String token,
  }) async {
    _products.removeAt(index);
    await api.deleteItem(id, token);
    notifyListeners();
  }

  void modifyItem({
    required int index,
    required Product data,
    required String token,
  }) async {
    _products[index] = data;
    await api.putItem(data, token);
    notifyListeners();
  }
}
