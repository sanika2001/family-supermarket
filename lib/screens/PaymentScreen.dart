import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/constants.dart';
import 'package:familysupermarket/components/SelfPickupCard.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = '/payment';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color(0xFFE9E9E9),
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 23,
          ),
          title: Text(
            "DELIVER & PAYMENT",
            style: TextStyle(
                color: kDesignColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Color(0xFFE9E9E9),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                indicatorColor: Color(0xFFE9E9E9),
                labelStyle: TextStyle(
                    color: kDesignColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                labelColor: kDesignColor,
                tabs: [
                  Tab(
                    text: "HOME DELIVERY",
                  ),
                  Tab(
                    text: "SELF PICKUP",
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 130,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      color: Color(0xFFE9E9E9),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Delivery Address",
                                style: TextStyle(
                                  color: Color(0xFF464646),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Card(
                              elevation: 15,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "House No 27",
                                          style: TextStyle(
                                            color: Color(0xFF5A5A5A),
                                          ),
                                        ),
                                        Text(
                                          "Rouseivalle",
                                          style: TextStyle(
                                            color: Color(0xFF5A5A5A),
                                          ),
                                        ),
                                        Text(
                                          "P.O.BOX 3450",
                                          style: TextStyle(
                                            color: Color(0xFF5A5A5A),
                                          ),
                                        ),
                                        Text(
                                          "Greenland",
                                          style: TextStyle(
                                            color: Color(0xFF5A5A5A),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: Color(0xFF741053),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "ADD NEW",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Color(0xFFE9E9E9),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, top: 15, right: 25),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Payment",
                                  style: TextStyle(
                                      color: Color(0xFF464646),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: <Widget>[
                                      SelfPickupCard(
                                          text: "Wallet/UPI",isPressed: false,),
                                      SelfPickupCard(
                                          text: "Net Banking",
                                          isPressed: false),
                                      SelfPickupCard(
                                          text: "Credit/Debit/ATM card",
                                          isPressed: false),
                                      SelfPickupCard(
                                          text: "Direct Payment",
                                          isPressed: true),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
