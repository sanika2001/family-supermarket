import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image(
          image: AssetImage('images/perfume.jpg'),
          height: 120,
          width: 120,
        ),
      ),
    );
  }
}
