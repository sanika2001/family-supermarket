import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/bloc/homeBloc.dart';
import 'package:familysupermarket/models/home.dart';
import 'package:familysupermarket/components/homeCard.dart';
import 'package:familysupermarket/constants.dart';
import 'package:familysupermarket/bloc/RiceBloc.dart';
import 'package:familysupermarket/components/riceCard.dart';
import 'package:familysupermarket/models/rice.dart';

int cupertinoTabBarValue = 0;

class homeScreen extends StatefulWidget {
  static const String id = '/home';
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final HomeBloc _homeBloc = HomeBloc();
  final RiceBloc _riceBloc = RiceBloc();

  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  void dispose() {
    _homeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("images/logo.png"),
                height: 60,
                width: 60,
              ),
              Text(
                "FAMILY",
                style: TextStyle(
                  color: Color(0xFF740F53),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 128,
                color: Color(0xFFE9E9E9),
                child: StreamBuilder<List<Home>>(
                    stream: _homeBloc.homeListStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Home>> snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }
                      return snapshot.hasData
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return HomeCard(
                                  home: snapshot.data[index],
                                );
                              })
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    }),
              ),
              Container(
                color: kDesignColor,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                    indicatorColor: kDesignColor,
                    isScrollable: true,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    tabs: [
                      Tab(
                        text: "Rice",
                      ),
                      Tab(
                        text: "Flour&Atta",
                      ),
                      Tab(
                        text: "Dal&Pulses",
                      ),
                      Tab(
                        text: "Spices&Masala",
                      ),
                    ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 130,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        height: 500,
                        child: StreamBuilder<List<Rice>>(
                            stream: _riceBloc.riceListStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Rice>> snapshot) {
                              if (snapshot.hasError) {
                                print(snapshot.error);
                              }
                              return snapshot.hasData
                                  ? ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: snapshot.data.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return RiceCard(
                                          rice: snapshot.data[index],
                                        );
                                      })
                                  : Center(
                                      child: CircularProgressIndicator(),
                                    );
                            }),
                      ),
                    ),
                    Container(
                      child: Text("Atta&Flourr"),
                    ),
                    Container(
                      child: Text("Dal&Pulses"),
                    ),
                    Container(
                      child: Text("Spices&Masala"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Container(
//height: 500,
//child: StreamBuilder<List<Rice>>(
//stream: _riceBloc.riceListStream,
//builder: (BuildContext context,
//    AsyncSnapshot<List<Rice>> snapshot) {
//if (snapshot.hasError) {
//print(snapshot.error);
//}
//return snapshot.hasData
//? ListView.builder(
//physics: BouncingScrollPhysics(),
//itemCount: snapshot.data.length,
//scrollDirection: Axis.vertical,
//itemBuilder: (context, index) {
//return RiceCard(
//rice: snapshot.data[index],
//);
//})
//    : Center(
//child: CircularProgressIndicator(),
//);
//}),
//),
