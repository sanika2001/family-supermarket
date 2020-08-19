import 'dart:async';
import 'package:familysupermarket/db/detail.dart';
import 'package:familysupermarket/models/detail.dart';

class DetailDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new
  Future<int> createDetail(Detail detail) async {
    final db = await dbProvider.database;
    var result = db.insert(detailTABLE, detail.toDatabaseJson());
    return result;
  }

  Future<List<Detail>> getDetails({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(detailTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(detailTABLE, columns: columns);
    }

    List<Detail> details = result.isNotEmpty
        ? result.map((item) => Detail.fromDatabaseJson(item)).toList()
        : [];
    return details;
  }
}
