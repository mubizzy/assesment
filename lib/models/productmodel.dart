import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class Product {
  int id;
  String name;
  int quantity;
  double costPrice;
  double sellingPrice;
  String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.costPrice,
    required this.sellingPrice,
    required this.imagePath,
  });

  // Convert Product object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'costPrice': costPrice,
      'sellingPrice': sellingPrice,
      'imagePath': imagePath,
    };
  }

  // Create a Product object from a map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      costPrice: map['costPrice'],
      sellingPrice: map['sellingPrice'],
      imagePath: map['imagePath'],
    );
  }
}