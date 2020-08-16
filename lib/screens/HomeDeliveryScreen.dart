import 'package:flutter/material.dart';
import 'package:familysupermarket/components/PurpleButton.dart';
import 'package:familysupermarket/components/SelfPickupCard.dart';

bool _isChecked1 = true;
bool _isChecked2 = false;
bool _isChecked3 = true;
bool _isChecked4 = false;
bool _isChecked5 = false;
bool _isChecked6 = false;

class HomeDeliveryScreen extends StatefulWidget {
  @override
  _HomeDeliveryScreenState createState() => _HomeDeliveryScreenState();
}

class _HomeDeliveryScreenState extends State<HomeDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 208,
          color: Color(0xFFE9E9E9),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 8),
                          child: Text(
                            "Delivery Address",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 15,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
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
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 1),
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              color: Color(0xFFE9E9E9),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 6),
                                                      child: Text(
                                                        "Quick Delivery",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF740F53),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 25),
                                                      child: Text(
                                                        "₹ 70",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Color(
                                                                0xFF5A5A5A)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                40,
                                            height: 46,
                                          ),
                                          Positioned(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                145,
                                            child: PurpleButton(
                                              isPressed: _isChecked1,
                                              onPress: () {
                                                setState(() {
                                                  _isChecked1 =
                                                      _isChecked1 == true
                                                          ? false
                                                          : true;
                                                  _isChecked2 =
                                                      _isChecked1 == true
                                                          ? false
                                                          : true;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              40,
                                          height: 46,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            color: Color(0xFFE9E9E9),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6),
                                                    child: Text(
                                                      "Normal Delivery",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF740F53),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 25),
                                                    child: Text(
                                                      "₹ 40",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color(
                                                              0xFF5A5A5A)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              145,
                                          child: PurpleButton(
                                            isPressed: _isChecked2,
                                            onPress: () {
                                              setState(() {
                                                _isChecked2 =
                                                    _isChecked2 == true
                                                        ? false
                                                        : true;
                                                _isChecked1 =
                                                    _isChecked2 == true
                                                        ? false
                                                        : true;
                                              });
                                            },
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 8),
                          child: Text(
                            "Order Summary",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Sub Total",
                                          style: TextStyle(
                                              color: Color(0xFF740F53),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "116",
                                          style: TextStyle(
                                              color: Color(0xFF740F53),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Delivery",
                                          style: TextStyle(
                                              color: Color(0xFF740F53),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "70",
                                          style: TextStyle(
                                              color: Color(0xFF740F53),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Total",
                                          style: TextStyle(
                                              color: Color(0xFF740F53),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "184",
                                          style: TextStyle(
                                              color: Color(0xFF740F53),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 8),
                          child: Text(
                            "Payment",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                ],
              ),
            ),
          ),
        ),
        ////
      ],
    );
  }
}
