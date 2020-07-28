import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/bloc/homeBloc.dart';
import 'package:familysupermarket/models/home.dart';
import 'package:familysupermarket/components/homeCard.dart';
import 'package:familysupermarket/constants.dart';
import 'package:familysupermarket/bloc/FlourBloc.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:familysupermarket/components/bottomNavigationBar.dart';
import 'package:familysupermarket/screens/RiceScreen.dart';
import 'package:familysupermarket/screens/FlourScreen.dart';

int cupertinoTabBarValue = 0;

class homeScreen extends StatefulWidget {
  static const String id = '/home';
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final HomeBloc _homeBloc = HomeBloc();

  final FlourBloc _flourBloc = FlourBloc();

  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  void dispose() {
    _homeBloc.dispose();
    _flourBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: BottomBar(),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
          ),
          elevation: 5,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image(
            image: AssetImage("images/logo1.png"),
            height: 150,
            width: 150,
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
                    indicator: RectangularIndicator(
                      color: Colors.grey,
                      paintingStyle: PaintingStyle.fill,
                      bottomLeftRadius: 0,
                      bottomRightRadius: 0,
                      topLeftRadius: 0,
                      topRightRadius: 0,
                    ),
                    indicatorColor: kDesignColor,
                    isScrollable: true,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                    tabs: [
                      Tab(
                        text: "Rice",
                      ),
                      Tab(
                        text: "Flour & Atta",
                      ),
                      Tab(
                        text: "Dal & Pulses",
                      ),
                      Tab(
                        text: "Spices & Masala",
                      ),
                      Tab(
                        text: "Chocolates",
                      ),
                    ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 130,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  children: <Widget>[
                    RiceScreen(),
                    FlourScreen(),
                    Container(),
                    Container(),
                    Container(),
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
