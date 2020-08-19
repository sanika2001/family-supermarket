import 'package:familysupermarket/models/detail.dart';
import 'package:familysupermarket/db/detail_dao.dart';

class DetailRepository {
  final detailDao = DetailDao();
  Future getAllDetails({String query}) => detailDao.getDetails(query: query);
  Future insertDetail(Detail detail) => detailDao.createDetail(detail);
}