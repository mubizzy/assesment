import 'package:assesement/models/productmodel.dart';
import 'package:assesement/pages/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../main.dart';

class ProductListScreen extends StatelessWidget {
  final ProductListController controller = Get.put(ProductListController());

  ProductListScreen(Database database);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Manager'),
      ),
      body: Obx(
        () => controller.products.isEmpty
            ? Center(
                child: Text('No products available.'),
              )
            : ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.asset('assets/product_image.png'), // Replace with the product's image path
                      title: Text(product.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Quantity: ${product.quantity}'),
                          Text('Cost Price: \$${product.costPrice.toStringAsFixed(2)}'),
                          Text('Selling Price: \$${product.sellingPrice.toStringAsFixed(2)}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Navigate to the "Edit Product" screen for this product
                              controller.editProduct(product);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Show a confirmation dialog for deleting the product
                              controller.confirmDeleteProduct(product);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the "Add Product" screen
          controller.addProduct();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProductListController extends GetxController {
  final products = <Product>[].obs;

  void loadProducts() {
    // Load products from the database or an API and update the "products" list
    products.assignAll(SqfEntityProvider().getProducts());
  }

  // Method to confirm product deletion with a dialog
  void confirmDeleteProduct(Product product) {
    Get.defaultDialog(
      title: 'Delete Product',
      middleText: 'Are you sure you want to delete ${product.name}?',
      actions: [
        TextButton(
          onPressed: () {
            Get.back(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            deleteProduct(product); // Call the method to delete the product
            Get.back(); // Close the dialog
          },
          child: Text('Delete'),
        ),
      ],
    );
  }

  // Method to delete a product
  void deleteProduct(Product product) {
    // Implement the logic to delete the product from the database
    SqfEntityProvider().deleteProduct(product);
    // Reload the products list after deletion
    loadProducts();
  }

  // Method to navigate to the "Add Product" screen
  void addProduct() {
    Get.to(() => AddProductScreen());
  }

  // Method to navigate to the "Edit Product" screen for a specific product
  void editProduct(Product product) {
    Get.to(() => EditProductScreen(), arguments: product);
  }
}
