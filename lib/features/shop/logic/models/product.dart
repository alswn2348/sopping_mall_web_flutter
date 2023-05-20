class Product {
  int? id;
  String imgPath = "";
  String name = "";
  int? price;
  String? content = "";

  Product({
    this.id,
    required this.imgPath,
    required this.name,
    this.price,
    this.content,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgPath = json['imgPath'];
    name = json['name'];
    price = json['price'];
    content = json['content'];
  }

  Map<String, String> toJson() {
    return {
      "id": id.toString(),
      "imgPath": imgPath,
      "name": name,
      "price": price.toString(),
      "content": content ?? "",
    };
  }
}
