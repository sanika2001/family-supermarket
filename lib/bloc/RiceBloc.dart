import 'dart:async';
import 'package:familysupermarket/models/rice.dart';
import 'package:familysupermarket/repository/rice.dart';

class RiceBloc {
  final _riceRepository = RiceRepository();

  final _riceController = StreamController<List<Rice>>();

  get rices => _riceController.stream;

  RiceBloc() {
    getRices();
  }

  getRices({String query}) async {
    _riceController.sink.add(await _riceRepository.getAllRices(query: query));
  }

  addRice(Rice rice) async {
    await _riceRepository.insertRice(rice);
    getRices();
  }

  dispose() {
    _riceController.close();
  }
}

//class RiceBloc {
//  final _riceListStreamController = StreamController<List<Rice>>();
//
//  Stream<List<Rice>> get riceListStream => _riceListStreamController.stream;
//  StreamSink<List<Rice>> get riceListSink => _riceListStreamController.sink;
//
//  RiceBloc() {
//    _riceListStreamController.add(riceList);
//  }
//
//  void dispose() {
//    _riceListStreamController.close();
//  }
//}
