import 'package:flutter/material.dart';

class signinCard extends StatelessWidget {
  final String name;
  final Function onPress;

  signinCard({@required this.name, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: ButtonTheme(
        minWidth: 140,
        child: RaisedButton(
          color: Color(0xFF740F53),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            name,
          ),
          textColor: Colors.white,
          onPressed: onPress,
        ),
      ),
    );
  }
}
