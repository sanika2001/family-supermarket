import 'package:flutter/material.dart';
import 'package:familysupermarket/components/PurpleButton.dart';
import 'package:familysupermarket/components/SelfPickupCard.dart';

bool _isChecked3 = true;
bool _isChecked4 = false;
bool _isChecked5 = false;
bool _isChecked6 = false;

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
                            isPressed: _isChecked3,
                            onPress: () {
                              setState(() {
                                _isChecked3 =
                                    _isChecked3 == true ? false : true;
                                _isChecked4 =
                                    _isChecked3 == true ? false : true;
                                _isChecked5 =
                                    _isChecked3 == true ? false : true;
                                _isChecked6 =
                                    _isChecked3 == true ? false : true;
                              });
                            },
                          ),
                          SelfPickupCard(
                            text: "Net Banking",
                            isPressed: _isChecked4,
                            onPress: () {
                              setState(() {
                                _isChecked4 =
                                    _isChecked4 == true ? false : true;
                                _isChecked3 =
                                    _isChecked4 == true ? false : true;
                                _isChecked5 =
                                    _isChecked4 == true ? false : true;
                                _isChecked6 =
                                    _isChecked4 == true ? false : true;
                              });
                            },
                          ),
                          SelfPickupCard(
                            text: "Credit/Debit/ATM card",
                            isPressed: _isChecked5,
                            onPress: () {
                              setState(() {
                                _isChecked5 =
                                    _isChecked5 == true ? false : true;
                                _isChecked4 =
                                    _isChecked5 == true ? false : true;
                                _isChecked3 =
                                    _isChecked5 == true ? false : true;
                                _isChecked6 =
                                    _isChecked5 == true ? false : true;
                              });
                            },
                          ),
                          SelfPickupCard(
                            text: "Direct Payment",
                            isPressed: _isChecked6,
                            onPress: () {
                              setState(() {
                                _isChecked6 =
                                    _isChecked6 == true ? false : true;
                                _isChecked4 =
                                    _isChecked6 == true ? false : true;
                                _isChecked5 =
                                    _isChecked6 == true ? false : true;
                                _isChecked3 =
                                    _isChecked6 == true ? false : true;
                              });
                            },
                          ),
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
