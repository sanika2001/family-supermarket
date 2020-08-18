import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class OrderScreen extends StatefulWidget {
  static const String id = '/order';
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 0,
        title: Text(
          "MY ORDERS",
          style: TextStyle(
            color: Color(0xFF740F53),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.orange[200],
            size: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.orange[200],
              size: 22,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Aashirvaad Atta",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 5,
                                    ),
                                  ),
                                  Text(
                                    "Deleivered on Feb 01",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage("images/wheat.png"),
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[200],
                      thickness: 1,
                    ),
                    SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (v){
                          v = rating;
                        },
                        starCount: 5,
                        size: 40.0,
                        isReadOnly:false,
                        color: Colors.green,
                        borderColor: Colors.grey,
                        spacing:10.0,
                        rating: rating,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Aashirvaad Atta",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 5,
                                    ),
                                  ),
                                  Text(
                                    "Deleivered on Feb 01",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage("images/wheat.png"),
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[200],
                      thickness: 1,
                    ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v){
                        v = rating;
                      },
                      starCount: 5,
                      size: 40.0,
                      isReadOnly:false,
                      color: Colors.green,
                      borderColor: Colors.grey,
                      spacing:10.0,
                      rating: rating,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


