import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Your location',
  hintStyle: TextStyle(
    color: Color(0xFF939393),
    fontSize: 20,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFC4C4C4), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFC4C4C4), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
);

const kDesignColor = Color(0xFF740F53);
