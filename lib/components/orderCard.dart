import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:familysupermarket/models/order.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:familysupermarket/constants.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  double rating = 0;
  String name;
  String date;
  String image;
  Function onPress;

  OrderCard({this.name, this.date, this.image, this.order, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPress,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              order.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 5,
                                ),
                              ),
                              Text(
                                order.date,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: order.image,
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[200],
                  thickness: 1,
                ),
                SmoothStarRating(
                  allowHalfRating: false,
                  onRated: (v) {
                    v = rating;
                    showToast("Thanks for rating !",
                        context: context,
                        textStyle:
                            TextStyle(fontSize: 17.0, color: Colors.white),
                        borderRadius: BorderRadius.circular(5.0),
                        textPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        duration: Duration(seconds: 3),
                        animDuration: Duration(seconds: 1),
                        alignment: Alignment.center,
                        curve: Curves.fastOutSlowIn,
                        reverseCurve: Curves.fastOutSlowIn,
                        movingOnWindowChange: true,
                        backgroundColor: kDesignColor);
                  },
                  starCount: 5,
                  size: 40.0,
                  isReadOnly: false,
                  color: kDesignColor,
                  borderColor: Colors.grey,
                  spacing: 10.0,
                  rating: rating,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
