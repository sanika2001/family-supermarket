import 'package:familysupermarket/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/components/loginCard.dart';
import 'package:familysupermarket/components/signinCard.dart';
import 'package:familysupermarket/screens/locationScreen.dart';

class SignupScreen extends StatefulWidget {
  static const String id = '/Signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 280.0,
              color: Color(0xFF740F53),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Padding(
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
                            image: AssetImage("images/logo.png"),
                            height: 90,
                            width: 90,
                          ),
                        ),
                        loginCard(name: "Name"),
                        loginCard(
                          name: "Mobile No",
                          textinputtype: TextInputType.number,
                        ),
                        loginCard(
                          name: "Password",
                          obscuretext: true,
                        ),
                        signinCard(
                          name: "Sign Up",
                          onPress: () {
                            setState(() {
                              Navigator.pushNamed(context, locationScreen.id);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MediaQuery.of(context).viewInsets.bottom == 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Existing Customer?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xFF939393),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pushNamed(context, LoginScreen.id);
                              });
                            },
                            child: Text(
                              "  Sign In",
                              style: TextStyle(
                                color: Color(0xFF741053),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Row(),
            ],
          ),
          MediaQuery.of(context).viewInsets.bottom == 0
              ? Column(
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
                )
              : Column(),
        ],
      ),
    );
  }
}
