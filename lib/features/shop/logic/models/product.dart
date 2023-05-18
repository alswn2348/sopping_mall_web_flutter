class Product {
  int? id;
  String imgPath = " ";
  String name = "";
  int price = 0;
  String? content = "";

  Product({
    this.id,
    required this.imgPath,
    required this.name,
    required this.price,
    this.content,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgPath = json['imgPath'];
    name = json['name'];
    price = json['price'];
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
