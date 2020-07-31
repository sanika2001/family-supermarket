import 'package:familysupermarket/models/components.dart';
import 'package:familysupermarket/db/components_dao.dart';

class ComponentsRepository {
  final componentsDao = ComponentsDao();
  Future getAllComponentss({String query}) => componentsDao.getComponentss(query: query);
  Future insertComponents(Components components) => componentsDao.createComponents(components);
}


//List<Components> componentsList = [
//  Components("images/wheat.png", "Food Grains & Oils"),
//  Components("images/instant.png", "Instant Foods"),
//  Components("images/snacks.png", "Confectionary"),
//  Components("images/tea.png", "Beverages"),
//  Components("images/cleaning.png", "Household Cleaning"),
//  Components("images/cream.png", "Beauty & Personal"),
//  Components("images/baby.png", "Baby Food & Care"),
//  Components("images/stationary.png", "Stationary"),
//  Components("images/more.png", "Others"),
//];
