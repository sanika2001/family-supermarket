import 'package:flutter/material.dart';
import 'package:familysupermarket/components/PurpleButton.dart';
import 'package:familysupermarket/components/SelfPickupCard.dart';

class SelfPickUpScreen extends StatefulWidget {
  @override
  _SelfPickUpScreenState createState() => _SelfPickUpScreenState();
}

class _SelfPickUpScreenState extends State<SelfPickUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xFFE9E9E9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
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
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: <Widget>[
                          SelfPickupCard(
                            text: "Wallet/UPI",
                            isPressed: false,
                          ),
                          SelfPickupCard(text: "Net Banking", isPressed: false),
                          SelfPickupCard(
                              text: "Credit/Debit/ATM card", isPressed: false),
                          SelfPickupCard(
                              text: "Direct Payment", isPressed: true),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ////
        ],
      ),
    );
  }
}
