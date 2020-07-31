import 'dart:async';
import 'package:familysupermarket/repository/flour.dart';
import 'package:familysupermarket/models/rice.dart';

class FlourBloc {
  final _flourRepository = FlourRepository();

  final _flourController = StreamController<List<Rice>>();

  get flours => _flourController.stream;

  FlourBloc() {
    getFlours();
  }

  getFlours({String query}) async {
    _flourController.sink
        .add(await _flourRepository.getAllFlours(query: query));
  }

  addRice(Rice flour) async {
    await _flourRepository.insertFlour(flour);
    getFlours();
  }

  dispose() {
    _flourController.close();
  }
}

//class FlourBloc {
//  final _flourListStreamController = StreamController<List<Rice>>();
//
//  Stream<List<Rice>> get flourListStream => _flourListStreamController.stream;
//  StreamSink<List<Rice>> get flourListSink => _flourListStreamController.sink;
//
//  FlourBloc() {
//    _flourListStreamController.add(flourList);
//  }
//
//  void dispose() {
//    _flourListStreamController.close();
//  }
//}
