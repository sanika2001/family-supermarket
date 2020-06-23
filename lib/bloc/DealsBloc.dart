import 'dart:async';
import 'package:familysupermarket/bloc/deals.dart';

class DealsBloc{
  List<Deals> _dealsList = [
    Deals("https://n4.sdlcdn.com/imgs/i/e/n/Octavius-Assam-Black-Tea-Powder-SDL618288203-1-851d8.jpg"),
    Deals("https://assets.indiadesire.com/images/tresemmecobooffer.jpg"),
    Deals("https://images-na.ssl-images-amazon.com/images/I/61hMdXPJqYL._SY355_.jpg")
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