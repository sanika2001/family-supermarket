import 'package:familysupermarket/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/components/bottomNavigationBar.dart';
import 'package:familysupermarket/bloc/ComponentsBloc.dart';
import 'package:familysupermarket/models/components.dart';
import 'package:familysupermarket/components/componentsCard.dart';
import 'package:familysupermarket/db/components.dart';

class FamilyScreen extends StatefulWidget {
  static const String id = '/family';
  @override
  _FamilyScreenState createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  final ComponentsBloc _componentsBloc = ComponentsBloc();

  DatabaseProvider _databaseProvider = DatabaseProvider();
  var database;

  Future getDB() async {
    database = await _databaseProvider.createDatabase();
    await _databaseProvider.insertDB(database);
  }

  @override
  void initState() {
    super.initState();
    getDB();
  }

  @override
  void dispose() {
    _componentsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: ClippingClass(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 240.0,
                color: Color(0xFF740F53),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("images/family.png"),
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Container(
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Text(
                        "CATEGORIES",
                        style: TextStyle(
                          color: Color(0xFF741053),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 450,
                      color: Color(0xFFE9E9E9),
                      child: StreamBuilder<List<Components>>(
                          stream: _componentsBloc.componentss,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Components>> snapshot) {
                            if (snapshot.hasError) {
                              print(snapshot.error);
                            }
                            return snapshot.hasData
                                ? GridView.builder(
                                    itemCount: snapshot.data.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 1,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ComponentsCard(
                                        components: snapshot.data[index],
                                        move: () {
                                          setState(() {
                                            Navigator.pushNamed(
                                                context, homeScreen.id);
                                          });
                                        },
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
            ),
          ],
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 25);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 25);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
