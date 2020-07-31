import 'package:familysupermarket/models/rice.dart';
import 'package:familysupermarket/db/Flour_dao.dart';

class FlourRepository {
  final flourDao = FlourDao();
  Future getAllFlours({String query}) => flourDao.getFlours(query: query);
  Future insertFlour(Rice flour) => flourDao.createFlour(flour);
}

//List<Rice> flourList = [
//  Rice("https://images-na.ssl-images-amazon.com/images/I/71CAb58u8TL._SL1313_.jpg","Aashirvaad Atta","₹ 40.00","₹ 32.00",0,1),
//  Rice("https://www.periyarrice.com/images/rice_products2.png", "Periyar Atta","₹ 40.00", "₹ 60.00",0, 1),
//  Rice("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQIXENIUsCLa8rU90YdPSm2rMDAkVUUhoxNDA&usqp=CAU","Double Horse Atta","₹ 40.00","₹ 60.00",0,1),
//  Rice(
//      "https://www.freshopy.com/image/cache/catalog/Rice/Rice/Periyar%20Sortex%20Vadi%20Rice%205kg.jpg","Periyar Atta1","₹ 40.00","₹ 32.00",0,1),
//];
