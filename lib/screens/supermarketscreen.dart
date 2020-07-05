import 'package:familysupermarket/components/catagoriesCard.dart';
import 'package:familysupermarket/components/dealsCard.dart';
import 'package:familysupermarket/components/productsCard.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/components/bottomNavigationBar.dart';
import 'package:familysupermarket/constants.dart';
import 'package:familysupermarket/bloc/CategoriesBloc.dart';
import 'package:familysupermarket/bloc/DealsBloc.dart';
import 'package:familysupermarket/bloc/ProductsBloc.dart';
import 'package:familysupermarket/models/categories.dart';
import 'package:familysupermarket/models/deals.dart';
import 'package:familysupermarket/models/products.dart';

class SupermarketScreen extends StatefulWidget {
  static const String id = '/supermarket';
  @override
  _SupermarketScreenState createState() => _SupermarketScreenState();
}

class _SupermarketScreenState extends State<SupermarketScreen> {
  final CategoriesBloc _categoriesBloc = CategoriesBloc();
  final DealsBloc _dealsBloc = DealsBloc();
  final ProductsBloc _productsBloc = ProductsBloc();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
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
                        TextField(
                          textAlign: TextAlign.start,
                          decoration: kTextFieldDecoration,
                        ),
                        Positioned(
                          left: 238,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/sale.jpg'),
                  fit: BoxFit.fill,
                ),
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
                      Text(
                        'See More',
                        style: TextStyle(
                            color: Color(0xFF740F53),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
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
                  stream: _categoriesBloc.categoriesListStream,
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
                stream: _dealsBloc.dealsListStream,
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
                stream: _productsBloc.productsListStream,
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
    );
  }
}
