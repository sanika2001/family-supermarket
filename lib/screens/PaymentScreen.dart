import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/constants.dart';
import 'package:familysupermarket/screens/HomeDeliveryScreen.dart';
import 'package:familysupermarket/screens/SelfPickUpScreen.dart';

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
          leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 23,
            ),
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
                  fontSize: 16,
                ),
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
              height: MediaQuery.of(context).size.height - 134,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                children: <Widget>[
                  HomeDeliveryScreen(),
                  SelfPickUpScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
