import 'dart:async';
import 'package:familysupermarket/bloc/products.dart';

class ProductsBloc{
  List<Products> _productsList = [
    Products("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.amazon.com%2FPortable-Refillable-Perfume-Atomizer-Bottle%25EF%25BC%258CAtomizer%2Fdp%2FB07SX3C2C5&psig=AOvVaw0cYopMMWtd8kqKkFNF4575&ust=1592929845557000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLCRmqLsleoCFQAAAAAdAAAAABAE"),
    Products("https://images.app.goo.gl/qJ6vgYaRg3nqT7x97"),
    Products("https://images.app.goo.gl/1AjDbmxkjoHJyC2U6")
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

