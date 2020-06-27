import 'package:familysupermarket/components/loginCard.dart';
import 'package:flutter/material.dart';
import 'screens/supermarketscreen.dart';
import 'screens/loginScreen.dart';
import 'screens/SignupScreen.dart';
import 'screens/homeScreen.dart';
import 'screens/locationScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: locationScreen.id,
      routes: {
        SupermarketScreen.id: (context) => SupermarketScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        homeScreen.id: (context) => homeScreen(),
        locationScreen.id: (context) => locationScreen(),
      },
    );
  }
}
