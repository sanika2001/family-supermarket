import 'package:flutter/material.dart';
import 'package:familysupermarket/components/catagoriesCard.dart';
import 'package:familysupermarket/components/dealsCard.dart';
import 'package:familysupermarket/components/productsCard.dart';
import 'package:familysupermarket/components/bottomNavigationBar.dart';
import 'package:familysupermarket/screens/familyScreen.dart';
import 'package:familysupermarket/screens/homeScreen.dart';
import 'package:familysupermarket/screens/locationScreen.dart';
import 'package:familysupermarket/bloc/CategoriesBloc.dart';
import 'package:familysupermarket/bloc/DealsBloc.dart';
import 'package:familysupermarket/bloc/ProductsBloc.dart';
import 'package:familysupermarket/models/categories.dart';
import 'package:familysupermarket/models/deals.dart';
import 'package:familysupermarket/models/products.dart';
import 'package:familysupermarket/repository/swiperList.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:familysupermarket/db/categories.dart';
import 'package:familysupermarket/db/Dealsdb.dart';
import 'package:familysupermarket/db/Productsdb.dart';

class SupermarketScreen extends StatefulWidget {
  static const String id = '/supermarket';
  @override
  _SupermarketScreenState createState() => _SupermarketScreenState();
}

class _SupermarketScreenState extends State<SupermarketScreen> {
  final CategoriesBloc _categoriesBloc = CategoriesBloc();
  final DealsBloc _dealsBloc = DealsBloc();
  final ProductsBloc _productsBloc = ProductsBloc();

  DatabaseProvider _databaseProvider = DatabaseProvider();
  DatabaseProvider1 _databaseProvider1 = DatabaseProvider1();
  var database1;
  DatabaseProvider2 _databaseProvider2 = DatabaseProvider2();
  var database2;
  var database;

  Future getDB() async {
    database2 = await _databaseProvider2.createDatabase();
    await _databaseProvider2.insertDB(database2);
    database = await _databaseProvider.createDatabase();
    await _databaseProvider.insertDB(database);
    database1 = await _databaseProvider1.createDatabase();
    await _databaseProvider1.insertDB(database1);
  }

  @override
  void initState() {
    super.initState();
    getDB();
  }

  @override
  void dispose() {
    _categoriesBloc.dispose();
    _dealsBloc.dispose();
    _productsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/logo.png"),
                      height: 60,
                      width: 60,
                    ),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, locationScreen.id);
                              });
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Your location",
                                  style: TextStyle(
                                    color: Color(0xFF939393),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width - 125,
                            top: 1,
                            child: CircleAvatar(
                              radius: 23,
                              backgroundColor: Color(0xFFA63F85),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Carousel(
                  images: offerSwiperList,
                  showIndicator: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'SHOP BY CATEGORIES',
                      style: TextStyle(
                        color: Color(0xFF740F53),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text(
                            'See More',
                            style: TextStyle(
                                color: Color(0xFF740F53),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, FamilyScreen.id);
                            });
                          },
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF740F53),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 128,
                color: Color(0xFFE9E9E9),
                child: StreamBuilder<List<Categories>>(
                    stream: _categoriesBloc.categoriess,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Categories>> snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }
                      return snapshot.hasData
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoriesCard(
                                  categories: snapshot.data[index],
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Best Deals',
                  style: TextStyle(
                    color: Color(0xFF740F53),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 120,
                child: StreamBuilder<List<Deals>>(
                  stream: _dealsBloc.dealss,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Deals>> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    return snapshot.hasData
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return DealsCard(
                                deals: snapshot.data[index],
                              );
                            })
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Best Products',
                  style: TextStyle(
                    color: Color(0xFF740F53),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 120,
                child: StreamBuilder<List<Products>>(
                  stream: _productsBloc.productss,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Products>> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    return snapshot.hasData
                        ? ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ProductsCard(
                                products: snapshot.data[index],
                              );
                            })
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
