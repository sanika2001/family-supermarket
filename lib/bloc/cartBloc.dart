import 'package:familysupermarket/repository/cart.dart';
import 'dart:async';
import 'package:familysupermarket/models/cart.dart';

class CartBloc {
  final _cartListStreamController = StreamController<List<Cart>>();

  Stream<List<Cart>> get cartListStream => _cartListStreamController.stream;
  StreamSink<List<Cart>> get cartListSink => _cartListStreamController.sink;

  CartBloc() {
    _cartListStreamController.add(cartList);
  }

  void dispose() {
    _cartListStreamController.close();
  }
}
