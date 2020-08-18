import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/constants.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:familysupermarket/components/DeliveryStatus.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String id = '/orderdetails';
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
        backgroundColor: kDesignColor,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFE9E9E9),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                                  )
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
