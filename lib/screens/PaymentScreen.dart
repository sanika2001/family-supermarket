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
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelStyle:
                TextStyle(color: kDesignColor, fontWeight: FontWeight.w500),
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
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text("one"),
            ),
            Center(
              child: Text("two"),
            ),
          ],
        ),
      ),
    );
  }
}
