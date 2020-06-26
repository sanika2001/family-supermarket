import 'package:familysupermarket/screens/SignupScreen.dart';
import 'package:familysupermarket/screens/supermarketscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/components/loginCard.dart';
import 'package:familysupermarket/components/signinCard.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 270.0,
              color: Color(0xFF740F53),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage("images/familylogo.png"),
                          height: 60,
                          width: 60,
                        ),
                      ),
                      loginCard(name: 'Mobile No'),
                      loginCard(name: 'Password'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 8),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xFF939393),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      signinCard(
                        name: 'Sign In',
                        onPress: () {
                          setState(() {
                            Navigator.pushNamed(context, SupermarketScreen.id);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have account?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF939393),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, SignupScreen.id);
                        });
                      },
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                          color: Color(0xFF741053),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Terms & Conditions",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xFF939393),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
