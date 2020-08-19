import 'package:flutter/material.dart';
import 'package:familysupermarket/models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  double rating = 0;
  String name;
  String date;
  String image;
  Function onPress;

  OrderCard({this.name, this.date, this.image, this.order, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onPress,
        child: Card(
          elevation: 15,
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
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              order.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              order.date,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              order.image,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage("images/logo.png"),
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[200],
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
