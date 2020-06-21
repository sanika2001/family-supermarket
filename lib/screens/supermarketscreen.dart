import 'package:familysupermarket/components/catagoriesCard.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/components/bottomNavigationBar.dart';
import 'package:familysupermarket/constants.dart';
import 'package:familysupermarket/bloc/categories.dart';
import 'package:familysupermarket/bloc/CategoriesBloc.dart';

class SupermarketScreen extends StatefulWidget {
  static const String id = '/supermarket';
  @override
  _SupermarketScreenState createState() => _SupermarketScreenState();
}

class _SupermarketScreenState extends State<SupermarketScreen> {
  final CategoriesBloc _categoriesBloc = CategoriesBloc();

  @override
  void dispose() {
    _categoriesBloc.dispose();
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.flight_land,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: kTextFieldDecoration,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 21,
                    backgroundColor: Color(0xFFA63F85),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
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
              height: 1,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image(
                  image: AssetImage('images/combo.jpg'),
                  height: 120,
                  width: 120,
                ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image(
                  image: AssetImage('images/perfume.jpg'),
                  height: 120,
                  width: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
