import 'package:flutter/material.dart';
import 'package:familysupermarket/components/PurpleButton.dart';

class SelfPickupCard extends StatelessWidget {
  final String text;
  final bool isPressed;
  final Function onPress;

  SelfPickupCard({this.isPressed, @required this.text, this.onPress});

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
                    color: Color(0xFF5A5A5A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              PurpleButton(
                isPressed: isPressed,
                onPress: onPress,
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
