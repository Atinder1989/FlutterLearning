
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.name,

  });

  String name;


  factory Product.fromJson(Map<String, dynamic> json) => Product(

    name: json["name"],


  );

  Map<String, dynamic> toJson() => {

    "name": name,

  };
}

