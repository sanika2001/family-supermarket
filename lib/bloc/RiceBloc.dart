import 'dart:async';
import 'package:familysupermarket/models/rice.dart';
import 'package:familysupermarket/repository/rice.dart';

class RiceBloc {
  final _riceListStreamController = StreamController<List<Rice>>();

  Stream<List<Rice>> get riceListStream => _riceListStreamController.stream;
  StreamSink<List<Rice>> get riceListSink => _riceListStreamController.sink;

  RiceBloc() {
    _riceListStreamController.add(riceList);
  }

  void dispose() {
    _riceListStreamController.close();
  }
}
