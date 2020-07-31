import 'dart:async';
import 'package:familysupermarket/models/deals.dart';
import 'package:familysupermarket/repository/deals.dart';

class DealsBloc {
  final _dealsRepository = DealsRepository();

  final _dealsController = StreamController<List<Deals>>();

  get dealss => _dealsController.stream;

  DealsBloc() {
    getDealss();
  }

  getDealss({String query}) async {
    _dealsController.sink
        .add(await _dealsRepository.getAllDealss(query: query));
  }

  addDeals(Deals deals) async {
    await _dealsRepository.insertDeals(deals);
    getDealss();
  }

  dispose() {
    _dealsController.close();
  }
}
