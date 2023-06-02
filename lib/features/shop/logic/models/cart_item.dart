import 'package:e_commerce_flutter/features/shop/logic/models/product.dart';

class CartItem {
  final int cartId;
  final int memberId;
  final Product item;
  final int count;
  final String createDate;
  CartItem({
    required this.cartId,
    required this.memberId,
    required this.item,
    required this.count,
    required this.createDate,
  });

  CartItem.fromJson(Map<String, dynamic> json)
      : cartId = json['cartId'],
        memberId = json['memberId'],
        item = Product.fromJson(json['item']),
        count = json['count'],
        createDate = json['createDate'];
}
