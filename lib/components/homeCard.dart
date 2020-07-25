import 'package:flutter/material.dart';
import 'package:familysupermarket/models/home.dart';

class HomeCard extends StatelessWidget {

  final Home home;
  final Function move;

  HomeCard({@required this.home,this.move});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: FlatButton(
              onPressed: move,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Image(
                  image: AssetImage(home.image),
                  height: 40,
                  width: 40,
                  color: Color(0xFF740F53),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Expanded(
            child: Text(
              home.name,
              style: TextStyle(
                color: Color(0xFF464646),
              ),
            ),
          ),
        ),
      ],
    );
  }
}