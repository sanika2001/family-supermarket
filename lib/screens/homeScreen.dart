import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/bloc/homeBloc.dart';
import 'package:familysupermarket/models/home.dart';
import 'package:familysupermarket/components/homeCard.dart';
import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
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
    _riceBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CupertinoTabBar.CupertinoTabBar(
              Color(0xFF740F53),
              Color(0xFFC4C4C4),
              [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Rice",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Flour & Atta",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Dal & Pulses",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Spices & Masala",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              cupertinoTabBarValueGetter,
              (int index) {
                setState(() {
                  cupertinoTabBarValue = index;
                  print(cupertinoTabBarValue);
                });
              },
              horizontalPadding: 0,
              verticalPadding: 10,
              useSeparators: false,
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
