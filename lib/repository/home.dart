import 'package:familysupermarket/models/home.dart';
import 'package:familysupermarket/db/home_dao.dart';

class HomeRepository {
  final homeDao = HomeDao();
  Future getAllHomes({String query}) => homeDao.getHomes(query: query);
  Future insertHome(Home home) => homeDao.createHome(home);
}

//List<Home> homeList = [
//  Home("images/wheat.png", "Food Grains,Oils & Masala", 1),
//  Home("images/instant.png", "Instant Foods", 2),
//  Home("images/snacks.png", "Snacks & Confectionary", 3),
//  Home("images/tea.png", "Beverages", 4),
//  Home("images/cleaning.png", "Household & Cleaning", 5),
//  Home("images/cream.png", "Beauty & Personal Care", 6),
//  Home("images/baby.png", "Baby Food & Care", 7),
//  Home("images/stationary.png", "Stationary", 8),
//  Home("images/more.png", "Others", 9),
//];
