import 'dart:async';
import 'package:familysupermarket/bloc/categories.dart';

class CategoriesBloc {
  List<Categories> _categoriesList = [
    Categories("images/wheat.png", "Food Grains,Oils & Masala"),
    Categories("images/instant.png", "Instant Foods"),
    Categories("images/snacks.png", "Snacks & Confectionary"),
    Categories("images/cleaning.png", "Household Cleaning")
  ];

  final _categoriesListStreamController = StreamController<List<Categories>>();

  Stream<List<Categories>> get categoriesListStream =>
      _categoriesListStreamController.stream;
  StreamSink<List<Categories>> get categoriesListSink =>
      _categoriesListStreamController.sink;

  CategoriesBloc(){
    _categoriesListStreamController.add(_categoriesList);
  }

  void dispose() {
    _categoriesListStreamController.close();
  }
}
