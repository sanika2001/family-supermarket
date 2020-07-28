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
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Expanded(
            child: FlatButton(
              onPressed: move,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
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
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Expanded(
            child: Text(
              categories.name,
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
