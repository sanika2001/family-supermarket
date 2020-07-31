import 'dart:async';
import 'package:familysupermarket/db/cart.dart';
import 'package:familysupermarket/models/cart.dart';

class CartDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new
  Future<int> createCart(Cart cart) async {
    final db = await dbProvider.database;
    var result = db.insert(cartTABLE, cart.toDatabaseJson());
    return result;
  }

  Future<List<Cart>> getCarts({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db
            .query(cartTABLE, columns: columns, whereArgs: ["%$query%"]);
    } else {
      result = await db.query(cartTABLE, columns: columns);
    }

    List<Cart> carts = result.isNotEmpty
        ? result.map((item) => Cart.fromDatabaseJson(item)).toList()
        : [];
    return carts;
  }
}
