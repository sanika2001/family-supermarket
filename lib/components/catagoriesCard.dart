import 'package:flutter/material.dart';
import 'package:familysupermarket/models/categories.dart';

class CategoriesCard extends StatelessWidget {
  final Categories categories;
  final Function move;

  CategoriesCard({@required this.categories,this.move});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: GestureDetector(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Image(
                  image: AssetImage(categories.image),
                  height: 40,
                  width: 40,
                  color: Color(0xFF740F53),
                ),
              ),
              onTap: move,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Expanded(
            child: Text(
              categories.name,
              style: TextStyle(
                color: Color(0xFF5A5A5A),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
