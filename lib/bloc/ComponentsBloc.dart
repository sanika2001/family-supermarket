import 'package:familysupermarket/models/components.dart';
import 'dart:async';
import 'package:familysupermarket/repository/components.dart';

class ComponentsBloc {
  final _componentsRepository = ComponentsRepository();

  final _componentsController = StreamController<List<Components>>();

  get componentss => _componentsController.stream;

  ComponentsBloc() {
    getComponentss();
  }

  getComponentss({String query}) async {
    _componentsController.sink.add(await _componentsRepository.getAllComponentss(query: query));
  }

  addComponents(Components components) async {
    await _componentsRepository.insertComponents(components);
    getComponentss();
  }

  dispose() {
    _componentsController.close();
  }
}
