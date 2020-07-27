import 'package:flutter/material.dart';
import 'package:familysupermarket/components/PurpleButton.dart';

class SelfPickupCard extends StatelessWidget {
  final String text;
  final bool isPressed;

  SelfPickupCard({@required this.isPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    color: Color(0xFF464646),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              PurpleButton(
                isPressed: isPressed,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            color: Color(0xFF464646),
          ),
        ),
      ],
    );
  }
}
