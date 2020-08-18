import 'dart:async';
import 'package:familysupermarket/db/order.dart';
import 'package:familysupermarket/models/order.dart';

class OrderDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new
  Future<int> createOrder(Order order) async {
    final db = await dbProvider.database;
    var result = db.insert(orderTABLE, order.toDatabaseJson());
    return result;
  }

  Future<List<Order>> getOrders({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(orderTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(orderTABLE, columns: columns);
    }

    List<Order> orders = result.isNotEmpty
        ? result.map((item) => Order.fromDatabaseJson(item)).toList()
        : [];
    return orders;
  }
}
