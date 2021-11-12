class Product {
  Product({
    this.name,
    this.image,
    this.newPrice,
    this.oldPrice,
    this.count,
  });

  String? name;
  List<String>? image;
  double? newPrice;
  double? oldPrice;
  int? count;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        image: List<String>.from(json["image"].map((x) => x)),
        newPrice: json["newPrice"],
        oldPrice: json["oldPrice"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "newPrice": newPrice,
        "oldPrice": oldPrice,
        "count": count,
      };
}
