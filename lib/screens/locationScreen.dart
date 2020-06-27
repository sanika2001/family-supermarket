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
        title: Text("Map"),
      ),
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(27.2038, 77.5011), zoom: 15),
      ),
    );
  }
}
