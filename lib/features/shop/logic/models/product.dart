class Product {
  String imgPath = "";
  String name = "";
  int price = 0;
  String? content = "";

  Product({
    required this.imgPath,
    required this.name,
    required this.price,
    this.content,
  });

  Product.fromJson(Map<String, dynamic> json) {
    imgPath = json['imgPath'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, String> toJson() {
    return {
      "imgPath": imgPath,
      "name": name,
      "price": price.toString(),
      "content": content ?? "",
    };
  }
}
