import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  static const String id = '/home';
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("images/logo.png"),
              height: 60,
              width: 60,
            ),
            Text(
              "FAMILY",
              style: TextStyle(
                color: Color(0xFF740F53),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
