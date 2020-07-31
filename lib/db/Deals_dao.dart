import 'dart:async';
import 'package:familysupermarket/models/deals.dart';
import 'package:familysupermarket/db/Dealsdb.dart';

class DealsDao {
  final dbProvider = DatabaseProvider1.dbProvider;

  Future<int> createDeals(Deals deals) async {
    final db = await dbProvider.database;
    var result = db.insert(dealsTABLE, deals.toDatabaseJson());
    return result;
  }

  Future<List<Deals>> getDealss({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(dealsTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(dealsTABLE, columns: columns);
    }

    List<Deals> dealss = result.isNotEmpty
        ? result.map((item) => Deals.fromDatabaseJson(item)).toList()
        : [];
    return dealss;
  }
}
