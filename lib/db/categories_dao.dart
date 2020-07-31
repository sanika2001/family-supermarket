import 'dart:async';
import 'package:familysupermarket/db/categories.dart';
import 'package:familysupermarket/models/categories.dart';

class CategoriesDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new
  Future<int> createCategories(Categories categories) async {
    final db = await dbProvider.database;
    var result = db.insert(categoriesTABLE, categories.toDatabaseJson());
    return result;
  }

  Future<List<Categories>> getCategoriess({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(categoriesTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(categoriesTABLE, columns: columns);
    }

    List<Categories> categoriess = result.isNotEmpty
        ? result.map((item) => Categories.fromDatabaseJson(item)).toList()
        : [];
    return categoriess;
  }
}
