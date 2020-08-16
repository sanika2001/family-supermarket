import 'package:familysupermarket/screens/SearchScreen.dart';
import 'package:familysupermarket/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'screens/supermarketscreen.dart';
import 'screens/loginScreen.dart';
import 'screens/SignupScreen.dart';
import 'screens/homeScreen.dart';
import 'screens/locationScreen.dart';
import 'screens/familyScreen.dart';
import 'screens/cartScreen.dart';
import 'screens/PaymentScreen.dart';
import 'screens/WelcomeScreen.dart';

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
        SearchScreen.id: (context) => SearchScreen(),
        ProfileSCreen.id: (context) => ProfileSCreen(),
        FamilyScreen.id: (context) => FamilyScreen(),
        CartScreen.id: (context) => CartScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        PaymentScreen.id: (context) => PaymentScreen(),
      },
    );
  }
}
