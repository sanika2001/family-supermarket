import 'package:flutter/material.dart';
import 'package:familysupermarket/models/rice.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RiceCard extends StatelessWidget {
  final Rice rice;
  final Function popup;
  final Function addTap;
  final Function cancelAdd;
  final Function plus;
  final Function minus;

  RiceCard(
      {@required this.rice,
      this.popup,
      this.addTap,
      this.cancelAdd,
      this.plus,
      this.minus});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: rice.image,
                height: 70,
                width: 70,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  rice.ricename,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                ButtonTheme(
                  minWidth: 110,
                  height: 10,
                  child: RaisedButton(
                    color: Color(0xFFE9E9E9),
                    disabledColor: Color(0xFFE9E9E9),
                    onPressed: popup,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text("1 Kg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF5A5A5A),
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  rice.price,
                  style: TextStyle(
                    color: Color(0xFFC4C4C4),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  rice.rate,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: cancelAdd,
              child: Column(
                children: <Widget>[
                  rice.pressed
                      ? Card(
                          elevation: 5,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: minus,
                                child: Container(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 17,
                                  ),
                                  height: 23,
                                  width: 24,
                                  color: Color(0xFF5A5A5A),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.symmetric(
                                    vertical:
                                        BorderSide(color: Color(0xFF5A5A5A)),
                                  ),
                                ),
                                height: 23,
                                width: 30,
                                child: Center(child: Text("${rice.qty}")),
                              ),
                              GestureDetector(
                                onTap: plus,
                                child: Container(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 17,
                                  ),
                                  height: 23,
                                  width: 24,
                                  color: Color(0xFF5A5A5A),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ButtonTheme(
                          child: RaisedButton(
                            color: Color(0xFF5A5A5A),
                            onPressed: addTap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
