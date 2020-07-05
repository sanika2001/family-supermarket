import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {

  String name;
  double width;

  SearchCard({this.name,this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ButtonTheme(
        minWidth: width,
        height: 45,
        child: RaisedButton(
          color: Color(0xFFA63F85),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
