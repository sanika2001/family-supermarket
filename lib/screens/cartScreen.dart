import 'package:familysupermarket/screens/PaymentScreen.dart';
import 'package:familysupermarket/screens/familyScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/components/cartCard.dart';
import 'package:familysupermarket/bloc/cartBloc.dart';
import 'package:familysupermarket/models/cart.dart';
import 'package:familysupermarket/db/cart.dart';

class CartScreen extends StatefulWidget {
  static const String id = '/cart';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc _cartBloc = CartBloc();
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
    _cartBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "MY CART ",
              style: TextStyle(
                color: Color(0xFF740F53),
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.orangeAccent,
                size: 25,
              ),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 220,
                child: StreamBuilder<List<Cart>>(
                    stream: _cartBloc.carts,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Cart>> snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }
                      return snapshot.hasData
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return CartCard(
                                  cart: snapshot.data[index],
                                  plus: () {
                                    setState(() {
                                      snapshot.data[index].qty++;
                                    });
                                  },
                                  minus: () {
                                    setState(() {
                                      if (snapshot.data[index].qty > 0) {
                                        snapshot.data[index].qty--;
                                      }
                                    });
                                  },
                                  popup: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      context: context,
                                      builder: (BuildContext bc) {
                                        return BottomSheet();
                                      },
                                    );
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
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, FamilyScreen.id);
                    });
                  },
                  child: Card(
                    elevation: 10,
                    color: Color(0xFF740F53),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        "SHOP MORE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF741053),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "TOTAL : ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        " ₹ 116.00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, PaymentScreen.id);
                        });
                      },
                      child: Card(
                        color: Colors.yellowAccent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "CHECKOUT",
                            style: TextStyle(
                              color: Color(0xFF740F53),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 300,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Available Quantities",
                  style: TextStyle(
                    color: Color(0xFF464646),
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xFFC4C4C4),
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "1 kg",
                  style: TextStyle(
                    color: Color(0xFF464646),
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Text(
                  "₹ 32",
                  style: TextStyle(
                    color: Color(0xFF464646),
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xFFC4C4C4),
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "2 kg",
                  style: TextStyle(
                    color: Color(0xFF464646),
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Text(
                  "₹ 60",
                  style: TextStyle(
                    color: Color(0xFF464646),
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xFFC4C4C4),
            thickness: 3,
          ),
        ],
      ),
    );
  }
}
