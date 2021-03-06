import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/constants.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:familysupermarket/components/DeliveryStatus.dart';
import 'package:familysupermarket/components/OrderDivider.dart';
import 'package:familysupermarket/components/OrderDetailsCard.dart';
import 'package:familysupermarket/components/PriceCard.dart';
import 'package:familysupermarket/bloc/detailBloc.dart';
import 'package:familysupermarket/models/detail.dart';
import 'package:familysupermarket/db/detail.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String id = '/orderdetails';
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  final DetailBloc _detailBloc = DetailBloc();
  DatabaseProvider _databaseProvider = DatabaseProvider();
  var database;

  Future getDB() async {
    database = await _databaseProvider.createDatabase();
    await _databaseProvider.insertDB(database);
  }

  @override
  void initState() {
    super.initState();
    getDB();
  }

  @override
  void dispose() {
    _detailBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            "Items",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                          ),
                        ),
                        OrderDivider(),
                        Container(
                          height: 220,
                          child: StreamBuilder<List<Detail>>(
                              stream: _detailBloc.details,
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<Detail>> snapshot) {
                                if (snapshot.hasError) {
                                  print(snapshot.error);
                                }
                                return snapshot.hasData
                                    ? ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: snapshot.data.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return OrderDetailsCard(
                                        detail: snapshot.data[index],
                                      );
                                    })
                                    : Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            "Delivery status",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                          ),
                        ),
                        OrderDivider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                        OrderDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Need help ?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        OrderDivider(),
                      ],
                    ),
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
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Shipping Details",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                          ),
                        ),
                        OrderDivider(),
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
                        ),
                        OrderDivider(),
                      ],
                    ),
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
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Price Details",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                          ),
                        ),
                        OrderDivider(),
                        PriceCard(
                          text1: "List price",
                          text2: "35",
                        ),
                        PriceCard(
                          text1: "Selling price",
                          text2: "35",
                        ),
                        PriceCard(
                          text1: "Discount",
                          text2: "35",
                        ),
                        PriceCard(
                          text1: "Taxes",
                          text2: "35",
                        ),
                        PriceCard(
                          text1: "Delivery charge",
                          text2: "35",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: OrderDivider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "TOTAL",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              Text(
                                "₹1320",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: OrderDivider(),
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
