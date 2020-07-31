import 'package:familysupermarket/models/home.dart';
import 'package:familysupermarket/db/home_dao.dart';

class HomeRepository {
  final homeDao = HomeDao();
  Future getAllHomes({String query}) => homeDao.getHomes(query: query);
  Future insertHome(Home home) => homeDao.createHome(home);
}

