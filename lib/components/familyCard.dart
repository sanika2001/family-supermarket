import 'package:flutter/material.dart';

class familyCard extends StatelessWidget {

  String name;

  familyCard({this.name});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
                color: Color(0xFF5A5A5A),
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFFA63F85),
            size: 16,
          ),
        ),
      ],
    );
  }
}
