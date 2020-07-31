import 'package:familysupermarket/models/home.dart';
import 'dart:async';
import 'package:familysupermarket/repository/home.dart';
import 'package:familysupermarket/db/home.dart';
import 'package:flutter/cupertino.dart';

class HomeBloc {
  final _homeRepository = HomeRepository();

  final _homeController = StreamController<List<Home>>();

  get homes => _homeController.stream;

  HomeBloc() {
    getHomes();
  }

  getHomes({String query}) async {
    _homeController.sink.add(await _homeRepository.getAllHomes(query: query));
  }

  addHome(Home home) async {
    await _homeRepository.insertHome(home);
    getHomes();
  }

  dispose() {
    _homeController.close();
  }
}
