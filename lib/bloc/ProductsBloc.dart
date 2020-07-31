import 'dart:async';
import 'package:familysupermarket/models/products.dart';
import 'package:familysupermarket/repository/products.dart';

class ProductsBloc {
  final _productsRepository = ProductsRepository();

  final _productsController = StreamController<List<Products>>();

  get productss => _productsController.stream;

  ProductsBloc() {
    getProductss();
  }

  getProductss({String query}) async {
    _productsController.sink
        .add(await _productsRepository.getAllProductss(query: query));
  }

  addProducts(Products products) async {
    await _productsRepository.insertProducts(products);
    getProductss();
  }

  dispose() {
    _productsController.close();
  }
}
