import 'package:assesement/pages/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databasePath = await getDatabasesPath();
  final databaseFactory = databaseFactoryFfi;
  final database = await databaseFactory.openDatabase(
    path.join(databasePath, 'product_manager.db'),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE products(
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          quantity INTEGER NOT NULL,
          costPrice REAL NOT NULL,
          sellingPrice REAL NOT NULL,
          imagePath TEXT
        )
      ''');
    },
  );

  runApp(MyApp(database));
}

class MyApp extends StatelessWidget {
  final Database database;

  MyApp(this.database);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Product Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(database),
    );
  }
}
