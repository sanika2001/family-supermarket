import 'dart:async';
import 'package:familysupermarket/models/categories.dart';
import 'package:familysupermarket/repository/categories.dart';

class CategoriesBloc {


  final _categoriesListStreamController = StreamController<List<Categories>>();

  Stream<List<Categories>> get categoriesListStream =>
      _categoriesListStreamController.stream;
  StreamSink<List<Categories>> get categoriesListSink =>
      _categoriesListStreamController.sink;

  CategoriesBloc(){
    _categoriesListStreamController.add(categoriesList);
  }

  void dispose() {
    _categoriesListStreamController.close();
  }
}
