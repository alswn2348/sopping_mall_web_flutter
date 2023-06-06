import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';

import 'package:flutter/material.dart';

class ProductPostViewModel extends ChangeNotifier {
  final api = ApiService();

  late List<Product> _products;
  late Product _product;

  Future<List<Product>> updateItems() async {
    _products = await api.getItems();
    notifyListeners();
    return _products;
  }

  Future<Product> getItem(String id) async {
    _product = await api.getDetaileItem(id);
    notifyListeners();
    return _product;
  }

  Future<void> addItem(Product data) async {
    _products.add(data);
    await api.addItem(data.toJson());
    notifyListeners();
  }

  Future<void> deleteItem({
    required int index,
    required int id,
  }) async {
    _products.removeAt(index);
    await api.deleteItem(id);
    notifyListeners();
  }

  void modifyItem({
    required int index,
    required Product data,
  }) async {
    _products[index] = data;
    await api.putItem(data);
    notifyListeners();
  }

  Future<void> updateImage(List<int> file, String name) async {
    await api.uploadFile(file, name);
  }
}
