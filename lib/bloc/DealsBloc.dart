import 'dart:async';
import 'package:familysupermarket/bloc/deals.dart';

class DealsBloc{
  List<Deals> _dealsList = [
    Deals("https://images.app.goo.gl/pTHGixAYTU6aX46W7"),
    Deals("https://images.app.goo.gl/jReeivGAc66X272r6"),
    Deals("https://images.app.goo.gl/Y8chKduSHXxQV4uB8")
  ];

  final _dealsListStreamController = StreamController<List<Deals>>();

  Stream<List<Deals>> get dealsListStream =>
      _dealsListStreamController.stream;
  StreamSink<List<Deals>> get dealsListSink =>
      _dealsListStreamController.sink;

  DealsBloc(){
    _dealsListStreamController.add(_dealsList);
  }

  void dispose(){
    _dealsListStreamController.close();
  }
}