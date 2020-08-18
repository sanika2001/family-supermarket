import 'package:familysupermarket/models/order.dart';
import 'dart:async';
import 'package:familysupermarket/repository/order.dart';

class OrderBloc {
  final _orderRepository = OrderRepository();

  final _orderController = StreamController<List<Order>>();

  get orders => _orderController.stream;

  OrderBloc() {
    getOrders();
  }

  getOrders({String query}) async {
    _orderController.sink.add(await _orderRepository.getAllOrders(query: query));
  }

  addOrder(Order order) async {
    await _orderRepository.insertOrder(order);
    getOrders();
  }

  dispose() {
    _orderController.close();
  }
}
