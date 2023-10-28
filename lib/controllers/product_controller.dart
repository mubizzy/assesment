import 'package:assesement/models/productmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfentity/sqfentity.dart';


// Create a ProductController class
class ProductController {
  final Database _database;

  ProductController(this._database);

  Future<List<Product>> getProducts() async {
    final List<Map<String, dynamic>> productMaps =
        await _database.query('products');
    return productMaps.map((map) => Product.fromMap(map)).toList();
  }

  Future<void> addProduct(Product product) async {
    final Map<String, dynamic> productData = product.toMap();
    await _database.insert('products', productData);
  }

  Future<void> updateProduct(Product product) async {
    final Map<String, dynamic> productData = product.toMap();
    await _database.update(
      'products',
      productData,
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<void> deleteProduct(int productId) async {
    await _database.delete(
      'products',
      where: 'id = ?',
      whereArgs: [productId],
    );
  }
}
