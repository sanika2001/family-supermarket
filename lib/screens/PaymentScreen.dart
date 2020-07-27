import 'package:flutter/material.dart';
import 'package:familysupermarket/constants.dart';

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
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 17,
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
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                indicatorColor: Colors.white,
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
                      child: Text("one"),
                      //TODO:add home delivery screen in the place of this center
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Text("two"),
                      //TODO:add pickup screen
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
