import 'package:familysupermarket/screens/SignupScreen.dart';
import 'package:familysupermarket/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 280,
              ),
//        ClipPath(
//          child: Container(
//            width: MediaQuery.of(context).size.width,
//            height: 280.0,
//            decoration: BoxDecoration(
//              color: Color(0xFFF1E4ED),
//            ),
//          ),
//          clipper: BottomWaveClipper(),
//        ),
              ClipPath(
                clipper: ClippingClass(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 280.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        kDesignColor,
                        Colors.white,
                      ],
                      stops: [0.0, 1],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 280,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: AssetImage("images/logo.png"),
                  height: 130,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Welcome To",
                      style: TextStyle(
                        color: Color(0xFF740F53),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "FAMILY SUPERMARKET",
                      style: TextStyle(
                        color: Color(0xFF740F53),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            Navigator.pushNamed(context, LoginScreen.id);
                          });
                        },
                        child: Card(
                          color: Color(0xFF740F53),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 5),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New customer?",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF740F53),
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.pushNamed(context, SignupScreen.id);
                            });
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
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
    path.lineTo(0.0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 70);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
