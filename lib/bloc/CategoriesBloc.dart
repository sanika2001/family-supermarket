import 'package:familysupermarket/models/categories.dart';
import 'dart:async';
import 'package:familysupermarket/repository/categories.dart';

class CategoriesBloc {
  final _categoriesRepository = CategoriesRepository();

  final _categoriesController = StreamController<List<Categories>>();

  get categoriess => _categoriesController.stream;

  CategoriesBloc() {
    getCategoriess();
  }

  getCategoriess({String query}) async {
    _categoriesController.sink.add(await _categoriesRepository.getAllCategoriess(query: query));
  }

  addHome(Categories categories) async {
    await _categoriesRepository.insertCategories(categories);
    getCategoriess();
  }

  dispose() {
    _categoriesController.close();
  }
}
