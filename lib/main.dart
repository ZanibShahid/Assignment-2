// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sweet_heaven/pages/home.dart';
import 'package:sweet_heaven/pages/login.dart';
import 'package:sweet_heaven/pages/signup.dart';
import 'package:sweet_heaven/pages/splash.dart';
import 'package:sweet_heaven/pages/welcome.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'festive'),
    title: 'Sweet Heaven',
    routes: {
      "/": (context) => Splash_Screen(),
      "/welcome": (context) => Welcome(),
      "/signup": (context) => Signup(),
      "/log": (context) => log(),
      "/home": (context) => home()
    },
    debugShowCheckedModeBanner: false,
  ));
}
