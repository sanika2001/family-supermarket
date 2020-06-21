import 'package:flutter/material.dart';
import 'package:familysupermarket/bloc/categories.dart';

class CategoriesCard extends StatelessWidget {
  final Categories categories;

  CategoriesCard({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Image(
              image: AssetImage(categories.image),
              height: 35,
              width: 35,
              color: Color(0xFF740F53),
            ),
          ),
        ),
        Expanded(
          child: Text(
            categories.name,
            style: TextStyle(
              color: Color(0xFF5A5A5A),
            ),
          ),
        ),
      ],
    );
  }
}
