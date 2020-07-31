import 'package:familysupermarket/models/deals.dart';
import 'package:familysupermarket/db/Deals_dao.dart';

class DealsRepository {
  final dealsDao = DealsDao();
  Future getAllDealss({String query}) => dealsDao.getDealss(query: query);
  Future insertDeals(Deals deals) => dealsDao.createDeals(deals);
}

//List<Deals> dealsList = [
//  Deals("https://n4.sdlcdn.com/imgs/i/e/n/Octavius-Assam-Black-Tea-Powder-SDL618288203-1-851d8.jpg"),
//  Deals("https://assets.indiadesire.com/images/tresemmecobooffer.jpg"),
//  Deals("https://images-na.ssl-images-amazon.com/images/I/61hMdXPJqYL._SY355_.jpg")
//];
