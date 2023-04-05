class Product {
  String imgPath = "";
  String name = "";
  int price = 0;

  Product({
    required this.imgPath,
    required this.name,
    required this.price,
  });

  Product.fromJson(Map<String, dynamic> json) {
    imgPath = json['imgPath'];
    name = json['name'];
    price = json['price'];
  }
}
