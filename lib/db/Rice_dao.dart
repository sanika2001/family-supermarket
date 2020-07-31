import 'dart:async';
import 'package:familysupermarket/models/rice.dart';
import 'package:familysupermarket/db/Ricedb.dart';

class RiceDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Todo records
  Future<int> createRice(Rice rice) async {
    final db = await dbProvider.database;
    var result = db.insert(riceTABLE, rice.toDatabaseJson());
    return result;
  }

  Future<List<Rice>> getRices({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(riceTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(riceTABLE, columns: columns);
    }

    List<Rice> rices = result.isNotEmpty
        ? result.map((item) => Rice.fromDatabaseJson(item)).toList()
        : [];
    return rices;
  }
}
