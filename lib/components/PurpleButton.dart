import 'package:flutter/material.dart';
import 'package:familysupermarket/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PurpleButton extends StatelessWidget {
  final bool isPressed;
  final Function onPress;
  PurpleButton({this.isPressed, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 47,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: kDesignColor,
          disabledColor: kDesignColor,
          child: isPressed
              ? Icon(
                  FontAwesomeIcons.check,
                  color: Colors.white,
                  size: 18,
                )
              : Text(""),
        ),
      ),
    );
  }
}
