import 'package:familysupermarket/models/products.dart';
import 'package:familysupermarket/db/Products_dao.dart';

class ProductsRepository {
  final productsDao = ProductsDao();
  Future getAllProductss({String query}) =>
      productsDao.getProductss(query: query);
  Future insertProducts(Products products) =>
      productsDao.createProducts(products);
}
//List<Products> productsList = [
////  Products("https://i.ebayimg.com/images/g/o3QAAOSwDlZeqROt/s-l300.jpg"),
////  Products("https://i.ytimg.com/vi/TUU4WVAVqH4/maxresdefault.jpg"),
////  Products("https://5.imimg.com/data5/EM/BK/MY-7778582/bajaj-hair-oil-500x500.jpg")
////];
