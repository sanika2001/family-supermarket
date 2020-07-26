import 'package:flutter/material.dart';

class OfferSwiper extends StatelessWidget {
  final String img;
  OfferSwiper({@required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image(
          image: AssetImage(img),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
