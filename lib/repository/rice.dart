import 'package:familysupermarket/models/rice.dart';
import 'package:familysupermarket/db/Rice_dao.dart';

class RiceRepository {
  final riceDao = RiceDao();
  Future getAllRices({String query}) => riceDao.getRices(query: query);
  Future insertRice(Rice rice) => riceDao.createRice(rice);
}

//List<Rice> riceList = [
//  Rice("https://www.periyarrice.com/images/slider2_pro1.png", "Periyar Rice",
//      "₹ 40.00", "₹ 32.00", false, 1),
//  Rice("https://www.periyarrice.com/images/rice_products2.png", "Periyar Matta",
//      "₹ 40.00", "₹ 60.00", false, 1),
//  Rice(
//      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQIXENIUsCLa8rU90YdPSm2rMDAkVUUhoxNDA&usqp=CAU","Periyar Rice","₹ 40.00","₹ 60.00",false,1),
//  Rice("https://www.freshopy.com/image/cache/catalog/Rice/Rice/Periyar%20Sortex%20Vadi%20Rice%205kg.jpg","Periyar Rice2","₹ 40.00","₹ 32.00",0,1),
//];
