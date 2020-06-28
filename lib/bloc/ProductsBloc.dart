import 'dart:async';
import 'package:familysupermarket/models/products.dart';
import 'package:familysupermarket/repository/products.dart';

class ProductsBloc{


  final _productsListStreamController = StreamController<List<Products>>();

  Stream<List<Products>> get productsListStream =>
      _productsListStreamController.stream;

  StreamSink<List<Products>> get productsListSink =>
      _productsListStreamController.sink;

  ProductsBloc(){
    _productsListStreamController.add(productsList);
  }

  void dispose(){
    _productsListStreamController.close();
  }
}

