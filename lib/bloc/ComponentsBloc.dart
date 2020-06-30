import 'package:familysupermarket/repository/components.dart';
import 'dart:async';
import 'package:familysupermarket/models/components.dart';

class ComponentsBloc {

  final _componentsListStreamController = StreamController<List<Components>>();

  Stream<List<Components>> get componentsListStream =>
      _componentsListStreamController.stream;
  StreamSink<List<Components>> get categoriesListSink =>
      _componentsListStreamController.sink;

  ComponentsBloc(){
    _componentsListStreamController.add(componentsList);
  }

  void dispose(){
    _componentsListStreamController.close();
  }
}