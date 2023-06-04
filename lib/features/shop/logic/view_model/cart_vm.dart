import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/cart_item.dart';

import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final api = ApiService();

  late List<CartItem> _cartItems;

  List<CartItem> get getCartItems => _cartItems;
  int get getLength => _cartItems.length;
  int get price {
    int total = _cartItems.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.item.price! * element.count));
    return total;
  }

  Future<List<CartItem>> updateCartItems(String token) async {
    var jsonCartItem = await api.getCartItems(token);

    _cartItems =
        jsonCartItem.map<CartItem>((e) => CartItem.fromJson(e)).toList();
    notifyListeners();
    return _cartItems;
  }

  Future<void> addItem(String id, String count, String token) async {
    await api.addCartItem(id, count, token);
    updateCartItems(token);
  }

  Future<void> removeItem(int id, String token) async {
    await api.deleteCartItem(id, token);
    updateCartItems(token);
  }
}
