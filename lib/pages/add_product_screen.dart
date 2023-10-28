import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController costPriceController = TextEditingController();
  final TextEditingController sellingPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: costPriceController,
              decoration: InputDecoration(labelText: 'Cost Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: sellingPriceController,
              decoration: InputDecoration(labelText: 'Selling Price'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                // Validate input and save the new product to the database
                // You'll need to implement the add product logic.
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
