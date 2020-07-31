import 'dart:async';
import 'package:familysupermarket/db/home.dart';
import 'package:familysupermarket/models/home.dart';

class HomeDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Todo records
  Future<int> createHome(Home home) async {
    final db = await dbProvider.database;
    var result = db.insert(homeTABLE, home.toDatabaseJson());
    return result;
  }

  Future<List<Home>> getHomes({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(homeTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(homeTABLE, columns: columns);
    }

    List<Home> homes = result.isNotEmpty
        ? result.map((item) => Home.fromDatabaseJson(item)).toList()
        : [];
    return homes;
  }
}
