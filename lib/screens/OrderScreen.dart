import 'package:familysupermarket/screens/OrderDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/components/orderCard.dart';
import 'package:familysupermarket/bloc/orderBloc.dart';
import 'package:familysupermarket/models/order.dart';
import 'package:familysupermarket/db/order.dart';

class OrderScreen extends StatefulWidget {
  static const String id = '/order';
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  final OrderBloc _orderBloc = OrderBloc();
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
    _orderBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        elevation: 0,
        title: Text(
          "MY ORDERS",
          style: TextStyle(
            color: Color(0xFF740F53),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.orange[200],
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 400,
          child: StreamBuilder<List<Order>>(
              stream: _orderBloc.orders,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Order>> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        order: snapshot.data[index],
                        onpress: (){
                          setState(() {
                            Navigator.pushNamed(context, OrderDetailsScreen.id);
                          });
                        },
                      );
                    })
                    : Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}
