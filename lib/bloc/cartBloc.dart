import 'package:familysupermarket/models/cart.dart';
import 'dart:async';
import 'package:familysupermarket/repository/cart.dart';

class CartBloc {
  final _cartRepository = CartRepository();

  final _cartController = StreamController<List<Cart>>();

  get carts => _cartController.stream;

  CartBloc() {
    getCarts();
  }

  getCarts({String query}) async {
    _cartController.sink.add(await _cartRepository.getAllCarts(query: query));
  }

  addCart(Cart cart) async {
    await _cartRepository.insertCart(cart);
    getCarts();
  }

  dispose() {
    _cartController.close();
  }
}
