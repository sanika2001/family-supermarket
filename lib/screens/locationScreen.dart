import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class locationScreen extends StatefulWidget {
  static const String id = '/location';
  @override
  _locationScreenState createState() => _locationScreenState();
}

class _locationScreenState extends State<locationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xFF464646),
          size: 30,
        ),
        backgroundColor: Color(0xFFE9E9E9),
        title: Text(
          "NEAREST  BRANCH",
          style: TextStyle(
            fontSize: 22,
            color: Color(0xFF740F53),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ButtonTheme(
                minWidth: 175,
                child: RaisedButton(
                  color: Color(0xFF740F53),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "SET LOCATION",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(27.2038, 77.5011), zoom: 15),
          ),
        ],
      ),
    );
  }
}

//Container(
//alignment: Alignment.bottomCenter,
//child: ButtonTheme(
//minWidth: 160,
//child: RaisedButton(
//onPressed: null,
//color: Color(0xFF740F53),
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(5),
//),
//child: Text("SET LOCATION"),
//textColor: Colors.white,
//),
//),
//),
