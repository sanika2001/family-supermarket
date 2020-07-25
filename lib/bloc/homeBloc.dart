import 'package:familysupermarket/models/home.dart';
import 'dart:async';
import 'package:familysupermarket/repository/home.dart';

class HomeBloc {


  final _homeListStreamController = StreamController<List<Home>>();

  Stream<List<Home>> get homeListStream =>
      _homeListStreamController.stream;
  StreamSink<List<Home>> get homeListSink =>
      _homeListStreamController.sink;

  HomeBloc(){
    _homeListStreamController.add(homeList);
  }

  void dispose() {
    _homeListStreamController.close();
  }
}

