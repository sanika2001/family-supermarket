import 'package:flutter/material.dart';

class DeliveryStatus extends StatelessWidget {
  final String text;
  final String date;

  DeliveryStatus({@required this.text, @required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 19),
          ),
          Text(
            date,
            style: TextStyle(color: Colors.black54, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
