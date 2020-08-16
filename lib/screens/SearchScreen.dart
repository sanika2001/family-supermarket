import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/components/searchCard.dart';

class SearchScreen extends StatefulWidget {
  static const String id = '/search';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Image(
          image: AssetImage("images/logo1.png"),
          height: 130,
          width: 150,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF939393),
                        ),
                        filled: true,
                        fillColor: Color(0xFFE9E9E9),
                      ),
                    ),
//                    child: ButtonTheme(
//                      minWidth: 100,
//                      child: RaisedButton(
//                        elevation: 25,
//                        color: Color(0xFFE9E9E9),
//                        onPressed: () {},
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(10),
//                        ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Text(
//                                "Search",
//                                style: TextStyle(
//                                  fontSize: 18,
//                                  fontWeight: FontWeight.bold,
//                                  color: Color(0xFF939393),
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width - 107,
                    top: 0,
                    child: ButtonTheme(
                      minWidth: 50,
                      height: 45,
                      child: RaisedButton(
                        elevation: 5,
                        color: Color(0xFF740F53),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                "Quick Pick",
                style: TextStyle(
                  color: Color(0xFF939393),
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SearchCard(
                      name: "Detergents & Dishwash",
                    ),
                  ),
                  Expanded(
                    child: SearchCard(
                      name: "Handwash & others",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SearchCard(
                      name: "Oral Care",
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: SearchCard(
                      name: "Tea, Coffee & Milk",
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SearchCard(
                      name: "Biscuits & Rusks",
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: SearchCard(
                      name: "Body Care",
                    ),
                    flex: 4,
                  ),
                ],
              ),
            ),
            MediaQuery.of(context).viewInsets.bottom == 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SearchCard(
                            name: "Instant Foods & Mixes",
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: SearchCard(
                            name: "Chocolates & Candies",
                          ),
                          flex: 3,
                        ),
                      ],
                    ),
                  )
                : Row(),
          ],
        ),
      ),
    );
  }
}
