import 'package:flutter/material.dart';

class loginCard extends StatelessWidget {

  String name;
  loginCard({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: name,
          contentPadding:
          EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color(0xFFC4C4C4), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color(0xFFC4C4C4), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
