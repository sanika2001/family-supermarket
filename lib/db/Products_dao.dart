import 'dart:async';
import 'package:familysupermarket/models/products.dart';
import 'package:familysupermarket/db/Productsdb.dart';

class ProductsDao {
  final dbProvider = DatabaseProvider2.dbProvider;

  Future<int> createProducts(Products products) async {
    final db = await dbProvider.database;
    var result = db.insert(productsTABLE, products.toDatabaseJson());
    return result;
  }

  Future<List<Products>> getProductss(
      {List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(productsTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(productsTABLE, columns: columns);
    }

    List<Products> productss = result.isNotEmpty
        ? result.map((item) => Products.fromDatabaseJson(item)).toList()
        : [];
    return productss;
  }
}
