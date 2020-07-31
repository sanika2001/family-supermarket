import 'dart:async';
import 'package:familysupermarket/db/components.dart';
import 'package:familysupermarket/models/components.dart';

class ComponentsDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createComponents(Components components) async {
    final db = await dbProvider.database;
    var result = db.insert(componentsTABLE, components.toDatabaseJson());
    return result;
  }

  Future<List<Components>> getComponentss(
      {List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(componentsTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(componentsTABLE, columns: columns);
    }

    List<Components> componentss = result.isNotEmpty
        ? result.map((item) => Components.fromDatabaseJson(item)).toList()
        : [];
    return componentss;
  }
}
