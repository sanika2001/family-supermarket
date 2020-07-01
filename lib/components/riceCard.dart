import 'package:flutter/material.dart';
import 'package:familysupermarket/models/rice.dart';

class RiceCard extends StatelessWidget {

  final Rice rice;

  RiceCard({@required this.rice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(rice.image),
                height: 65,
                width: 55,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  rice.ricename,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                ButtonTheme(
                  minWidth: 110,
                  height: 10,
                  child: RaisedButton(
                    color: Color(0xFFE9E9E9),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("1 Kg"),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF5A5A5A),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  rice.price,
                  style: TextStyle(
                    color: Color(0xFFC4C4C4),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  rice.rate,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            ButtonTheme(
              child: RaisedButton(
                color: Color(0xFF5A5A5A),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "ADD",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
