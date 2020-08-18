import 'package:familysupermarket/models/order.dart';
import 'package:familysupermarket/db/order_dao.dart';

class OrderRepository {
  final orderDao = OrderDao();
  Future getAllOrders({String query}) => orderDao.getOrders(query: query);
  Future insertOrder(Order order) => orderDao.createOrder(order);
}