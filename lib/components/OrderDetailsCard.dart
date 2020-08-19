import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OrderDetailsCard extends StatelessWidget {
  final String img;
  final String name;
  final String price;

  OrderDetailsCard({this.price, this.name, this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "₹ ${price}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          CachedNetworkImage(
            imageUrl: img,
            height: 68,
            width: 80,
          ),
        ],
      ),
    );
  }
}
