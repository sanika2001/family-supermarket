import 'package:flutter/material.dart';
import 'package:familysupermarket/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PurpleButton extends StatelessWidget {
  bool isPressed;
  PurpleButton({this.isPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: kDesignColor,
        onPressed: () {},
        child: isPressed
            ? Icon(
                FontAwesomeIcons.check,
                color: Colors.white,
                size: 18,
              )
            : Text(""),
      ),
    );
  }
}
