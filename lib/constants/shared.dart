import 'package:flutter/material.dart';
import 'package:flutter_being/constants/colors.dart';

const TextInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2
    ),
  ),

  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: tdText,
      width: 30,
    ),
  ),
);

String name = '';
String email = '';
String pass = '';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: tdBg,
    foregroundColor: tdText,
    shadowColor: tdBg,
    title: Container(
      height: 120,
      width: 100,
      child: Image(
        image: AssetImage('assets/logo.jpeg'),
        fit: BoxFit.cover,
      ),
    ),
  );
  }