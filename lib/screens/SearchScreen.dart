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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("images/logo.png"),
              height: 50,
              width: 60,
            ),
            Text(
              "FAMILY",
              style: TextStyle(
                color: Color(0xFF740F53),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ButtonTheme(
                minWidth: 100,
                child: RaisedButton(
                  elevation: 25,
                  color: Color(0xFFE9E9E9),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF939393),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 40,
                        height: 45,
                        child: RaisedButton(
                          color: Color(0xFF740F53),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          onPressed: (){},
                        ),
                      ),
                    ],
                  ),
                ),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SearchCard(name: "Detergents & Dishwash",width: 100,),
                  SearchCard(name: "Handwash & others",width: 100,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                children: <Widget>[
                  SearchCard(name: "Oral Care",width: 150,),
                  SearchCard(name: "Tea, Coffee & Milk",width: 200,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                children: <Widget>[
                  SearchCard(name: "Biscuits & Rusks",width: 200,),
                  SearchCard(name: "Body Care",width: 150,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                children: <Widget>[
                  SearchCard(name: "Instant Foods & Mixes",width: 100,),
                  SearchCard(name: "Choclates &Candies",width: 100,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
