import 'dart:async';
import 'package:familysupermarket/bloc/products.dart';

class ProductsBloc{
  List<Products> _productsList = [
    Products("https://i.ebayimg.com/images/g/o3QAAOSwDlZeqROt/s-l300.jpg"),
    Products("https://i.ytimg.com/vi/TUU4WVAVqH4/maxresdefault.jpg"),
    Products("https://5.imimg.com/data5/EM/BK/MY-7778582/bajaj-hair-oil-500x500.jpg")
  ];

  final _productsListStreamController = StreamController<List<Products>>();

  Stream<List<Products>> get productsListStream =>
      _productsListStreamController.stream;

  StreamSink<List<Products>> get productsListSink =>
      _productsListStreamController.sink;

  ProductsBloc(){
    _productsListStreamController.add(_productsList);
  }

  void dispose(){
    _productsListStreamController.close();
  }
}

