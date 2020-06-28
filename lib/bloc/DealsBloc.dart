import 'dart:async';
import 'package:familysupermarket/models/deals.dart';
import 'package:familysupermarket/repository/deals.dart';

class DealsBloc{


  final _dealsListStreamController = StreamController<List<Deals>>();

  Stream<List<Deals>> get dealsListStream =>
      _dealsListStreamController.stream;
  StreamSink<List<Deals>> get dealsListSink =>
      _dealsListStreamController.sink;

  DealsBloc(){
    _dealsListStreamController.add(dealsList);
  }

  void dispose(){
    _dealsListStreamController.close();
  }
}