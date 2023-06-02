import 'package:e_commerce_flutter/features/services/api_service.dart';
import 'package:e_commerce_flutter/features/shop/logic/models/cart_item.dart';

import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final api = ApiService();

  late List<CartItem> _cartItems;

  List<CartItem> get getCartItems => _cartItems;
  int get getLength => _cartItems.length;

  Future<List<CartItem>> updateCartItems(String token) async {
    var jsonCartItem = await api.getCartItems(token);

    _cartItems =
        jsonCartItem.map<CartItem>((e) => CartItem.fromJson(e)).toList();
    notifyListeners();
    return _cartItems;
  }

  Future<void> addItem(int id, String count, String token) async {
    await api.addCartItem(id, count, token);
    notifyListeners();
  }
}
