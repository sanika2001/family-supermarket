import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:familysupermarket/models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  double rating = 0;
  String name;
  String date;
  String image;

  OrderCard({this.name,this.date,this.image,this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                      imageUrl:
                      order.image,
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
                },
                starCount: 5,
                size: 40.0,
                isReadOnly: false,
                color: Colors.green,
                borderColor: Colors.grey,
                spacing: 10.0,
                rating: rating,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
