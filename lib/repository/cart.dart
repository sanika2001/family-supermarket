import 'package:familysupermarket/models/cart.dart';
import 'package:familysupermarket/db/cart_dao.dart';

class CartRepository {
  final cartDao = CartDao();
  Future getAllCarts({String query}) => cartDao.getCarts(query: query);
  Future insertCart(Cart cart) => cartDao.createCart(cart);
}


//List<Cart> cartList = [
//  Cart("https://www.periyarrice.com/images/slider2_pro1.png", "Periyar Rice",
//      "₹ 32.00"),
//  Cart(
//      "https://images-na.ssl-images-amazon.com/images/I/71CAb58u8TL._SL1313_.jpg",
//      "Aashirvaad Atta",
//      "₹ 84.00"),
//];
