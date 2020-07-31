import 'package:familysupermarket/models/categories.dart';
import 'package:familysupermarket/db/categories_dao.dart';

class CategoriesRepository {
  final categoriesDao = CategoriesDao();
  Future getAllCategoriess({String query}) => categoriesDao.getCategoriess(query: query);
  Future insertCategories(Categories categories) => categoriesDao.createCategories(categories);
}
