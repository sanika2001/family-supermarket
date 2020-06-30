import 'package:flutter/material.dart';
import 'package:familysupermarket/models/components.dart';

class ComponentsCard extends StatelessWidget {

  final Components components;

  ComponentsCard({@required this.components});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: FlatButton(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Image(
                  image: AssetImage(components.image),
                  height: 40,
                  width: 40,
                  color: Color(0xFF740F53),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Expanded(
            child: Text(
              components.name,
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
