import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final String text1;
  final String text2;

  PriceCard({this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text1,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          Text(
            "₹$text2",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
