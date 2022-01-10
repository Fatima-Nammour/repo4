import 'dart:convert';

class Product {
  Product({
    required this.products,
  });

  final List<ProductElement> products;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductElement {
  ProductElement({
    required this.name,
    required this.id,
    required this.price,
    required this.rate,
    required this.description,
    required this.imageUrl,
    required this.market,
  });

  final String name;
  final String id;
  final int price;
  final double rate;
  final String description;
  final String imageUrl;
  final Market market;

  factory ProductElement.fromRawJson(String str) =>
      ProductElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        name: json["name"],
        id: json["id"],
        price: json["price"],
        rate: json["rate"].toDouble(),
        description: json["description"],
        imageUrl: json["imageUrl"],
        market: Market.fromJson(json["market"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "price": price,
        "rate": rate,
        "description": description,
        "imageUrl": imageUrl,
        "market": market.toJson(),
      };
}

class Market {
  Market({
    required this.name,
    required this.address,
  });

  final String name;
  final String address;

  factory Market.fromRawJson(String str) => Market.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        name: json["name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
      };
}
