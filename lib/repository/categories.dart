import 'package:familysupermarket/models/categories.dart';
import 'package:familysupermarket/db/categories_dao.dart';

class CategoriesRepository {
  final categoriesDao = CategoriesDao();
  Future getAllCategoriess({String query}) => categoriesDao.getCategoriess(query: query);
  Future insertCategories(Categories categories) => categoriesDao.createCategories(categories);
}


//List<Categories> categoriesList = [
//  Categories("images/wheat.png", "Food Grains,Oils & Masala"),
//  Categories("images/instant.png", "Instant Foods"),
//  Categories("images/snacks.png", "Snacks & Confectionary"),
//  Categories("images/cleaning.png", "Household Cleaning")
//];