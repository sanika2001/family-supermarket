import 'dart:async';
import 'package:familysupermarket/models/rice.dart';
import 'package:familysupermarket/db/Flourdb.dart';

class FlourDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Todo records
  Future<int> createFlour(Rice flour) async {
    final db = await dbProvider.database;
    var result = db.insert(flourTABLE, flour.toDatabaseJson());
    return result;
  }

  Future<List<Rice>> getFlours({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(flourTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(flourTABLE, columns: columns);
    }

    List<Rice> flours = result.isNotEmpty
        ? result.map((item) => Rice.fromDatabaseJson(item)).toList()
        : [];
    return flours;
  }
}
