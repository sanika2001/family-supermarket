import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/constants.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:familysupermarket/components/DeliveryStatus.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String id = '/orderdetails';
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double rating = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
        backgroundColor: kDesignColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFE9E9E9),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Periyar Rice",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "seller: Seller name",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "₹ 32.00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  "https://www.periyarrice.com/images/slider2_pro1.png",
                              height: 120,
                              width: 120,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 25),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 200,
                              child: StepProgressIndicator(
                                totalSteps: 4,
                                direction: Axis.vertical,
                                currentStep: 3,
                                selectedColor: kDesignColor,
                                unselectedColor: Colors.grey,
                                size: 8,
                                padding: 1,
                                roundedEdges: Radius.circular(10),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  DeliveryStatus(
                                    text: "Ordered",
                                    date: "Tue, 28th Jan'20  8:00 AM",
                                  ),
                                  DeliveryStatus(
                                    text: "Packed",
                                    date: "Tue, 28th Jan'20  9:00 AM",
                                  ),
                                  DeliveryStatus(
                                    text: "Shipped",
                                    date: "Tue, 28th Jan'20  9:30 AM",
                                  ),
                                  DeliveryStatus(
                                    text: "Delivery",
                                    date: "Expected\nTue, 28th Jan'20",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SmoothStarRating(
                          allowHalfRating: false,
                          onRated: (v) {
                            v = rating;
                            showToast("Thanks for rating !",
                                context: context,
                                textStyle: TextStyle(
                                    fontSize: 17.0, color: Colors.white),
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
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Need help?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Shopping Details",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "Aleena Thomas",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          "Aleena house\nKannapuram\nKannur-670331",
                          style: TextStyle(fontSize: 15),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Phone number :",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                              Text(
                                " 987456321",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
