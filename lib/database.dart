import 'package:sqflite/sqflite.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

const databaseModel = SqfEntityModel(
  databaseName: 'product_manager.db',
  databaseTables: [productTable],
);

const productTable = SqfEntityTableBase(
  tableName: 'products',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  primaryKeyName: 'id',
  modelName: null,
  fields: [
    SqfEntityField('name', DbType.text),
    SqfEntityField('quantity', DbType.integer),
    SqfEntityField('costPrice', DbType.real),
    SqfEntityField('sellingPrice', DbType.real),
    SqfEntityField('productImage', DbType.text),
  ],
);



// Define the Product table
const tableProducts = SqfEntityTable(
  tableName: 'products',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('name', DbType.text),
    SqfEntityField('quantity', DbType.integer),
    SqfEntityField('costPrice', DbType.real),
    SqfEntityField('sellingPrice', DbType.real),
    SqfEntityField('imagePath', DbType.text),
  ],
);

// Define the database model
final productManagerDatabaseModel = SqfEntityModel(
  modelName: 'ProductManagerDB',
  databaseName: 'product_manager.db',
  databaseTables: [tableProducts],
);
