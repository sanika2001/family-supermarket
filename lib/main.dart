import 'package:flutter/material.dart';
import 'screens/supermarketscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SupermarketScreen.id,
      routes: {
        SupermarketScreen.id: (context) => SupermarketScreen(),
      },
    );
  }
}

