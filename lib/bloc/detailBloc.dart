import 'package:familysupermarket/models/detail.dart';
import 'dart:async';
import 'package:familysupermarket/repository/detail.dart';

class DetailBloc {
  final _detailRepository = DetailRepository();

  final _detailController = StreamController<List<Detail>>();

  get details => _detailController.stream;

  DetailBloc() {
    getDetails();
  }

  getDetails({String query}) async {
    _detailController.sink.add(await _detailRepository.getAllDetails(query: query));
  }

  addDetail(Detail detail) async {
    await _detailRepository.insertDetail(detail);
    getDetails();
  }

  dispose() {
    _detailController.close();
  }
}
